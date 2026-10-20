---
id: 4
type: note
created: 2026-10-20
related: [3]
---

# Corvinus workshop prep

Solo preparation session for the Corvinus AI workshop tomorrow (October 21), run under the 9x academic branding. The deck will be Reveal.js, not PowerPoint, with live demos throughout. There are four topics, roughly 3-5 slides each, for a large class, so no follow-along coding: the demo is presenter-led. Language is to be confirmed (Hungarian likely).

## Setup and logistics

Bring the Rode wireless microphones to record audio; screen recording is still open, possibly via Zoho One, since Loom's pricing is uncertain. As said in the session: "I really like loom for this but I don't know if it still works whether it's fee paying or what's going on with it." Create a dedicated workspace, ideally the existing training workspace, with a separate Open Router token so the workshop's token spend and cost can be shown at the end. Launch OMP with an empty mind, no pre-loaded skills or defaults. Bring stickers. Reuse the tender-home-bias-ai repo as the workshop environment, stripped of its data documentation so students can build it live.

## Topic 1: forget the superstar model hype

Open with the Navier-Stokes image from OpenAI, ask how many know it, then how many find it relevant, expecting a drop. The core message is that there are always trade-offs. As said in the session: "if someone tells you that this is the only thing you should care about you should immediately be suspicious because there are always trade-offs." Slides cover a feature comparison, the catch-up of open models (Epoch or Apple chart from the logistics conference), a Pareto frontier chart to find, and Open Router model popularity by week for price sensitivity and market share. The live demo opens the Open Router model browser and separates hardware from model, a key point that is easy to land.

## Topic 2: there is no spoon

Embed the there-is-no-spoon scene from The Matrix, since the deck is HTML. The message is not to bend the spoon but to talk to the agent like a human. Second slide lists outdated practices such as MCPs, prompt engineering templates, and role-setting, then shows a real role-setting prompt and concludes none of it is necessary. A Matrix meme idea: Cypher's juicy steak for show versus the crew's protein paste that the body needs. The live demo does everything through the agent while the presenter only asks questions, using the Tenders Electronic Daily dataset from the tender-home-bias-ai repo, including how to compute total contract amounts and which numbers can and cannot be summed.

## Topic 3: automate, don't just assist

A Matrix meme: Neo loading helicopter data versus Trinity flying the helicopter. The point is to ask for tools to use, not just tasks to do. The argument for writing code is reproducible research: exploratory work gets repeated roughly 30 times, so code lets you rerun without re-prompting. The demo writes a piece of code, likely in Stata for wider familiarity, and creates a skill to automate a repeatable step, with data documentation or citation as a good candidate.

## Topic 4: automation at scale

Use cases are text classification, sentiment analysis, and similar NLP applications, with no images in scope. Stay on the same tender-home-bias-ai dataset for continuity and switch to Gemini Flash for this section as faster and cheaper. End the workshop by showing token usage and cost on Open Router as a real-world learning moment on LLM spend.

## Next steps

- Confirm the workshop language, Hungarian versus English.
- Research Zoho One for screen recording capability, since Loom may no longer be free.
- Find a good Pareto frontier chart for topic 1, from Epoch AI or Open Router data.
- Set up OMP with an empty workspace and a separate Open Router token, with no pre-loaded skills or defaults.
- Prepare the tender-home-bias-ai repo as the workshop environment, copying from last week's course and stripping the data documentation so students can build it live.
