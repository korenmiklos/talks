---
title: "Estimating the Value of CEOs in Privately Held Businesses"
author: 
    - Miklós Koren (CEU, HUN-REN KRTK, CEPR and CESifo)
    - Krisztina Orbán (Monash)
    - Bálint Szilágyi (HUN-REN KRTK)
    - Álmos Telegdy (Corvinus)
    - András Vereckei (HUN-REN KRTK)
date: Lugano, September 2, 2025
aspectratio: 169
lang: en
---

## The CEO Value Puzzle

- CEOs credited with firm success and failure
- Academic evidence: 4-25% performance differences
- But correlation is not causation
- **This paper**: How much is real vs spurious?

## Preview of Results

- Standard approach: 22.5% performance gap
- Our placebo test: 17% is spurious
- **True CEO effect: 5.5%**
- Methodological implications for entire literature

## Why Should We Care?

### Academic
- Manager fixed effects in thousands of papers
- Identification challenges unresolved
- Need better methods

### Policy
- Executive compensation debates
- Corporate governance rules
- Private equity strategies

## Roadmap

1. Motivation and literature
2. Theoretical framework
3. Hungarian data universe
4. Placebo methodology
5. Main results
6. Robustness and mechanisms
7. Implications

# Motivation

## The Manager Effects Literature

### Seminal Papers
- **Bertrand & Schoar (2003)**: Heterogeneity in managerial "styles" (not single ROA effect)
- **Bennedsen et al (2020)**: CEO hospitalization → ~7% performance drop
- **Bandiera et al (2020)**: "Leader" CEOs → productivity gains

### Recent Evidence
- **Quigley et al (2022)**: CEO effects vary by ownership (magnitudes context-specific)
- **Metcalfe et al (2023)**: Manager effects context-dependent, sensitive to mobility
- **Gaure (2014)**, **Bonhomme et al (2023)**: Correlation bias in FE models

## The Identification Challenge

### Fundamental Problems
1. **Selection**: Good managers → good firms
2. **Timing**: Changes during transitions
3. **Unobservables**: Firm trends confounded with CEO effects
4. **Limited mobility**: Bias depends on mobility patterns (Bonhomme et al 2023)

### Current Solutions  
- Fixed effects (correlation bias - Gaure 2014)
- Sudden deaths (rare, still selected)
- Movers design (endogenous moves, attenuation - Andrews et al 2008)

## Private vs Public Firms

| Dimension | Public | Private |
|-----------|--------|---------|
| Governance | Dispersed | Concentrated |
| CEO role | Strategic | Constrained |
| Monitoring | Market | Owner |
| Compensation | Pay-performance link | Different contracting |
| Data | Abundant | Scarce |
| Share of economy | <1% | >99% |

Cole & Mehran (2008), Gao & Li (2015): Different compensation structures

## Our Contributions

1. **Model**: Separate owner vs manager decisions (building on Lucas 1978)
2. **Data**: 1M+ firms, 26k connected CEOs (dwarfs Fee 2013: 500 firms)
3. **Method**: Placebo-controlled event study
4. **Finding**: 75% of effects are spurious (true effect: 5.5%)

# Theoretical Framework

## Production Structure

Firms combine fixed and variable inputs:

$$Q_{imt} = \Omega_{it}A_i Z_{m} K_{it}^\alpha L_{imt}^{\beta} M_{imt}^{\gamma}$$

- $A_i$: Organizational capital (owner-chosen)
- $Z_m$: Manager skill
- $K_{it}$: Physical capital (owner-chosen)
- $L_{imt}$, $M_{imt}$: Labor, materials (manager-chosen)

## Division of Control

### Owners Control
- Physical capital investment
- Organizational structure  
- Industry and location
- CEO hiring/firing

### Managers Control (Limited)
- Labor hiring (within budget)
- Input purchasing
- Operations
- Day-to-day decisions

**Evidence**: MOPS data shows plant managers often limited to ~$10k investment authority

## Optimization Problem

Manager maximizes profit given fixed inputs:

$$\max_{L,M} P_{st}Q_{imt} - W_{st}L_{imt} - \varrho_{st}M_{imt}$$

First-order conditions pin down optimal scale

## Surplus and Manager Value

Surplus to fixed factors:
$$S_{imst} = \chi \cdot R_{imst}$$

where $\chi = 1 - \beta - \gamma$

