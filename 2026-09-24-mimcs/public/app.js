const input = document.querySelector("#input");
const run = document.querySelector("#run");
const status = document.querySelector("#status");
const latency = document.querySelector("#latency");
const raw = document.querySelector("#raw");
const remote = document.querySelector("#remote");
const restored = document.querySelector("#restored");
const detections = document.querySelector("#detections");

function escapeHtml(value) {
  return value.replace(/[&<>"']/g, (character) => ({ "&": "&amp;", "<": "&lt;", ">": "&gt;", '"': "&quot;", "'": "&#039;" }[character]));
}

function showDetections(items) {
  if (!items.length) {
    detections.innerHTML = '<span class="muted">No spans detected.</span>';
    return;
  }
  detections.innerHTML = items.map((item) => `<div class="detection"><strong>${escapeHtml(item.label)}</strong><code>${escapeHtml(item.token)}</code></div>`).join("");
}

async function demo() {
  run.disabled = true;
  status.textContent = "RUNNING";
  status.className = "status busy";
  latency.textContent = "Loading the local model if needed…";
  const started = performance.now();
  try {
    const response = await fetch("/api/demo", {
      method: "POST",
      headers: { "content-type": "application/json" },
      body: JSON.stringify({ text: input.value })
    });
    const result = await response.json();
    if (!response.ok) throw new Error(result.error || "Redaction failed");
    raw.textContent = result.input;
    remote.textContent = result.remoteView;
    restored.textContent = result.restored;
    showDetections(result.detections);
    status.textContent = "LOCAL ONLY";
    status.className = "status";
    latency.textContent = `${Math.round(performance.now() - started)} ms · trace ${result.traceId.slice(0, 8)}`;
  } catch (error) {
    status.textContent = "ERROR";
    status.className = "status error";
    latency.textContent = error.message;
  } finally {
    run.disabled = false;
  }
}

run.addEventListener("click", demo);
demo();
