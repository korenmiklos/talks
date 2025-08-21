# AGENTS: Academic Slide Creation Rules and Workflow

This document provides comprehensive rules and patterns for creating academic presentation slides from manuscript text and research outputs (tables and figures). It codifies the conventions used across presentations in this repository to enable consistent, high-quality slide creation by both humans and AI agents.

## Software Requirements

### Core Tools
- **pandoc** ≥ 3.1 with beamer and revealjs output formats
- **TeX Live 2024** including:
  - pdflatex, latexmk
  - beamer class and themes
  - tikz, pgfpages packages
  - booktabs, threeparttable for tables
  - Font and microtype packages
- **Make** for build automation

### Optional Tools
- **reveal.js** for HTML slides
- **KaTeX** for HTML math rendering

## File Conventions

### Directory Structure
```
YYYY-MM-DD-venue/           # One talk per dated folder
├── README.md               # Source markdown with YAML header
├── README.tex              # Generated LaTeX (intermediate)
├── README.pdf              # Final PDF output
├── figures/                # Research figures (PDF preferred)
├── fig/                    # Alternative figure directory
├── tables/                 # LaTeX table files
├── images/                 # Photos, logos, screenshots
└── exhibit/                # Mixed content directory
```

### Naming Patterns
- Folders: `YYYY-MM-DD-venue` (e.g., `2024-06-21-bayreuth`)
- Main source: always `README.md`
- Figures: descriptive names with hyphens (e.g., `wage-distribution.pdf`)
- Tables: match manuscript names when possible

## Build System

### Makefile Workflow
The repository uses a centralized Makefile that:
1. Discovers all talk folders via pattern `????-??-??-*/README.md`
2. Converts markdown to LaTeX: `pandoc README.md -t beamer --slide-level 2 -H preamble-slides.tex -o README.tex`
3. Compiles LaTeX to PDF: `pdflatex README.tex` in the talk directory
4. Cleans auxiliary files while preserving PDFs

### Build Commands
```bash
make                # Build all slides
make clean          # Remove auxiliary files, keep PDFs
make reallyclean    # Remove all generated files except PDFs
```

## YAML Front Matter

### Required Fields
```yaml
---
title: "Your Presentation Title"
author: Name Surname
date: Venue Name, Month DD, YYYY
aspectratio: 169    # Options: 169 (16:9), 1610 (16:10), 43 (4:3), 54 (5:4)
lang: en            # Language code
---
```

### Extended Example with Multiple Authors
```yaml
---
title: "Success and geography: Evidence from open-source software"
author:
    - Gábor Békés (CEU, HUN-REN KRTK, and CEPR)
    - Julian Hinz (Bielefeld University)
    - Miklós Koren (CEU, HUN-REN KRTK, CEPR and CESifo)
date: June 21, 2024^[EU Horizon Europe grant 101061123]
aspectratio: 169
lang: en
titlepage: true
---
```

### Optional Fields
- `abstract:` for longer abstract text
- `titlepage: true` to force title page generation
- `date-format: long` for date formatting
- `html-math-method: katex` for HTML output

## Markdown Syntax Rules

### Slide Structure
- **H1 (`#`)**: Section dividers (optional, creates section slide)
- **H2 (`##`)**: Individual slides (enforced by `--slide-level 2`)
- **H3 (`###`)**: Subsections within a slide
- **Bullets**: Use `-` for unordered lists, `1.` for ordered

### Mathematical Content
- Inline math: `$\alpha + \beta$`
- Display math: `$$Y = \alpha + \beta X + \epsilon$$`
- LaTeX commands work: `\frac{}{}`, `\sum_{}^{}`, etc.

### Figures
```markdown
## Figure with caption
![](figures/map.pdf)

## Figure with size control
![](figures/results.png){ width=80% }

## Side-by-side figures
![](figures/before.pdf){ width=45% } ![](figures/after.pdf){ width=45% }

## Figure with specific dimensions
![](fig/trend.pdf){ width=13cm height=8cm }
```

### Tables
```markdown
## LaTeX table import
\input{tables/regression_results.tex}

## Inline markdown table (simple cases)
| Variable | Coefficient | SE |
|----------|-------------|-----|
| X        | 0.45***     | 0.02|
| Y        | -0.23**     | 0.10|
```

### Advanced Features

#### Columns (Beamer)
```markdown
::: {.columns}
:::: {.column width=50%}
Left content
::::
:::: {.column width=50%}
Right content
::::
:::
```

#### TikZ Diagrams
```markdown
\begin{tikzpicture}
    \node[draw, rectangle] (A) at (0,0) {Input};
    \node[draw, rectangle] (B) at (3,0) {Output};
    \draw[->] (A) -- (B);
\end{tikzpicture}
```