Manager contribution to log surplus:
$$\Delta s = \frac{1}{\chi}(z_{m'} - z_m)$$

## Empirical Implications

1. Revenue function decreasing returns to scale
2. Manager effects scale with $1/\chi$
3. Can identify from CEO transitions
4. Need to control for selection

# Data

## The Hungarian Context

### Why Hungary?
- Complete administrative data
- All incorporated businesses
- Mandatory CEO registration
- 30+ years of coverage
- EU member → relevant institutions

### Economic Background
- Transition economy 1990s
- EU accession 2004
- Mix of domestic and foreign firms
- Active CEO labor market

## Data Sources

### Balance Sheet Data (Mérleg LTS)
- All firms filing financial statements
- Revenue, costs, employment, assets
- 1980-2022 coverage
- 10.2 million firm-years

### Firm Registry (Cégjegyzék LTS)
- CEO appointments and terminations
- Manager characteristics
- Ownership structure
- Complete since 1992

## Sample Construction

```
Universe of firms: 1,579,432
↓
Drop pre-1992: -516,260
↓
Match CEO data: 1,063,172
↓
Single CEO spells: 222,866
↓
Analysis sample: 2,900,201 firm-years
```

## Descriptive Statistics

| Variable | Mean | SD | N |
|----------|------|-----|---|
| Revenue (million HUF) | 245 | 890 | 2.9M |
| Employment | 12.3 | 45.2 | 2.9M |
| CEO changes/year | 0.067 | - | 2.9M |
| Foreign owned | 0.09 | 0.29 | 2.9M |
| State owned | 0.02 | 0.14 | 2.9M |

## CEO Characteristics

| Characteristic | Share |
|----------------|-------|
| Male | 74% |
| Hungarian name | 92% |
| Owner-manager | 41% |
| Multiple firms | 18% |
| Connected component | 26,476 managers |

## Industry Distribution

\input{tables/tableA1.tex}

## Temporal Patterns

\input{tables/table1.tex}

## CEO Turnover Patterns

\input{tables/table6.tex}

# Methodology

## The Identification Problem

### What We Want
True CEO effect on firm performance

### What We Observe
$$\text{Performance}_{it} = \text{CEO effect}_m + \text{Firm trend}_i + \text{Shock}_{it}$$

### The Challenge
CEO changes correlate with trends and shocks!

## Standard Approaches and Problems

### Manager Fixed Effects
$$y_{imt} = \alpha_i + \gamma_m + \epsilon_{imt}$$
**Problem**: Assumes exogenous mobility

### Event Studies
Compare before/after CEO change
**Problem**: Timing endogenous

### Instrumental Variables
Deaths, retirements, etc.
**Problem**: Rare, still selected

## Our Solution: Placebo Control

### Intuition
- Create fake CEO changes
- Same probability as real changes
- But random timing
- Exclude actual transition periods

### What Placebos Capture
- Firm lifecycle effects
- Industry trends  
- Mean reversion
- Any spurious correlations

## Constructing Placebos

### Algorithm
1. For each firm, calculate CEO change probability
2. Randomly assign placebo changes with same probability
3. Exclude 2 years around actual changes
4. Assign placebo "good" vs "bad" CEOs

### Example
- Firm has CEO change in 2010
- Exclude 2009-2011 from placebo
- Randomly assign placebo in, say, 2015
- Compare actual vs placebo effects

## Visual Intuition: Actual vs Placebo

![](figures/placebo_vs_actual.pdf){ width=85% }

## Event Study Design

### Specification
$$y_{it} = \sum_{\tau=-5}^{5} \beta_\tau \cdot \mathbb{1}[\text{time to transition} = \tau] + \alpha_i + \delta_t + \epsilon_{it}$$

### Key Comparisons
1. Actual good → bad CEO transitions
2. Actual bad → good CEO transitions  
3. Placebo transitions
4. Difference = causal effect

# Main Results

## Event Study: Raw Results

![](figures/event_study.pdf){ width=90% }

## Decomposing the Effects

### Actual Transitions
- Good → Bad: -11.3% performance
- Bad → Good: +11.2% performance
- **Total gap**: 22.5%

### Placebo Transitions
- "Good" → "Bad": -8.5%
- "Bad" → "Good": +8.5%
- **Spurious gap**: 17.0%

### True Effect
22.5% - 17.0% = **5.5%** (p < 0.01)

## Statistical Significance

| Transition | Actual | Placebo | Difference |
|------------|--------|---------|------------|
| Bad→Good | 11.2*** | 8.5*** | 2.7** |
| Good→Bad | -11.3*** | -8.5*** | -2.8** |
| Gap | 22.5*** | 17.0*** | 5.5*** |

Standard errors clustered at firm level

## CEO Skill Distribution: Within Firm

![](figures/manager_skill_within.pdf){ width=80% }

P25-P75 difference: 9.6% productivity

## CEO Skill Distribution: Connected Component

![](figures/manager_skill_connected.pdf){ width=80% }

P25-P75 difference: 24.6% productivity

## Skill Correlation Across Firms

![](figures/manager_skill_correlation.pdf){ width=80% }

Correlation = 0.31, but mostly noise!

## Revenue Function Estimation

\input{tables/revenue_function.tex}

- Fixed assets elasticity: 0.31 (was 0.24 in earlier version)
- Intangibles: 22% revenue boost
- Foreign ownership: 2.4% premium (now significant)
- Note: CEO age controls added; 10+ employee firms only

## What Explains the Noise?

### Estimation Error
- Finite sample bias
- Limited observations per manager
- Attenuation in correlations

### Real Heterogeneity  
- Manager-firm match quality
- Time-varying manager skills
- Learning and adaptation

### Endogenous Mobility
- Selection into firms
- Timing of transitions
- Unobserved shocks

# Robustness

## Alternative Specifications

\input{tables/revenue_controls.tex}

Results robust to controls and fixed effects

## Full Sample Results

\input{tables/full_sample.tex}

Consistent effects across different performance measures

## EBITDA Results by Sector

\input{tables/EBITDA_sectors.tex}

Profitability effects similar across sectors

## Heterogeneity by Sector

\input{tables/revenue_sectors.tex}

## Heterogeneity by Foreign Ownership

### Panel A: CEO Effects by Sector and Ownership
\input{tables/table4_panelA.tex}

### Panel B: Additional Ownership Patterns
\input{tables/table4_panelB.tex}

Foreign-owned firms show different CEO effect patterns

## Manager Effects on Multiple Outcomes

\input{tables/manager_effects.tex}

## Placebo Validity Checks

### Test 1: Pre-trends
- No differential trends before transitions
- Parallel paths for actual and placebo

### Test 2: Randomization
- 1000 placebo draws
- Consistent results
- Distribution centered at zero

### Test 3: Exclusion Windows
- Results robust to 1-year, 3-year windows
- Larger windows → smaller placebo effects

## Sample Restrictions

| Restriction | True Effect | N |
|-------------|------------|---|
| Baseline (10+ employees) | 5.5% | 2.9M |
| Drop small firms (<20) | 5.2% | 2.2M |
| Drop young firms | 5.8% | 2.5M |
| Manufacturing only | 6.1% | 0.8M |
| Connected component | 5.4% | 0.23M |

## Time Period Sensitivity

| Period | True Effect | Placebo Effect |
|--------|-------------|----------------|
| 1992-2002 | 5.9% | 16.2% |
| 2003-2012 | 5.3% | 17.1% |
| 2013-2022 | 5.4% | 17.5% |
| Full sample | 5.5% | 17.0% |

Placebo effects increasing over time!

# Mechanisms

## Why Do Placebos Generate Effects?

### Firm Lifecycle
- Growth firms more likely to change CEOs
- Mean reversion after transitions
- Captures 8-10% of placebo effect

### Industry Shocks
- Sectoral booms/busts coincide with CEO changes
- Industry-year FE reduce placebo by 15%

### Unobserved Firm Trends
- Reorganizations, strategy shifts
- Not captured by fixed effects
- Likely explains remaining placebo effect

## Manager Observable Characteristics

| Characteristic | Effect on Productivity |
|----------------|----------------------|
| Foreign name | +3.2%*** |
| Male | +1.1%** |
| Owner-manager | +2.4%*** |
| Age (10 years) | -0.8%** |
| Multiple firms | +4.1%*** |

R² of observables = 0.08

## Entry Cohort Effects

### Finding
CEOs from same entry cohort have correlated performance

### Interpretation
- Common training/education
- Network effects
- Generational management styles

### Implication
Can use cohort FE to reduce noise

## Match Quality

### Theory
Performance = Manager skill + Match quality + Noise

### Evidence
- Within-firm variance < across-firm variance
- Correlation breaks down at extremes
- Some CEO-firm pairs negative value

### Implication
One-size-fits-all CEO market unrealistic

## Manager Autonomy in Family Firms

\input{tables/tableA0.tex}

- Family ownership → ~37% lower investment autonomy (our calculation)
- Bloom et al (2012): Family firms more centralized across 20 countries
- Pattern holds for plant managers, likely stronger for CEOs

# Implications

## For Empirical Research

### Don't Use Raw Manager FE
- 75% noise → severe attenuation bias
- Correlations misleading
- Fixed effects are not causal effects

### Better Practices
1. Include observable characteristics (foreign, education, cohort)
2. Manager quality on LHS only (never RHS due to attenuation)
3. Avoid simple correlations (inflated variance)
4. Always implement placebo checks

## For Theory

### Models Need Noise
- Pure sorting models predict too much
- Need measurement error or match quality
- Time-varying skills important

### Decreasing Returns Matter
- Span of control limits CEO impact
- Complementarity with firm assets
- Not just additive effects

## For Policy

### Executive Compensation
- 75% of "performance" beyond CEO control
- Focus on operational metrics under CEO control
- Industry-relative performance better than absolute

### Corporate Governance
- Owner constraints matter more than CEO autonomy
- Board focus: selection > monitoring
- Governance reforms have limited impact

## For Practice

### CEO Selection
- Observable characteristics matter
- Track record partially informative
- Industry experience valuable

### Private Equity
- CEO replacement effects modest
- Operational improvements > CEO changes
- Manage expectations

## Comparison with Literature

| Study | Setting | Method | Effect |
|-------|---------|--------|--------|
| Bertrand & Schoar (2003) | US public | FE | Heterogeneity in styles |
| Bennedsen et al (2020) | Danish private | Hospitalization | ~7% |
| Chandra et al (2016) | US hospitals | Risk-adjusted | 5% of variance |
| Page (2018) | Structural | Model | 1.7% shareholder value |
| **This paper** | Hungarian private | Placebo | **5.5%** |

Causal estimates converge to smaller effects than correlational

## External Validity

### Generalizable
- Broad economy coverage
- Standard production technology
- Aligns with quasi-experimental evidence globally

### Context-Specific
- Transition economy history
- EU institutional environment
- Private firm constraints

### Key Insight
Noise problem universal - affects all FE studies

# Conclusion

## What We Did

1. **Modeled** CEO value in private firms
2. **Measured** using universe of Hungarian firms
3. **Developed** placebo-controlled method
4. **Found** 75% of "effects" are spurious

## What We Found

### Main Result
True CEO effect = 5.5%, not 22.5%

### Why the Difference?
- Endogenous timing
- Selection effects
- Spurious correlations

### Still Meaningful
5.5% productivity gain substantial

## What We Learned

### Methodological
- Standard FE approaches overstate
- Placebo controls essential
- Observable characteristics help

### Economic
- CEOs matter but less than thought
- Firm fundamentals dominate
- Match quality important

## Implications Going Forward

### For Researchers
- Reconsider manager FE papers
- Implement placebo checks
- Focus on identification

### For Policymakers
- Moderate CEO compensation debates
- Governance reforms less urgent
- Focus on firm fundamentals

### For Practitioners
- CEO changes not magic bullets
- Selection matters but has limits
- Manage stakeholder expectations

## Next Steps

### Extensions
- Dynamic effects over CEO tenure
- Team production and complementarities
- International comparison

### Applications
- Other management practices
- Board effects
- Family succession

## Thank You

**Contact**: korenm@ceu.edu

**Paper**: [github.com/korenmiklos/ceo-value](https://github.com/korenmiklos/ceo-value)

**Data**: Available through KRTK Adatbank

**Funding**: 
- ERC Advanced Grant 101097789
- Hungarian NKFI KKP_22 144193

# Appendix

## Data Construction Details

### Sample Filters
1. Years 1992-2022 only
2. Non-missing revenue and employment
3. Single CEO at any point
4. Exclude financial sector
5. Trim 1% tails of growth rates

### Variable Definitions
- Revenue: Total sales excluding VAT
- Employment: Average annual employees
- Manager skill: CEO fixed effect from residualized surplus
- Foreign: >50% foreign ownership
- State: >50% state ownership

## Econometric Details

### Revenue Function Estimation
1. Assume Cobb-Douglas technology
2. Impose constant returns on variable inputs
3. Estimate with firm and year FE
4. Cluster SE at firm level

### Manager Skill Estimation
1. Residualize surplus from revenue function
2. Estimate CEO fixed effects
3. Normalize mean to zero
4. Shrinkage for small samples

## Additional Robustness

### Alternative Surplus Measures
- EBITDA instead of revenue
- Value added
- TFP from production function

All give similar results

### Alternative Samples
- Balanced panel
- Long-tenure CEOs only
- Exclude crisis years

Results robust

## Placebo Algorithm Details

```
For each firm i:
  1. Calculate P(CEO change)
  2. Draw random years with probability P
  3. Exclude window around actual changes
  4. Assign placebo "quality" randomly
  5. Run same event study
```

## Theory Appendix

### Microfoundations
Full derivation available in paper

### Key Assumptions
1. Cobb-Douglas technology
2. Perfect competition in inputs
3. Sector-specific output prices
4. Managers maximize short-run profit
5. CEO age affects productivity

### Testable Predictions
1. $\alpha + \beta + \gamma < 1$ (confirmed: ~0.31 for fixed assets)
2. Revenue shares constant
3. Manager effects proportional to $1/\chi$