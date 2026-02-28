---
title: Vibe Coding Kills Open Source
author: Miklós Koren, Gábor Békés, Julian Hinz, Aaron Lohmann
date: February 2026
---

##

![](fig/steinberger.jpg){width=20%}

\vspace{1em}

> "I ship code I don't read."

**Peter Steinberger**, OpenClaw (2026)

##

![](fig/amodei.jpg){width=20%}

\vspace{1em}

> "70-80-90% of code at Anthropic is written by Claude."

**Dario Amodei**, Axios AI+ Summit (2025)
## What is "vibe coding"?

- User describes intent, gets working software
- AI agent selects and assembles open source packages
- **User never reads docs, files bugs, or engages with maintainers**

## The puzzle

OSS usage **↑**

OSS engagement **↓**

How can both be true?

## Tailwind CSS: A case study

![npm downloads vs Stack Overflow questions](arxiv/tailwind_usage_vs_qa.png){width=80%}

##

![](fig/wathan.jpg){width=20%}

\vspace{1em}

> "Traffic to our docs is down 40% despite Tailwind being more popular than ever. Revenue is down close to 80%."

**Adam Wathan**, Tailwind CSS creator (2026)

## Two channels

::: columns
:::: column
**Productivity**

AI lowers cost of building OSS
::::
:::: column
**Demand diversion**

Users don't engage, maintainers lose **visibility**
::::
:::

## How OSS maintainers earn returns

- Documentation visits → consulting leads
- Bug reports → reputation → job offers
- Stars/downloads → sponsorships

**All require direct engagement**

## A model of the OSS ecosystem

- Developers create packages, decide whether to share
- Users choose packages, choose how to use them
- Vibe coding: higher productivity, lower engagement

$$\pi = \bar\pi(1 - v)$$

Revenue falls with vibe coding share $v$

## Which channel wins?

**Demand diversion** is about 6x as big as productivity gains

## Long-run equilibrium

- Entry falls → fewer new packages
- Variety shrinks → less choice
- Quality declines → worse software

**Welfare can fall despite better AI**

## The magnification trap

The same feedback loop that grew OSS...

more entry → better ecosystem → lower costs → more entry

...now works in reverse

**less entry → worse ecosystem → higher costs → less entry**

## What would save OSS?

\centering
\Huge 84%

\normalsize
of revenue must come from visibility independent sources

## A Spotify model for OSS

- AI platforms already track which packages they use
- Revenue sharing based on attributable usage
- Infrastructure for redistribution exists

## Takeaway

Vibe coding is a **fundamental shift** in how software is produced and consumed.

The productivity gains are real. So is the threat to OSS.

\vfill
\small koren.mk

## Acknowledgements

::: columns
:::: column
![](fig/erc.png){width=80%}
::::
:::: column
![](fig/elvonal.png){width=80%}
::::
:::

This research was funded by the European Union under the Horizon Europe grant 101061123 and by the National Research, Development and Innovation Office (Forefront Research Excellence Program contract number 144193). Views and opinions expressed are those of the authors only and do not necessarily reflect those of the European Union, the European Commission, or the National Research, Development and Innovation Office.

# Appendix
## Stack Overflow is dying

![25% decline after ChatGPT launch (del Río-Chanona et al., 2024)](arxiv/stackoverflow_questions.png){width=80%}

