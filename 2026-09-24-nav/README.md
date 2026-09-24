# Adatvedelem a felho elott

A Hungarian Reveal.js presentation for NAV.

## Present

Run the local server from this folder:

```sh
npm start
```

Open `http://127.0.0.1:4173/slides` in a browser. Use the arrow keys to navigate. Press `S` for speaker notes.

## Files

- `index.html` is the Reveal.js deck.
- `style.css` contains the koren.dev and Coded Thinking visual system.
- `source/local_pii_proxy_landscape_v2.pptx` is the copied source deck.
- `vendor/reveal/` contains the local Reveal.js runtime.

## Run the local PII proxy

The same server serves the proxy demo at `http://127.0.0.1:4173/`.

- `POST /api/demo` runs local redaction and shows the raw, dehydrated, and restored views.
- `POST /v1/chat/completions` is an OpenAI-compatible proxy for Pi and forwards to OpenRouter.
- `OPENROUTER_API_KEY` in `.env` enables OpenRouter forwarding; `UPSTREAM_URL` can override it.
- Langfuse records raw local input and redacted provider traffic. Sessions use Pi's session-affinity headers.

Pi is configured globally in `~/.pi/agent/models.json` and `settings.json` to use this proxy by default.
