import { createServer } from "node:http";
import { readFile } from "node:fs/promises";
import { extname, resolve, sep } from "node:path";
import { fileURLToPath } from "node:url";
import { randomBytes, randomUUID } from "node:crypto";
import { Redact } from "@desert-ant-labs/redact/native";
import { startActiveObservation, propagateAttributes } from "@langfuse/tracing";
import { langfuseEnabled, shutdownTelemetry } from "./instrumentation.mjs";
const root = resolve(fileURLToPath(new URL(".", import.meta.url)));

const upstream = (process.env.UPSTREAM_URL ?? (process.env.OPENROUTER_API_KEY ? "https://openrouter.ai/api" : undefined))?.replace(/\/$/, "");
const upstreamApiKey = process.env.UPSTREAM_API_KEY ?? process.env.OPENROUTER_API_KEY;
const port = Number(process.env.PORT ?? 4173);
const completionUrl = upstream && (upstream.endsWith("/v1/chat/completions") ? upstream : `${upstream}${upstream.endsWith("/v1") ? "" : "/v1"}/chat/completions`);
const maxBodyBytes = 2 * 1024 * 1024;
const contentTypes = {
  ".css": "text/css; charset=utf-8",
  ".html": "text/html; charset=utf-8",
  ".js": "text/javascript; charset=utf-8",
  ".svg": "image/svg+xml",
  ".woff2": "font/woff2"
};
let modelPromise;

function loadModel() {
  modelPromise ??= Redact.load();
  return modelPromise;
}

function sessionId(request, fallback = "proxy-demo") {
  const value = request.headers["x-pi-session-id"]
    ?? request.headers["x-session-id"]
    ?? request.headers["x-session-affinity"]
    ?? process.env.PII_PROXY_SESSION_ID
    ?? fallback;
  return String(value).replace(/[^\x21-\x7e]/g, "_").slice(0, 199);
}

function trace(name, id, callback, options) {
  if (!langfuseEnabled) return callback(null);
  return propagateAttributes({ sessionId: id }, () => startActiveObservation(name, callback, options));
}

function updateTrace(observation, attributes) {
  observation?.update(attributes);
}


function token(label) {
  return `<${label}:${randomBytes(4).toString("hex").toUpperCase()}>`;
}

function restore(value, mappings) {
  if (typeof value === "string") {
    for (const [placeholder, original] of mappings) value = value.split(placeholder).join(original);
    return value;
  }
  if (Array.isArray(value)) return value.map((item) => restore(item, mappings));
  if (value && typeof value === "object") return Object.fromEntries(Object.entries(value).map(([key, item]) => [key, restore(item, mappings)]));
  return value;
}

function redactIpAddresses(text, mappings) {
  return text.replace(/\b(?:\d{1,3}\.){3}\d{1,3}\b/g, (value) => {
    if (value.split(".").some((octet) => Number(octet) > 255)) return value;
    const placeholder = token("IP_ADDRESS");
    mappings.set(placeholder, value);
    return placeholder;
  });
}

