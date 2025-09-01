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

# Motivation

## What is the marginal product of a CEO?

### What we know
- Management matters. Consulting (India: Bloom et al. 2013), large-scale training (Italy: Giorcelli 2019, US: Bianchi and Giorcelli 2022, Giorcelli 2023)
- Managers matter. Event studies around CEO changes (US: Bertrand and Schoar 2003, Schoar and Zuo 2016, Metcalfe et al. 2023, Italy: Sauvagnat and Schivardi 2024, Denmark: Bennedsen et al 2020)

### But
- Most studies focus on public firms in rich countries.

## What about privately held firms?
1. Limited data on compensation, decisions, financials
2. Owners often have oversized control roles
3. Data on small firms more noisy

## This paper
1. Model CEO effects in presence of owner-chosen inputs
2. Collect data on 1m+ firms, 1m+ CEOs in Hungary 1992--2022
3. Design a placebo-controlled event study to measure true CEO effects

## Preview of Results
- Standard approach: 22.5% performance gap between "good" and "bad" CEOs
- Our placebo test: 17% is noise
- **True CEO effect: 5.5%**


## Roadmap



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


# Theoretical Framework

## Production Structure

Firms combine fixed and variable inputs:

$$Q_{imt} = \Omega_{it}A_i Z_{m} K_{it}^\alpha L_{imt}^{\beta} M_{imt}^{\gamma}$$

- $A_i$: Organizational capital (owner-chosen)
- $Z_m$: Manager skill ($\to$ TFP)
- $K_{it}$: Physical capital (owner-chosen)
- $L_{imt}$, $M_{imt}$: Labor, materials (manager-chosen)

## Division of Control
- Concentrated ownership limits managerial discretion (Fama & Jensen, 1983; Jensen & Meckling, 1976)
- Family firms retain control rights (Burkart et al., 2003)
- Plant managers have even more limited control over investments (Bloom et al., 2012, 2019)

### Owners Control
Physical capital investment, intellectual property, industry and location, CEO hiring/firing

### Managers Control
Labor hiring, input purchasing, operations, day-to-day decisions

## Evidence on Manager Control Rights
\input{tables/tableA0.tex}



## Optimization Problem

Manager maximizes profit given fixed inputs:

$$\max_{L,M} P_{st}Q_{imt} - W_{st}L_{imt} - \varrho_{st}M_{imt}$$

First-order conditions pin down optimal scale

\begin{equation}\label{eq:revenue}
R_{imst} = (P_{st}\Omega_{it}A_i Z_m)^{1/\chi}
K_{it}^{\alpha/\chi}
W_{st}^{-\beta/\chi}
\varrho_{st}^{-\gamma/\chi}
(1-\chi)^{(1-\chi)/\chi}.
\end{equation}


## Surplus $=$ Rent to Fixed Factors

Surplus to fixed factors:
$$S_{imst} = R_{imst} - W_{st}L_{imst} - \varrho_{st}M_{imst} = \chi \cdot R_{imst}$$

where $\chi = 1 - \beta - \gamma$

\begin{equation}\label{eq:surplus}
S_{imst} = \chi (P_{st}\Omega_{it}A_i Z_m)^{1/\chi}
K_{it}^{\alpha/\chi}
W_{st}^{-\beta/\chi}
\varrho_{st}^{-\gamma/\chi}
(1-\chi)^{(1-\chi)/\chi}.
\end{equation}

Owner controls $A_i$ and $K_{it}$

Manager controls $Z_m$

## Estimable Equation
Taking logs and substituting out invariant terms,

\begin{equation}\label{eq:estimation}
r_{imst} = \frac\alpha\chi k_{it}  + \frac1\chi{z}_m + \lambda_i + \mu_{st} + \tilde \omega_{it}
\end{equation}

### Assumptions
1. All firms with the sector face the same prices
2. Residual TFP uncorrelated with owner and manager choices
  - Timing can be checked in event study.
3. Owner and manager choices can be arbitrarily correlated

### Estimate with Two-Way Fixed Effects

# Data

## The Hungarian Context

### Why Hungary?
- Complete administrative data
  - All incorporated businesses
  - Mandatory CEO registration
- 30+ years of coverage

### Economic Background
- Transition economy 1990s
- EU accession 2004
- Mix of domestic and foreign firms

## Data Sources

### Firm Registry (Cégjegyzék LTS)
- CEO appointments and terminations
- Ownership structure
- Complete since 1992

### Balance Sheet Data (Mérleg LTS)
- All firms filing financial statements
- Revenue, costs, employment, assets
- 1980-2022 coverage
- 10.2 million firm-years

## Sample Construction
Exclude firms that:

- ever have more than 2 CEOs in a year
- have more than 6 CEOs during their lifetime
- are in their first year (often incomplete)
- were ever state owned
- operate in mining and finance
- never reach 5 employees

## CEO Characteristics

| Characteristic | Share |
|----------------|-------|
| Hungarian name | 95% |
| Male (among HU) | 73% |
| Founder | 69% |
| Multiple firms | 18% |
| Connected component | 26,476 managers |

## Industry Distribution

\input{tables/tableA1.tex}

