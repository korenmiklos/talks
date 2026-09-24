# Data protection in model calls

A Hungarian Reveal.js deck for MIMCS (Mesterséges Intelligencia Munkacsoport) about a local proxy between a coding agent and a cloud model provider.

## Open the deck

Open `index.html` directly in a browser. It embeds Reveal.js, the speaker-notes plugin, styles, and fonts; no server or external asset is required.

## Files

- `index.html` is the standalone Reveal.js deck.
- `source/local_pii_proxy_landscape_v2.pptx` is the copied source deck.
- `server.mjs` implements the optional local PII proxy.

## Run the proxy

```sh
npm install
PII_REDACTOR=rampart npm start
curl http://127.0.0.1:4173/health
```

Start an isolated Pi session with:

```sh
./.pi/pi
```

This launcher disables `AGENTS.md`, `CLAUDE.md`, and skills while retaining the project privacy prompt.

## Proxy demonstration

`server.mjs` implements the local PII proxy.

- `POST /api/demo` runs local redaction and returns raw, redacted, and restored views.
- `POST /v1/chat/completions` is an OpenAI-compatible proxy for a coding agent and forwards requests to OpenRouter.
- `OPENROUTER_API_KEY` in `.env` enables OpenRouter forwarding; `UPSTREAM_URL` overrides it.
- Langfuse records raw local input and redacted provider traffic.
- `PII_REDACTOR=desert-ant` selects the native Desert Ant backend; `PII_REDACTOR=rampart` selects Rampart with its CPU ONNX classifier.
- Both backends use the same proxy contract and restore placeholders locally.
- Request redaction preserves JSON structure and OpenAI tool-call protocol fields.
- Streamed responses and tool arguments are restored locally, including placeholders split across chunks.
