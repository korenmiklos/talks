---
author: Miklós Koren
title: Discussion of "International Diversification, Reallocation, and the Labor Share"
date: July 24, 2023
aspectratio: 1610
lang: en
---

## One-page summary
1. Aggregate labor share has declined in the US and other developed countries. But firm-level labor share is increasing.
2. Model with risk-adjusted production decisions: quantity and price of firm-specific risk drives labor share.
    - Predicts within-firm increases and reallocation towards low-share firms.
4. Additional predictions confirmed in Compustat data: 
    - Risky firms have lower labor share.
    - Firms with foreign equity are more responsive to risk.

## Outline
1. Intuition for the main mechanism
2. Are public firms representative of the economy?
3. Can we replicate the results in Hungary?

## Risk-adjusted profit maximization
$$
\max_L \text E[AF(K,L) - wL]
$$
vs
$$
\max_L \text E[\Lambda [AF(K,L) - wL]]
$$

## Intuition
Firm is a *leveraged* portfolio with a risky asset $Q$ and a safe liability $L$.

Optimal leverage depends on risk-return tradeoff: higher risk means lower leverage.

Leverage ratio is the "labor share." 

Key assumption: labor is less risky than capital.

## Are public firms representative of the economy?
Publicly traded firms have a very different risk trajectories from private firms (Comin and Philippon 2006 vs Davis et al 2007).

## Volatility trends for public and private firms
![Davis et al 2007 (Figure 2.5)](fig/fig2-5.pdf)

## Data from Hungary
Universe of corporations, 1989-2019: 870k businesses, of which 99% are private.

Labor share: personnel costs / value added (as in paper)

Firm beta: 2-year growth rate of log sales on log aggregate growth (unlike in paper)


## Higher beta firms have lower labor share
| Beta portfolio | Mean labor share     |
-----------------|-----------|
| 0                        | 0.619     |
| 1                        | 0.589     |
| 2                        | 0.523     |
| 3                        | 0.457     |
| 4                        | 0.456     |

## Foreign-owned firms have lower labor share
| Majority owner | Mean labor share |
|-------------------------------------------------------|--------|
| Domestic                                                     | 0.589  |
| Foreign                                                     | 0.440  |

## Bigger firms have lower labor share
| Size portfolio | Mean labor share   |
|----------------|--------|
| 0              | 0.785  |
| 1              | 0.725  |
| 2              | 0.665  |
| 3              | 0.582  |
| 4              | 0.508  |


## Except for largest firms, labor share is driven by size, not beta
| Beta | Size 0 | Size 1 | Size 2 | Size 3 | Size 4 | 
|--------------------------|------------------|------------------|------------------|------------------|------------------|
| 0                        | 0.772            | 0.702            | 0.640            | 0.527            | 0.621            |
| 1                        | 0.786            | 0.732            | 0.664            | 0.596            | 0.587            |
| 2                        | 0.788            | 0.741            | 0.680            | 0.594            | 0.519            |
| 3                        | 0.775            | 0.723            | 0.663            | 0.574            | 0.449            |
| 4                        | 0.787            | 0.720            | 0.661            | 0.580            | 0.441            |

## Smaller points
- What if markets are incomplete? $\Lambda_{it}$ rather than $\Lambda_t$
- Cattaneo et al (2023) "On Binscatter": cannot do covariate adjustment before binscatter