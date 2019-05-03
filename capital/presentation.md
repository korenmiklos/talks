---
title: Imported Capital Improves Firm Productivity
author: 
 - László Halpern
 - Cecília Hornok
 - Miklós Koren
 - Adam Szeidl
navigation: empty
---
# Motivation
## Motivation
- Large differences in output per worker (also, multi-factor productivity)
    - across firms in the same narrow industry (Syverson, 2011)
    - across countries (Hall and Jones, 1999; Caselli, 2005)
- One explanation: differences in _quality_ of capital.
- This paper: trade liberalization makes high-quality capital cheaper.

## Weaver productivity across countries and over time

> "In 1910 one New  England cotton  textile  operative performed as much work as  1.5  British,  2.3 German,  and nearly 6 Greek,  Japanese,  Indian, or Chinese  workers." (Clark, 1987)

> "A typical weaver in the United States in 1902 produced over *50 times* as many yards of cloth in an hour of weaving as did a weaver a century earlier producing a comparable cloth." (Bessen, 2012)

## Not all of it is _quantity_ of capital

> "The weaver in 1902, however, achieved that output using *eighteen* power-driven looms while the weaver of 1802 used a single handloom." (Bessen, 2012)

> "On technical performance, there was a small but significant quality gap in favour  of the imported [rather than Indian] machine." (Sutton, 2001)

## Imported machines are better in several dimensions (Koren, Csillag and Köllő, 2019)
![Old vs new machines](exhibits/figures/rabatext-old-new.pdf)

# Production function
## Production function
$$
    Q_{it} = \Omega_{it} (\lambda K_{it}^F + K_{it}^D)^{\alpha} L_{it}^{\beta} M_{it}^\gamma
$$
with $\lambda>1$
$$
    q_{it} \approx \omega_{it} + \alpha k_{it} + \beta l_{it} + \gamma m_{it}
    + \alpha(\lambda-1) \frac{K_{it}^F}{K_{it}}
$$

# Patterns of capital imports
## Data
- Hungarian Customs Statistics, 1992--2003
    - all _direct_ exporter and importer
    - detailed by product (HS6): capital goods
    - and country of origin
- Balance Sheet and Earnings Statement
    - revenue, employment, material cost
    - capital: book value of equipment

## Stocks and flows
- Imports are flows, equipment value is stock.
- Gross investment _flow_:
$$
\hat I_{it} = K_{it} - (1-\delta_{it})K_{i,t-1}
$$
with $\hat I_{it} = \hat I_{it}^D + I_{it}^F$
- Imported equipment _stock_:
$$
\hat K_{it}^F = (1-\hat\delta_{it})\hat K_{i,t-1}^F + I_{it}^F
$$
- Complications: what if $I_{it}^F>I_{it}$?

## Distribution of investment rates (following Khan and Thomas, 2008)
![](exhibits/figures/table-ii.pdf)

## Capital intensity around import peaks
![](exhibits/figures/ES_import_ln_K_L.pdf)

## Material intensity around import peaks
![](exhibits/figures/ES_import_ln_M_L.pdf)



## Investment rate distribution
![](exhibits/figures/IR_dist_tot.pdf)

## Imported investment rate distribution
![](exhibits/figures/IR_dist_imp.pdf)

## Import share in capital sock
![](exhibits/figures/hist_impstock.pdf)


# Event studies around large investments
## Capital stock increases by same amount (by construction)
![](exhibits/figures/ES_lnK.pdf)

## TFP improves more for imported investment
![](exhibits/figures/ES_TFP.pdf)

## Material intensity increases for both types of investment
![](exhibits/figures/ES_ln_M_L.pdf)

## Material import intensity jumps more for imported investment
![](exhibits/figures/ES_matimpshare.pdf)

## Average wage reacts to domestic investment
![](exhibits/figures/ES_ln_wage.pdf)



# Identification

## Interim Agreement with EEA (1991) phased out tariffs
![](exhibits/figures/tariff-phaseout.pdf)

## Faster phaseout results in faster imports (Koren, Csillag and Köllő, 2019)
![](exhibits/figures/import_tariff_correlation.pdf)


## When do firms import?
- Lumpy imported investment suggests fixed cost of importing (also see Halpern, Koren and Szeidl, 2015)
- Import if $p^F_t/p^D_t < f(L_{it})$.
- Hazard of _starting to import_ (flow):
$$
\Pr(K_{it}^F>0| K_{i,t-1}^F=0) = \mu_{st} -\xi \Delta \tau_{st} L_{it}
$$
- Probability of _having imported_ in the past (stock):
$$
\Pr(K_{it}^F>0) \approx \tilde\mu_{st} -\xi L_{it-\text{age}_{it}}\sum_{a=0}^{\text{age}_{it}} \Delta \tau_{st-a} 
$$

## Example of cumulated import hazards
![](exhibits/figures/import-probability.pdf)


# Results

## First stage
![](exhibits/figures/first-stage.pdf)

## Productivity
![](exhibits/figures/TFP.pdf)

# Complementarity
## Complementarity
- Are imported machines complementary with other inputs?
- If so, can explain
    - large gaps
    - divergence
- Two ways to measure complementarity (Brynjolfsson and Milgrom, 2013):
    - performance: $f_{xy} > 0$
    - behavior: $\partial x/\partial y > 0$

## Positive cross derivative of output (Koren, Csillag and Köllő, 2019)
![](exhibits/figures/fxy.pdf)

## Assortative assignment (Koren, Csillag and Köllő, 2019)
![](exhibits/figures/PAM.pdf)

## Imported machines are more material intensive
![](exhibits/figures/MperL.pdf)

## Imported machines are more _imported_ material intensive
![](exhibits/figures/matimport.pdf)

## Imported machines use higher quality labor
![](exhibits/figures/wage.pdf)


# Conclusion
## Conclusion
- Reduced-form evidence from tariff changes and more direct meausures suggest machines imported 1992--2003 in Hungary is better quality than domestic machine of same book value.
- Imported machines improve productivity and are complementary with material, particularly imported material, also with skilled labor.

## Next steps
- Dynamic model of importing.
- Quantitative assessment.