## Temporal Patterns

\input{tables/table1.tex}

## CEO Turnover Patterns

::: {.columns}
:::: {.column}
\input{tables/table6_panelA.tex}
::::
:::: {.column}
\input{tables/table6_panelB.tex}
::::
:::

# Estimation

## Estimation steps
1. Estimate $\chi$ as $1-$ revenue share of labor and material
2. Estimate revenue function with rich fixed effects to recover coefficients of fixed factors
3. Estimate firm and manager fixed effects with TWFE on **largest connected component**
4. Check dynamics of effects via event study

## Surplus Share (1)
Follow Halpern et al. (2015), Gandhi et al. (2020)

$$
\hat\chi_s := 1 - \frac {\sum_{i\in s}(W_{st}L_{it} + \varrho_{st}M_{it}) } 
  {\sum_{i\in s} R_{it}}
$$

## Revenue Function (2)

$$
r_{imst} = \frac\alpha\chi k_{it}  + \frac1\chi{z}_m + \lambda_i + \mu_{st} + \tilde \omega_{it}
$$

### Assumptions
1. All firms with the sector face the same prices
2. Residual TFP uncorrelated with owner and manager choices
  - Timing can be checked in event study.
3. Owner and manager choices can be arbitrarily correlated

## Recovering Firm and Manager Fixed Effects (3)
$$
\tilde r_{imst} := \hat\chi r_{imst} - \hat\alpha k_{it} - \hat\mu_{st}=  {z}_m + \lambda_i  + \omega_{it}
$$
Remove firm fixed effect by subtracting firm average,
$$
\Delta\tilde r_{imt} =  
\Delta {z}_{m_{it}} +
\Delta\omega_{it}
$$
with
$$
\Delta x_{it} := x_{it} - \frac1{N_i}\sum_\tau x_{i\tau}
$$

## Identification Challenges
1. Residual TFP trends may be correlated with manager change (reverse causality)
  - We don't need _random mobility_.
  - Usual solution: exogenous removal of CEO (hospitalization: Bennedsen et al 2020, death: Sauvagnat and Schivardi 2024)
2. Firm and manager effects can only be interpreted against a baseline group in connected component
  - We use _largest connected component_ (Abowd et al. 2002)
3. Fixed effects estimated with small-sample noise
  - IV designs can even exacerbate small-sample problem


## A Two-Manager Example
Manager effect

| 1 | 2 | 3 | 4 | 5 | 6 |
|---|---|---|---|---|---|
| $z_1$ | $z_1$ | $z_1$ | $z_2$ | $z_2$ | $z_2$ |
| $\omega_1$ | $\omega_2$ | $\omega_3$ |  $\omega_4$ |  $\omega_5$ |  $\omega_6$ |  

$$
\hat z_1 := z_1 + \frac13(\omega_1 + \omega_2 + \omega_3)
$$
$$
\hat z_2 := z_2 + \frac13(\omega_4 + \omega_5 + \omega_6)
$$

## Our Solution: Placebo Control

When CEO doesn't change
$$
\Delta\tilde r_{imt} =  
\Delta\omega_{it}.
$$
By doing the exact same estimation procedure around "non-changes," we can filter out the noise.

### Constructing Placebos
1. Estimate time-variante hazard of CEO change ($\approx$ 20\%/year)
2. Pick firms with long CEO tenures (7+ years)
3. Randomly assign placebo changes with the estimated hazard

## Placebo Spells are Similar to Actual Ones
\input{tables/table6_panelB.tex}


## Event Study (4)
Treatment: CEO changes at time $g$.

Control: Placebo change at time $g$.

$$
\tilde r_{imt} =  \lambda_i + \gamma_{t-g} + \omega_{it}
$$
with $\gamma$ estimated with 2-treatment version of Callaway--Sant'Anna (2020), `xt2treatments` (Koren 2025) for different groups of managers.


# Results

## Surplus Share by Industry (1)
\input{tables/tableA1.tex}

## Revenue Function Estimation (2)
\input{tables/table3.tex}

## Manager Fixed Effects in the Giant Component (3)

![](figures/manager_skill_connected.pdf){ width=80% }

P25-P75 difference: 24.6% productivity

## Event Study (4)
![](figures/event_study_panel_c.pdf){ width=80% }

Dip in average TFP before CEO change. Elevated variance, stabilizing after CEO change.

## Split by "Good" and "Bad" CEOs ($\pm$ 1%)
![](figures/event_study.pdf){ width=80% }

## Actual vs Placebo Effects

| Transition | Actual | Placebo | Difference |
|------------|--------|---------|------------|
| Bad $\to$ Good |  |  | 3.9** |
| Good $\to$ Bad |  |  | -1.2** |
| Gap | 22.1*** | 17.1*** | 5.0*** |

# Implications

## For Empirical Research

### Don't Use Raw Manager FE
- 75% noise → severe attenuation bias
- Correlations misleading

### Better Practices
1. Include observable characteristics (foreign, education, cohort)
2. Manager quality on LHS only (never RHS due to attenuation)
3. Avoid simple correlations (inflated variance)
4. Implement placebo checks



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