function redactSecrets(text, mappings) {
  return text.replace(
    /\b([A-Z][A-Z0-9_-]*(?:PASSWORD|PASSWD|SECRET|TOKEN|API_KEY|PRIVATE_KEY))([ \t]*=[ \t]*)([^\s,;"']+)/gi,
    (match, key, separator, value) => {
      const placeholder = token("SECRET");
      mappings.set(placeholder, value);
      return `${key}${separator}${placeholder}`;
    }
  );
}

async function redactText(text) {
  const result = await (await loadModel()).redaction(text);
  const mappings = new Map();
  let redacted = result.redactedText;
  const detections = [];
  for (const item of result.items) {
    const placeholder = token(item.label);
    redacted = redacted.split(item.placeholder).join(placeholder);
    mappings.set(placeholder, item.original);
    detections.push({ label: item.label, token: placeholder, confidence: item.confidence });
  }
  redacted = redactIpAddresses(redacted, mappings);
  redacted = redactSecrets(redacted, mappings);
  for (const [placeholder] of mappings) {
    if (!detections.some((item) => item.token === placeholder)) {
      const label = placeholder.slice(1, placeholder.indexOf(":"));
      detections.push({ label, token: placeholder });
    }
  }
  return { redacted, mappings, detections };
}

async function redactPayload(payload) {
  const result = await redactText(JSON.stringify(payload));
  return { payload: JSON.parse(result.redacted), ...result };
}
function restoreStreamText(text, mappings, state) {
  const combined = `${state.pending}${text}`;
  const partial = combined.lastIndexOf("<");
  if (partial >= 0 && /^<[A-Z_]+:[A-F0-9]*$/i.test(combined.slice(partial))) {
    state.pending = combined.slice(partial);
    return restore(combined.slice(0, partial), mappings);
  }
  state.pending = "";
  return restore(combined, mappings);
}

async function streamProviderResponse(providerResponse, response, mappings) {
  response.writeHead(providerResponse.status, {
    "content-type": "text/event-stream; charset=utf-8",
    "cache-control": "no-cache",
    connection: "keep-alive"
  });
  const decoder = new TextDecoder();
  let buffer = "";
  let redactedText = "";
  let restoredText = "";
  const state = { pending: "" };
  for await (const chunk of providerResponse.body) {
    buffer += decoder.decode(chunk, { stream: true });
    let newline;
    while ((newline = buffer.indexOf("\n")) >= 0) {
      const line = buffer.slice(0, newline).replace(/\r$/, "");
      buffer = buffer.slice(newline + 1);
      if (!line.startsWith("data:")) {
        response.write(`${line}\n`);
        continue;
      }
      const payload = line.slice(5).trimStart();
      if (payload === "[DONE]") {
        if (state.pending) {
          const tail = restore(state.pending, mappings);
          restoredText += tail;
          response.write(`data: ${JSON.stringify({ choices: [{ index: 0, delta: { content: tail } }] })}\n\n`);
          state.pending = "";
        }
        response.write("data: [DONE]\n\n");
        continue;
      }
      let providerBody;
      try { providerBody = JSON.parse(payload); } catch { response.write(`${line}\n\n`); continue; }
      const clientBody = structuredClone(providerBody);
      for (const choice of clientBody.choices ?? []) {
        const content = choice.delta?.content;
        if (typeof content === "string") {
          redactedText += content;
          const restoredContent = restoreStreamText(content, mappings, state);
          restoredText += restoredContent;
          choice.delta.content = restoredContent;
        }
      }
      response.write(`data: ${JSON.stringify(clientBody)}\n\n`);
    }
  }
  if (buffer) response.write(buffer);
  response.end();
  return { redactedText, restoredText };
}

async function readJson(request) {
  let size = 0;
  const chunks = [];
  for await (const chunk of request) {
    size += chunk.length;
    if (size > maxBodyBytes) throw new Error("Request body exceeds 2 MB");
    chunks.push(chunk);
  }
  return JSON.parse(Buffer.concat(chunks).toString("utf8"));
}

function send(response, status, body) {
  response.writeHead(status, { "content-type": "application/json; charset=utf-8", "cache-control": "no-store" });
  response.end(JSON.stringify(body));
}

async function serve(pathname, response) {
  let relativePath;
  try {
    relativePath = decodeURIComponent(pathname).replace(/^[/\\]+/, "");
  } catch {
    return false;
  }
  if (relativePath.split(/[\\/]+/).includes("..")) return false;

  const filename = resolve(root, relativePath);
  if (!filename.startsWith(`${root}${sep}`)) return false;
  try {
    const body = await readFile(filename);
    response.writeHead(200, { "content-type": contentTypes[extname(filename)] ?? "application/octet-stream", "cache-control": "no-store" });
    response.end(body);
    return true;
  } catch {
    return false;
  }
}

async function handle(request, response) {
  const url = new URL(request.url, `http://${request.headers.host || "localhost"}`);
  if (request.method === "GET") {
    if (url.pathname === "/" && await serve("/public/index.html", response)) return;
    if (url.pathname === "/slides" && await serve("/index.html", response)) return;
    if (url.pathname === "/app.css" && await serve("/public/app.css", response)) return;
    if (url.pathname === "/app.js" && await serve("/public/app.js", response)) return;
    if (["/style.css", "/assets", "/vendor"].some((prefix) => url.pathname === prefix || url.pathname.startsWith(`${prefix}/`)) && await serve(url.pathname, response)) return;
  }
  if (request.method === "GET" && url.pathname === "/health") return send(response, 200, { ok: true, model: "@desert-ant-labs/redact", upstream: Boolean(upstream) });

  if (request.method === "POST" && url.pathname === "/api/demo") {
    try {
      const body = await readJson(request);
      if (typeof body.text !== "string" || !body.text.trim()) return send(response, 400, { error: "text must be a non-empty string" });
      const id = sessionId(request);
      return trace("proxy.incoming", id, async (incoming) => {
        updateTrace(incoming, {
          input: body.text,
          metadata: { app: "pii-proxy", channel: "incoming", sessionId: id }
        });
        const result = await trace("desert-ant.incoming", id, async (desertAntInput) => {
          updateTrace(desertAntInput, {
            input: body.text,
            metadata: { app: "desert-ant", channel: "incoming" }
          });
          return redactText(body.text);
        });
        await trace("desert-ant.output", id, async (desertAntOutput) => {
          updateTrace(desertAntOutput, {
            output: { redacted: result.redacted, gates: result.detections },
            metadata: { app: "desert-ant", channel: "redacted-output" }
          });
        });
        const output = {
          traceId: randomUUID(), sessionId: id, input: body.text, redacted: result.redacted,
          restored: restore(result.redacted, result.mappings), remoteView: result.redacted,
          detections: result.detections
        };
        await trace("proxy.user-output", id, async (userOutput) => {
          updateTrace(userOutput, {
            output: output.restored,
            metadata: { app: "pii-proxy", channel: "outgoing" }
          });
        });
        return send(response, 200, output);
      });
    } catch (error) {
      return send(response, 400, { error: error instanceof Error ? error.message : "Could not redact input" });
    }
  }

  if (request.method === "POST" && url.pathname === "/v1/chat/completions") {
    try {
      if (!upstream) return send(response, 503, { error: "Set UPSTREAM_URL and UPSTREAM_API_KEY to enable forwarding" });
      const body = await readJson(request);
      const id = sessionId(request);
      return trace("proxy.incoming", id, async (incoming) => {
        updateTrace(incoming, {
          input: body,
          metadata: { app: "pii-proxy", channel: "incoming", sessionId: id, route: "/v1/chat/completions" }
        });
        const result = await trace("desert-ant.incoming", id, async (desertAntInput) => {
          updateTrace(desertAntInput, {
            input: body,
            metadata: { app: "desert-ant", channel: "incoming" }
          });
          return redactPayload(body);
        });
        await trace("desert-ant.output", id, async (desertAntOutput) => {
          updateTrace(desertAntOutput, {
            output: { payload: result.payload, gates: result.detections },
            metadata: { app: "desert-ant", channel: "redacted-output" }
          });
        });
        const providerResponse = await trace("openrouter.incoming", id, async (openRouterInput) => {
          updateTrace(openRouterInput, {
            input: result.payload,
            metadata: { app: "openrouter", channel: "outgoing" }
          });
          return fetch(completionUrl, {
            method: "POST",
            headers: { "content-type": "application/json", ...(upstreamApiKey ? { authorization: `Bearer ${upstreamApiKey}` } : {}) },
            body: JSON.stringify(result.payload)
          });
        });
        if (body.stream && providerResponse.ok && providerResponse.body) {
          const streamed = await trace("openrouter.output", id, async (openRouterOutput) => {
            const output = await streamProviderResponse(providerResponse, response, result.mappings);
            updateTrace(openRouterOutput, {
              output: { redactedText: output.redactedText },
              metadata: { app: "openrouter", channel: "incoming" }
            });
            return output;
          });
          await trace("proxy.user-output", id, async (userOutput) => {
            updateTrace(userOutput, {
              output: streamed.restoredText,
              metadata: { app: "pii-proxy", channel: "outgoing" }
            });
          });
          return;
        }
        const text = await providerResponse.text();
        let providerBody;
        try { providerBody = JSON.parse(text); } catch { providerBody = { choices: [{ message: { role: "assistant", content: text } }] }; }
        await trace("openrouter.output", id, async (openRouterOutput) => {
          updateTrace(openRouterOutput, {
            output: providerBody,
            metadata: { app: "openrouter", channel: "incoming" }
          });
        });
        const restored = restore(providerBody, result.mappings);
        await trace("proxy.user-output", id, async (userOutput) => {
          updateTrace(userOutput, {
            output: restored,
            metadata: { app: "pii-proxy", channel: "outgoing" }
          });
        });
        return send(response, providerResponse.status, restored);
      });
    } catch (error) {
      return send(response, 400, { error: error instanceof Error ? error.message : "Proxy request failed" });
    }
  }
  send(response, 404, { error: "Not found" });
}

const server = createServer((request, response) => handle(request, response).catch((error) => send(response, 500, { error: error.message })));
server.listen(port, "127.0.0.1", () => {
  console.log(`PII proxy running at http://127.0.0.1:${port}`);
  console.log(upstream ? `Forwarding to ${upstream}` : "Demo mode: no upstream configured");
  console.log(langfuseEnabled ? "Langfuse tracing enabled" : "Langfuse tracing disabled");
});

for (const signal of ["SIGINT", "SIGTERM"]) {
  process.on(signal, async () => {
    server.close();
    await shutdownTelemetry();
    process.exit(0);
  });
}