#### Pauses and Reveals
```markdown
- First point
\pause
- Second point appears after click
```

## Semantic Structure Templates

### Research Presentation (Full)
1. **Title** (from YAML)
2. **Motivation** (1-2 slides)
   - Economic/social problem
   - Why it matters now
   - Visual evidence if available
3. **Research Questions**
   - Main question
   - Secondary questions
   - Contribution to literature
4. **Related Literature** (optional, selective)
   - Key papers grouped by theme
   - Your contribution relative to existing work
5. **Data**
   - Sources and coverage
   - Sample construction
   - Descriptive statistics or map
6. **Methodology/Model**
   - Theoretical framework (if applicable)
   - Identification strategy
   - Key equations
7. **Results: Descriptive**
   - Stylized facts
   - Patterns in raw data
8. **Results: Main Analysis**
   - Core regression/simulation results
   - Economic magnitude discussion
9. **Mechanisms** (optional)
   - Channel analysis
   - Heterogeneity
10. **Robustness** (optional)
11. **Conclusion**
    - 3 main takeaways
    - Policy implications
    - Future work
12. **Contact/Links**

### Policy/Workshop Talk (Short)
1. **Title**
2. **Problem Statement**
3. **Our Approach**
4. **Key Finding**
5. **Implications**
6. **Next Steps**

### Discussion/Commentary
1. **Title with Paper Info**
2. **Summary of Paper**
3. **Main Contributions**
4. **Comments/Critiques**
   - Methodological
   - Empirical
   - Theoretical
5. **Suggestions**
6. **Overall Assessment**

## Language Style Guide

### General Principles
- **Terse**: Maximum 6-7 words per bullet
- **Active voice**: "We find" not "It is found"
- **Present tense**: "Data show" not "Data showed"
- **Declarative**: Headlines state findings, not topics

### Good vs Bad Examples

#### Headlines
❌ "Regression Results"
✅ "Imported machines increase wages by 15%"

❌ "Data Description"
✅ "Panel covers 1.3 million firms over 30 years"

#### Bullets
❌ "We conducted an analysis of the relationship between manager quality and firm performance"
✅ "Better managers → higher productivity"

❌ "The coefficient is statistically significant at the 1% level"
✅ "Effect significant at 1%"

### Technical Writing
- **Numbers**: Round appropriately (0.234 → 0.23)
- **Statistics**: Show stars for significance (*, **, ***)
- **Units**: Always specify (%, pp, log points)
- **Equations**: Only essential ones, explained verbally

### Citations
- Short format: `Bloom et al (2013)`
- Use `\smallcite{}` for less prominent citations
- Maximum 5-6 citations per slide

## Creating Slides from Manuscript

### Step-by-Step Workflow

1. **Extract Key Elements from Manuscript**
   - Research question (from intro)
   - Main contributions (from intro/conclusion)
   - Data description (from data section)
   - Key equations (from methods)
   - Main results (from results section)
   - Robustness checks (from appendix)

2. **Select Visual Evidence**
   - Choose 5-8 main figures/tables
   - Prioritize: main effect → mechanism → heterogeneity
   - Ensure readability at slide size

3. **Create Slide Structure**
```markdown
---
title: [Paper title, shortened]
author: [Your name and affiliation]
date: [Venue], [Date]
aspectratio: 169
---

## Why This Matters
- [Problem in 1 sentence]
- [Cost/stakes in numbers]
- [Gap in knowledge]

## What We Do
- [Method in 1 sentence]
- [Data in 1 sentence]
- [Innovation in 1 sentence]

## Main Result
![](figures/main_effect.pdf){ width=80% }

## How Much Does This Matter?
- [Economic magnitude]
- [Comparison to benchmark]
- [Policy relevance]
```

4. **Polish Language**
   - Remove hedging ("might", "possibly")
   - Cut adjectives and adverbs
   - Replace phrases with symbols where clear
   - Ensure parallel structure in lists

### Example Transformation

**Manuscript text:**
> "Our empirical analysis, which leverages a comprehensive dataset of Hungarian firms spanning the period from 1992 to 2003, reveals that firms with access to imported machinery experience substantially higher productivity growth compared to those relying solely on domestic equipment."

**Slide bullet:**
> "Imported machines → 25% higher productivity (1992-2003)"

## Special Patterns and Conventions

### Model Presentations
When presenting theoretical models:
1. Start with intuition
2. Show the simplest version
3. Add complexity gradually
4. Highlight testable predictions

