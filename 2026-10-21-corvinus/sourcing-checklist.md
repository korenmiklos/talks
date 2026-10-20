# Workshop sourcing checklist

Checked 2026-10-20 for the Corvinus workshop on 2026-10-21. Existing repository files were treated as leads, not as authoritative evidence. This pass adds sources and copies of existing materials only.

## Status and outstanding decisions

| Item | Status |
| --- | --- |
| Reveal.js template | Verified repository and implementation |
| Logistics deck | Verified the supplied PDF, including pages 13 and 16 |
| Navier-Stokes image | Extracted exact image and verified original OpenAI post |
| Open-model catch-up chart | Extracted exact chart and verified Epoch attribution |
| Cost/capability frontier | Selected original-source alternative; old local chart needs qualification |
| OpenRouter usage, task and speed figures | Selected sources and recorded measurement differences |
| OpenRouter economics paper | Located and inspected PDF, including Figure 21 and Table 2 |
| TED code and documentation | Copied existing source code; official codebook located |
| TED raw data | Official download identified; data bytes and reported row counts not verified in this pass |
| Version without documentation | None found in inspected branches/history |
| Model/harness references | Verified source repositories and brand/source pages |
| Matrix visuals | See [Matrix visuals](matrix-visuals.md); video playback remains unverified |
| Workshop language | Unconfirmed; English slide headings do not establish spoken language |
| Exact Claude/OpenAI model versions | Not established by the sourcing checklist |
| Personal Zoho One recording | Not located |
| Loom | Public availability, limits and displayed prices checked; account access not tested |

## Existing material and repositories

### Reveal.js template

