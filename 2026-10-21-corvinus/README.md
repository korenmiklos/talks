# Corvinus Workshop — Source Materials

## Diagrams (fig/)

- `tradeoff-scatter.svg` — Cost vs capability scatter (from June 2026 workshop). **Needs regeneration** — uses old Epoch AI data + OpenRouter API which has since changed structure.
- `open-closed-eci-gap.svg` — Open-model catch-up (from June 2026 workshop). **Needs regeneration** — data structure changed.
- `openrouter-token-share.svg` + `openrouter-token-share-source.png` — Weekly token share by model origin. Source: OpenRouter API stats.
- `transformer-next-token.svg`, `harness-tools-llm.svg`, `chat-roles.svg` — Architecture/stack diagrams. Still current.
- `scatter_value_lots.png` — From tender-home-bias-ai output.

## Fresh Data (epoch_benchmark_data.zip, Oct 20 2026)

**Source:** https://epoch.ai/data — Capabilities & benchmarking dataset, updated Oct 20 2026.

### ECI Scores (`epoch_capabilities_index/eci_scores.csv`)
- **277 models** with ECI scores (150 closed, 127 open-weight)
- **43 models released since June 2026** — significant new entries
- Key findings vs old (June 2026) data:

| Metric | June 2026 (old) | Oct 2026 (new) |
|--------|:-:|:-:|
| Top closed ECI | 162.0 (GPT-5.5 Pro) | **166.8** (Claude Opus 5.5) |
| Top open ECI | 150.9 (Kimi K2.6) | **157.4** (Kimi K3) |
| Open-closed gap | ~8 pts (≈4 mo) | **~9.4 pts** |

### Top new models since June 2026:
- Claude Opus 5.5 — 166.8 (Sep 2026, Anthropic)
- GPT-6 Astra — 166.4 (Sep 2026, OpenAI)
- GPT-6.1 Sol — 166.3 (Sep 2026, OpenAI)
- Claude Fable 5.1 — 164.7 (Sep 2026, Anthropic)
- Gemini 4 Argon — 164.6 (Sep 2026, Google DeepMind)
- Kimi K3 — **157.4** (Jul 2026, Moonshot) — top open-weight

### Other new files
- `epoch_capabilities_index/edi_scores.csv` — Epoch Difficulty Index (benchmark difficulty)
- `epoch_capabilities_index/processed_data_for_eci.csv` — Per-benchmark performance data
- `epoch_capabilities_index/eci_bootstraps.json` — Bootstrap confidence intervals
- `model_metadata.csv` — Model metadata (training compute, org, etc.)
- `benchmark_metadata.csv` — Benchmark descriptions

### Regeneration needed
The old `generate-tradeoff-scatter.py` and `generate-eci-gap.py` scripts reference:
1. `epoch_capabilities_index.csv` (old flat file) → now `epoch_capabilities_index/eci_scores.csv`
2. OpenRouter API at `/api/frontend/v1/catalog/models` — API structure changed (no more `status_heuristics`, nested endpoint pricing)
3. Need to update both scripts to work with new data formats

## Code & Data (programs/, root)

- `tender-main.do` + `programs/config.do` + `programs/01_dataprep_main.do` — From codedthinking/tender-home-bias-ai.
- `table_home_bias.tex` — Regression output from the same.
- `index.html` — Slide deck outline (titles only, no content yet)
- `css/theme-9x.css` — 9x Academic design system theme from ai-slides-template

## Repos Referenced

- **Workshop deck:** codedthinking/2026-06-11-ai-workshop (live at codedthinking.github.io/2026-06-11-ai-workshop)
- **Template:** codedthinking/ai-slides-template
- **TED pipeline:** codedthinking/tender-home-bias-ai
- **Companion site:** codedthinking/ai-workshop (Jekyll, 2026-06-11/ dir has session replays)
- **AIHR talk:** korenmiklos/talks/2026-07-22-aihr

## Still To Source

- OpenAI Navier-Stokes image (GPT-4 blog, Cloudflare-blocked)
- Matrix scenes ("no spoon", steak vs protein, helicopter)
- "Emerging market of intelligence" paper (OpenRouter price elasticity)
- Loom pricing/availability
- Zoho One screen recording