Example structure:
```markdown
## Model Intuition
- Managers vary in skill $z$
- Better managers → larger firms
- Competition limits firm size

## Production Function
$$Y = z^\nu L^{1-\nu}$$
- $z$: manager skill
- $\nu$: span of control
- $L$: workers

## Equilibrium
- Managers compete for workers
- Wages: $w = (1-\nu)(L/Z)^{-\nu}$
- Selection: only $z > z^*$ become managers

## Testable Predictions
1. Better managers run larger firms
2. Manager wages increase in skill
3. Entry depends on competition
```

### Data Description Slides
Structure for data slides:
```markdown
## Data Sources
- **Administrative records**: Universe of firms 1988-2019
- **Survey data**: 10% sample of workers
- **Trade statistics**: All imports/exports

## Sample Construction
- Start: 1.3 million firms
- Drop: Non-employers (-500k)
- Drop: Missing revenue (-200k)
- **Final: 600k firms, 8.4m obs**

## Key Variables
| Variable | Mean | SD | Source |
|----------|------|-----|--------|
| Revenue  | 245  | 890 | Tax records |
| Workers  | 12.3 | 45.2| Social security |
| Imported | 0.23 | 0.42| Customs |
```

### Results Presentation
For regression tables:
1. Show only key coefficients
2. Include economic magnitude
3. Note controls concisely

```markdown
## Imported Machines Increase Wages
\input{tables/main_regression.tex}

**Economic magnitude**: 10pp increase in import share → 2.5% wage gain

Controls: Worker FE, Firm-year FE, Industry trends
```

## Common Pitfalls to Avoid

### Content Issues
- ❌ Too much text per slide
- ❌ Undefined acronyms
- ❌ Cluttered figures
- ❌ Tables with >5 columns
- ❌ Equations without explanation

### Formatting Issues
- ❌ Inconsistent notation
- ❌ Small fonts in figures
- ❌ Missing axis labels
- ❌ Color schemes that don't project
- ❌ Overlapping text

### Presentation Flow
- ❌ No motivation upfront
- ❌ Methods before questions
- ❌ Results without magnitude
- ❌ Missing takeaways

## Quality Checklist

Before finalizing:
- [ ] Title slide has all required info
- [ ] Each slide has ≤6 lines of text
- [ ] All figures visible at arm's length
- [ ] Math notation is consistent
- [ ] Results include economic magnitude
- [ ] Conclusion has 3 clear takeaways
- [ ] Build completes without errors
- [ ] PDF is under 10MB

## LaTeX Customization via preamble-slides.tex

The shared preamble provides:
- **Color scheme**: CTred (#E52020) for emphasis
- **Fonts**: Professional fonts, justified text
- **Navigation**: Hidden navigation symbols, frame numbers
- **Tables**: booktabs, threeparttable support
- **TikZ**: Positioning, arrows, graphs libraries
- **Math**: Proper spacing and alignment

Custom commands available:
- `\smallcite{}`: Smaller citations
- `\exhibit{}{}`: Figure with source note

## Repository Best Practices

1. **Version Control**
   - Commit source files (`.md`, `.tex`)
   - Include final PDFs
   - Exclude auxiliary files via `.gitignore`

2. **File Organization**
   - One talk = one folder
   - Consistent subfolder structure
   - Relative paths only

3. **Reusability**
   - Common elements in preamble
   - Figures in vector format (PDF/SVG)
   - Tables as separate `.tex` files

## Example Slides from Repository

### Effective Motivation Slide
From `2024-06-21-bayreuth`:
```markdown
## Research questions
- How and where is open source software developed?
- Can spatially dispersed developers produce quality software?
- How do frictions affect collaboration and software quality?
```

### Clean Results Presentation
From `2022-10-17-uniwien`:
```markdown
## Better workers are more likely to get an imported machine
![](figure/wage_inequality.pdf){ width=100% }
```

### Concise Conclusion
From `2023-10-25-corvinus`:
```markdown
## Conclusion
### Go Corvinus!
```

## Templates for Common Slide Types

### Opening Hook
```markdown
## [Surprising fact or puzzle]
- [Conventional wisdom]
- [But: contradicting evidence]
- [This paper: resolution]
```

### Literature Positioning
```markdown
## Related Work
### Stream 1: [Topic]
- Author1 (2020): [Finding]
- Author2 (2021): [Finding]

### Our contribution
- First to [innovation]
- New data on [topic]
```

### Mechanism Slide
```markdown
## Why Does X Affect Y?
### Direct channel
X → [intermediate] → Y

### Evidence
- Test 1: [Result]
- Test 2: [Result]
```

This comprehensive guide ensures consistent, professional slide creation across all presentations in the repository.