[AI Slides Template](https://github.com/codedthinking/ai-slides-template/tree/b885727dba1319160571500570cc2925d0d260ad) is the actual template repository. Its README and HTML specify Reveal.js 5.1, the 9x Academic theme, speaker notes and lazy-loaded video embeds. The repository is MIT licensed.

The older [June workshop](https://github.com/codedthinking/2026-06-11-ai-workshop/tree/ea2f2c1e378b957bbf589d73a2421df76a031a9e) contains chart-generation scripts and original SVGs. Those are useful for provenance, but their source URLs, dates and transformations must be checked before reuse.

### Logistics conference deck

The authoritative source supplied by the presenter is [slides30.pdf](https://github.com/korenmiklos/talks/blob/master/2026-10-16-mlbkt/slides30.pdf), a 25-page deck. The similarly named `slides.pptx` in that folder is a four-slide template stub and should not be used as the content source.

Exact embedded images were extracted from the PDF without redrawing:

| PDF page | Asset copied here | Identification |
| --- | --- | --- |
| 13 | [Vortex image](sources/navier-stokes-from-logistics.jpeg) | Blue/teal/orange vortex labelled inward spiral and axial stretching |
| 16 | [Open-model catch-up](sources/epoch-catch-up-from-logistics.jpeg) | Epoch ECI chart, open versus closed weights, CC-BY attribution |

## Topic 1: models and trade-offs

### OpenAI Navier-Stokes image

The image on page 13 matches the vortex illustration in OpenAI's [On the Navier-Stokes Millennium Prize Problem](https://openai.com/index/navier-stokes-solution/), published September 8, 2026. The post's image caption describes local incompressible motion with inward spiraling and axial stretching.

The original light-background asset is linked in the page HTML: [OpenAI vortex image](https://images.ctfassets.net/kftzwdyauwt9/75EbpsuBOy5LbUgCppWXD1/88da8c19dcf76d6f4f8fd7485dcb6346/navier-stokes-light-master.png). The copy extracted from the supplied deck is ready above.

The earlier lead to the March 2023 GPT-4 announcement was incorrect for this image. Credit OpenAI and the September 2026 post. No open image licence was established.

### Cost-versus-capability frontier

Select the Benchmarks scatter on [OpenRouter Rankings](https://openrouter.ai/rankings), with its Show Pareto option. Its axes are weighted average input price and Artificial Analysis Intelligence Index. Attribute the capability measure to Artificial Analysis via OpenRouter. Do not label input-token price as the complete cost of a research task.

The page was checked on October 20, 2026. Its usage section says data through October 19, 2026; that date must not automatically be assigned to every benchmark or price observation on the page. A final screenshot/export should retain its own capture date and benchmark vintage.

The existing `fig/tradeoff-scatter.svg` is a historical custom chart. Its [generator](https://github.com/codedthinking/2026-06-11-ai-workshop/blob/ea2f2c1e378b957bbf589d73a2421df76a031a9e/assets/diagrams/generate-tradeoff-scatter.py) combines Epoch ECI with OpenRouter input-token pricing. Some capabilities are extrapolated from another index using a fitted relationship. It therefore should not be presented as a chart containing only measured ECI scores or as a current October snapshot.

### Open-model catch-up

The logistics PDF's page 16 is an Epoch chart, not an OpenRouter chart. Original source:

Edwards, J., & Emberson, L. (2026, May 29). [Open models lag state-of-the-art closed models by 4 months](https://epoch.ai/data-insights/open-closed-eci-gap). Epoch AI.

The source describes an average lag since January 2026, not a universal four-month lag for every model or task. The deck image carries an Epoch CC-BY credit.

The separate local SVG in the Corvinus folder comes from a June workshop [generator](https://github.com/codedthinking/2026-06-11-ai-workshop/blob/ea2f2c1e378b957bbf589d73a2421df76a031a9e/assets/diagrams/generate-eci-gap.py). It is a custom running-maximum chart, not the exact published image used in the logistics PDF. Its annotation includes a fixed gap claim. Prefer the extracted published chart when reusing the logistics material.

### OpenRouter figures selected

Use the original [Rankings page](https://openrouter.ai/rankings) and its [Data API documentation](https://openrouter.ai/docs/cookbook/administration/data-api). Checked October 20, 2026; public usage was dated through October 19.

| Figure | Selection | Interpretation and source check |
| --- | --- | --- |
| Top models over time / weekly leaderboard | Use | Tokens through OpenRouter, not number of users, quality, or global market share |
| Model-author market share | Optional | The page defines this chart in requests; do not relabel it token share |
| Models by task | Use | Shows that usage varies by workload; retain the displayed task and metric, including spend where specified |
| Speed | Optional | Separate throughput from time to first token; use the same provider/configuration when comparing models |
| Cost/capability Pareto | Use | Artificial Analysis scores via OpenRouter; keep pricing definition explicit |
| Price sensitivity | Use the paper below | A current leaderboard is not an estimate of price elasticity |

OpenRouter documents its public aggregated rankings data as CC BY 4.0. Use the endpoint's own source citation and `meta.as_of` for a downloaded dataset. Private traffic is excluded, and model tokenizers differ. The data API currently requires an OpenRouter API key; no authenticated data export was obtained in this pass.

The existing June token-share image and SVG have not been established as an October snapshot. Do not use them to report current market shares.

### Economics paper and price-elasticity figure

Demirer, M., Fradkin, A., Tadelis, N., & Peng, S. (2025, December 12). *The emerging market for intelligence: Pricing, supply, and demand for LLMs*. [Author-hosted PDF](https://andreyfradkin.com/assets/LLM_Demand_12_12_2025.pdf). [NBER listing](https://www.nber.org/papers/w34608).

The author-hosted PDF was downloaded and inspected. The NBER page was blocked during retrieval. The dated author PDF is the inspected version, not a claim about the newest revision.

Select Figure 21, printed page 36, PDF page 37: residualized token usage against provider context length, latency, throughput and price. Panel (d) supplies the price figure. Table 2, printed page 37, reports the elasticity specifications.

The analysis concerns model-provider-day demand for open models. It does not identify economy-wide demand for intelligence. Provider substitution, routing decisions and endogenous provider performance matter. Preserve the panel notes when using the figure.

### Model and harness source links

The exact model versions used in the comparison remain a presenter decision. Do not infer them from the current leaderboard or from mock entries.

| Item | Primary source / asset route |
| --- | --- |
| Claude models | [Claude](https://claude.com/) and the selected model's official model card; use the product mark rather than inventing a separate model logo |
| OpenAI models | [OpenAI design guidelines and logo downloads](https://openai.com/brand/); label the exact selected model separately |
| OpenCode | [Repository](https://github.com/anomalyco/opencode), [official brand assets](https://opencode.ai/brand) |
| Claude Code | [Official repository](https://github.com/anthropics/claude-code) |
| Codex | [Official repository](https://github.com/openai/codex), [OpenAI brand source](https://openai.com/brand/) |
| OMP | [can1357/oh-my-pi](https://github.com/can1357/oh-my-pi); OMP here means Oh My Pi |
| Hermes | [NousResearch/hermes-agent](https://github.com/NousResearch/hermes-agent); distinguish the agent from Hermes model releases |

Source repositories and official brand pages were checked. The [local logo pack](fig/logos/README.md) now contains SVGs, transparent PNGs, a preview and source notes for the presenter's requested set, including Meta as the Muse-model substitute. Repository code licences do not automatically grant trademark rights.

## TED materials and live exercises

### Source package

Pinned source: [codedthinking/tender-home-bias-ai](https://github.com/codedthinking/tender-home-bias-ai/tree/76d3a5cac2e54ccfab94066ef73367c53352b9f4).

An unchanged copy of its README, licence and all existing Stata do-files is in [sources/ted-code](sources/ted-code). This is a source snapshot, not a validated replication run.

The code identifies the raw input as the 2023 TED CAN export and the four-column extract as buyer country, seller country, CPV and award value. The four-column extract omits IDs and text, so it is insufficient for either the duplication exercise or text classification.

| Material | Location |
| --- | --- |
| Raw data distribution | [2023 contract award notices ZIP](https://data.europa.eu/api/hub/store/data/ted-contract-award-notices-2023.zip) |
| Dataset catalogue | [TED CSV](https://data.europa.eu/data/datasets/ted-csv?locale=en) |
| Official dictionary | [TED Notes & Codebook v3.6](https://data.europa.eu/api/hub/store/data/ted-csv-data-information-v3-6.pdf), January 18, 2024 |
| Original package dictionary/provenance | [Snapshot README](sources/ted-code/README.md) |
| Country-pair/CPV fact table construction | [aggregate.do](sources/ted-code/programs/02_analysis/aggregate.do) |
| Regression table | [Original table_home_bias.tex](https://github.com/codedthinking/tender-home-bias-ai/blob/76d3a5cac2e54ccfab94066ef73367c53352b9f4/output/table_home_bias.tex) |
| Existing code examples | [Source snapshot](sources/ted-code/programs) |

The original README links codebook v3.5 through an obsolete URL. The official v3.6 PDF was retrieved and inspected. Raw and derived datasets are not committed in the source repository. Its claimed file sizes, row counts and software runtimes were not independently reproduced here.

### Documentation-free version

Only `main` was found among the repository's branches. All three commits in the inspected history were checked, and the initial commit already contains the detailed README. No existing version without data documentation was identified.

For the exercise, the full CAN CSV would retain the fields needed to investigate grain and duplication. A separate exercise copy with documentation withheld still needs to be prepared. No files were removed from the original package.

### Which amounts can be summed

Use official codebook section 3, its grain/ID table, and Annex I. The documentation identifies notice-, lot- and award-level fields, and warns that flattening repeats information.

| Fields / metadata | Why they are needed |
| --- | --- |
| `ID_NOTICE_CAN`, `ID_AWARD` | Notice and award identifiers for defining the unit and checking duplication |
| `ID_LOT`, `ID_LOT_AWARDED` | Lot relationships, which can be incomplete or inconsistent |
| `VALUE_EURO*` | Notice totals, potentially repeated across CSV rows |
| `AWARD_VALUE_EURO`, `AWARD_VALUE_EURO_FIN_1` | Award amounts; the latter has documented fallback construction |
| `B_FRA_AGREEMENT`, `B_FRA_CONTRACT`, `CANCELLED`, `INFO_ON_NON_AWARD` | Framework, cancellation and non-award context |
| `XSD_VERSION`, publication date | Form-version differences and the 2023 eForms transition |

Check names and fill rates against the actual downloaded vintage before the demo. Summing all CSV rows is not justified merely by choosing an award-value column. The existing aggregator does not explicitly deduplicate awards before summing, so its correctness remains a question to investigate.

### Text classification in the same data

Use procurement-title classification rather than sentiment. The official codebook lists `TITLE` at contract-award level. A suitable task is to assign broad procurement categories to titles, then compare with broad CPV categories. A green-procurement or digital-procurement label is another possible classification task, but it needs human-labelled validation rather than treating CPV as definitive ground truth.

Inspect title availability and language in the actual CSV first. The short four-column extract cannot support this exercise. Tender titles are administrative descriptions, so positive/negative sentiment has no clear substantive interpretation here.

### Skill repositories

Use a small set of identifiable sources:

- [The TED package's own skills](https://github.com/codedthinking/tender-home-bias-ai/tree/76d3a5cac2e54ccfab94066ef73367c53352b9f4/.agents/skills): Stata conventions, README maintenance and data verification.
- [Anthropic's skills](https://github.com/anthropics/skills): official examples, including skill creation.
- [OpenAI's skills](https://github.com/openai/skills): official Codex skill catalogue.

These are examples to inspect and adapt, not a claim that every skill is appropriate for the course.

## Language, recording and final checks

The workshop's spoken language remains unconfirmed. The English HTML outline and Hungarian logistics talk do not establish the Corvinus workshop language. Subtitle selection remains open.

No personal Zoho One demo recording was located. Public recording-product documentation cannot establish that the intended recording exists or that the presenter's account has access.

[Loom pricing](https://www.loom.com/pricing), checked October 20, 2026, displays Starter at $0, Business at $18/user/month, and Business + AI at $24/user/month. The page offers a separate annual-billing discount, so record the billing selection when quoting a purchase price. Starter permits 25 videos per person and five-minute screen recordings; Business lists unlimited recording time. The public service is available, but the presenter's account and a successful recording were not tested.

Before the workshop, the remaining source checks are the actual TED data vintage/schema, the chosen model versions, workshop language, personal recording location, and playback of the Matrix embeds.
