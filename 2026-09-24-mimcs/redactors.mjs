import { randomBytes } from "node:crypto";
import { Redact } from "@desert-ant-labs/redact/native";
import { createGuard, detectNer, loadNerClassifier } from "@nationaldesignstudio/rampart";

const configuredName = (process.env.PII_REDACTOR ?? "desert-ant").trim().toLowerCase();
const redactorNames = new Set(["desert-ant", "rampart"]);
if (!redactorNames.has(configuredName)) {
  throw new Error(`PII_REDACTOR must be one of: ${[...redactorNames].join(", ")}`);
}

let desertAntPromise;
let rampartClassifierPromise;
const rampartSessions = new Map();
const maxRampartSessions = 64;
const rampartSessionTtlMs = 30 * 60 * 1000;

function token(label) {
  return `<${label}:${randomBytes(4).toString("hex").toUpperCase()}>`;
}

function replaceAll(value, from, to) {
  return value.split(from).join(to);
}

function labelFromRampartToken(value) {
  return value.slice(1, value.lastIndexOf("_"));
}

async function getDesertAnt() {
  desertAntPromise ??= Redact.load();
  return desertAntPromise;
}

async function getRampartClassifier() {
  rampartClassifierPromise ??= loadNerClassifier({ device: "cpu" });
  return rampartClassifierPromise;
}
async function getRampart(sessionId) {
  const now = Date.now();
  const existing = rampartSessions.get(sessionId);
  if (existing && now - existing.lastUsed < rampartSessionTtlMs) {
    existing.lastUsed = now;
    rampartSessions.delete(sessionId);
    rampartSessions.set(sessionId, existing);
    return existing.promise;
  }
  if (existing) rampartSessions.delete(sessionId);
  while (rampartSessions.size >= maxRampartSessions) rampartSessions.delete(rampartSessions.keys().next().value);
  const promise = (async () => {
    const classifier = await getRampartClassifier();
    const guard = await createGuard({ ner: (text) => detectNer(text, classifier, 0.4) });
    return { guard, tokenMap: new Map() };
  })();
  rampartSessions.set(sessionId, { promise, lastUsed: now });
  return promise;
}

async function redactWithDesertAnt(text) {
  const model = await getDesertAnt();
  const result = await model.redaction(text);
  const mappings = new Map();
  let redactedText = result.redactedText;
  const detections = [];
  for (const item of result.items) {
    const placeholder = token(item.label);
    redactedText = replaceAll(redactedText, item.placeholder, placeholder);
    mappings.set(placeholder, item.original);
    detections.push({ label: item.label, token: placeholder, confidence: item.confidence });
  }
  return {
    backend: "desert-ant",
    redactedText,
    detections,
    restore(value) {
      let restored = value;
      for (const [placeholder, original] of mappings) restored = replaceAll(restored, placeholder, original);
      return restored;
    }
  };
}

async function redactWithRampart(text, sessionId) {
  const { guard, tokenMap } = await getRampart(sessionId);
  const result = await guard.protect(text);
  for (const placeholder of result.placeholders) {
    if (!tokenMap.has(placeholder)) tokenMap.set(placeholder, token(labelFromRampartToken(placeholder)));
  }
  let redactedText = result.text;
  for (const [placeholder, proxyToken] of tokenMap) redactedText = replaceAll(redactedText, placeholder, proxyToken);
  return {
    backend: "rampart",
    redactedText,
    detections: [...tokenMap]
      .filter(([placeholder]) => result.placeholders.includes(placeholder))
      .map(([placeholder, proxyToken]) => ({
        label: labelFromRampartToken(placeholder),
        token: proxyToken
      })),
    restore(value) {
      let rampartText = value;
      for (const [placeholder, proxyToken] of tokenMap) rampartText = replaceAll(rampartText, proxyToken, placeholder);
      return guard.reveal(rampartText);
    }
  };
}

export function redactorName() {
  return configuredName;
}

export async function redact(text, sessionId) {
  return configuredName === "rampart"
    ? redactWithRampart(text, sessionId)
    : redactWithDesertAnt(text);
}
