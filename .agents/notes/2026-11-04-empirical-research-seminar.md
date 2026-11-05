---
id: 5
type: note
created: 2026-11-04
related: []
---

# Empirical research seminar: AI tools, project ideas, and research design

Empirical research seminar at CEU. Participants: Miklos Koren (instructor) and Talgat (student). Session covered AI tooling setup, a framework for thinking about AI in research, and student project presentations with discussion.

## AI tools and credit setup

The CEU AI credits ran out. A more permanent solution is needed. The CU Academic AI initiative (Austrian university pool) has been made to work by Ulrich Wohack and offers a selection of models including high-end ones, but is currently a chat-only interface not wired for coding agents. Miklos will talk to IT and Wojciech about connecting a coding agent.

As Miklos said: "So I think I'm gonna ask for some help from Ulrich Wohack and help set it up."

As an alternative, OpenCode's monthly subscription was recommended. The $10/month plan is sufficient for day-to-day science workflows; a $50/month plan is also available. Models offered include DeepSeek V4, Minimax, GLM 5.3, and Kimi K3. Kimi K3 and GLM 5.3 are best for capability; DeepSeek is good for standard coding. Top Anthropic/OpenAI models are not included because they are too expensive per token.

As Miklos said: "I think the $10 plan, if you're just working on your project, if you're not actually like building software, because that can eat up tokens quite fast, but you're like writing coding scripts, doing some web research, then I think the $10 plan is totally fine."

Miklos will load money on the shared account as a stopgap until the CU AI setup is ready.

## Framework for AI in research

Every empirical paper has four necessary components: idea, thinking (research design and method), work (code, regressions, data), and spin (framing for audience). Work is the most outsourceable to AI; thinking should stay central. AI writing is poor because it cannot model what the reader does not know. AI editing is much better -- language, typos, and structural reorganization.

As Miklos said: "The main problem of AI writing is that it cannot imagine that the other person who is the reader does not know what you know."

For classification and automation tasks, specialized fast or cheap models should be used rather than chat LLMs.

## Student project ideas

### Anti-SLAPP laws and CEO turnover (Talgat)

Anti-SLAPP laws reduce the cost of legal harassment against journalists and whistleblowers. Hypothesis: laws improve public information about CEOs, helping boards distinguish good from bad. The expected effect is ambiguous -- good CEOs retained, bad CEOs fired more. Data sources: ExecuComp (top 5 executives, S&P 1500) and forced exit labels from news. Challenge: forced CEO exits are rare (~2% of firms per year).

### Collective bargaining and cross-sector worker mobility in Austria

Using linked employer-employee data for Austria. Research question: do workers switch sectors in response to wage changes from new collective bargaining agreements? Hypothesis: secretarial workers switch easily; specialized construction workers do not. The Benya formula may predict wage increases; an industry crosswalk is needed. AI can help with classification and crosswalk tasks.

### Qatar import data and blockade persistence

Monthly product-origin import data for Qatar, 2015-2025. Shock: the 2017-2021 blockade. Finding: Qatari importers did not fully return to pre-blockade partners after resolution.

### Chinese social media news bias

AI-classified dataset of country coverage and good/bad governance news from Chinese government media. Finding: systematic bias toward good China news and bad foreign-country news. Variation observed cross-province and cross-time. Hypothesis that bad economic performance drives more biased reporting turned out to have negligible magnitude. Suggested extension: topic-level analysis and comparison to international outlets via GDELT or LexisNexis.

### News market competition and sensationalism

Idea: more outlets increase complexity, incentivizing salience over informativeness. Research question: how does entry and exit of local news outlets affect news characteristics? Two potential datasets: Swedish local news markets and US historical data. Identification challenge: entry and exit is endogenous. Possible instruments: introduction of TV (quasi-random across US counties) and IO structural approach.

### AI and structural transformation (macro)

Standard CLM model of structural transformation (income versus substitution effects). Hypothesis: AI is a productivity shock to automatable services, lowering their price. The income effect shifts spending and employment toward human-intensive sectors (care, education, hospitality). Plan: calibrate the CLM model with an AI sector and test empirically with OECD data. Challenge: measuring AI impact when large-scale effects have not materialized yet.

As Miklos said: "All of the discussion of who is exposed and which jobs are going to get lost -- I think almost all of it is misguided. It is a very powerful technology, but it is going to reshape the economy. And all of your past data on what people do on their job is going to be more or less irrelevant."

### Academic talent recognition and peer effects (Talgat)

Ukrainian secondary school data: graduates, university applications, and field choices. Research question: how does recognizing academic talent (Olympiad winners) affect peers' test scores and applications? Data includes Olympiad winner names, schools, and scores across math, biology, physics, chemistry, and informatics. Mechanisms: role model effects, learning spillovers, and teacher quality. Identification strategies from literature: random classroom assignment (Greece) and RDD on score cutoff (Brazil). The disciplinary split (math versus biology winner) as a potential contribution. AI can help match winner names to schools.

## Cross-cutting themes and methods

Text-as-data is relevant to several projects: news classification and student name matching. A dedicated session on LLM automation for text classification was discussed. Methodological diversity across projects: diff-in-diff, RDD, and structural/IO models.

As Miklos said: "It is good to think about treatment groups, control groups, and all that, but I think that general framing can be a bit misleading because it gives you the idea that you can identify stuff without a model. Which I think is wrong."

Structural modeling is underserved relative to reduced-form approaches; no good textbook exists. Quantitative Economics (Jesse Shapiro) was mentioned as a starting point.

## Homework and next steps

Homework for next week: write an aspirational abstract for the project idea.