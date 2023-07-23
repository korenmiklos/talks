---
author: Miklós Koren
title: Discussion of "International Diversification, Reallocation, and the Labor Share"
date: July 24, 2023
aspectratio: 1610
lang: en
---

# One-page summary
## One-page summary

# Theory
## Risk-adjusted profit maximization
$$
\max E(\pi_{it})
$$
vs
$$
\max E(\Lambda_{t}\pi_{it})
$$

## The mechanism
$$
Q_{it} = A_{it} F(L_{it-1}, M_{it})
$$
$M$: chosen **after** $A$ is known
$$
\max_{M_{it}}
A_{it} F(L_{it-1}, M_{it}) - \rho_{it}M_{it}
\equiv Y(A_{it}, L_{it-1}, \rho_{it})
$$
$L$: chosen **before** $A$ is known (not only labor)
$$
\max_{L_{it-1}}
E[\Lambda_t [Y(A_{it}, L_{it-1}, \rho_{it})] - E[\Lambda_t]w_{t-1} L_{it-1}
$$

## Intuition
Firm is a *leveraged* portfolio with a risky asset $Y$ and a safe liability $wL$.

Optimal leverage depends on risk-return tradeoff: 

Leverage ratio is the "labor share."

## What drives firm-specific risk?


# Empirics
## Empirics
1. Sample selection
2. Other controls

## Sample selection
Paper: Compustat data

But: publicly traded firms have a very different risk trajectory from private firms (Comin and Philippon 2006 vs Davis et al 2007)

## Volatility trends for public and private firms
![Davis et al 2007 (Figure 2.5)](fig/fig2-5.pdf)

## Portfolios by beta
| Beta portfolio | Mean labor share     |
-----------------|-----------|
| 0                        | 0.619     |
| 1                        | 0.589     |
| 2                        | 0.523     |
| 3                        | 0.457     |
| 4                        | 0.456     |

## Portfolios by firm size
| Size portfolio | Mean labor share   |
|----------------|--------|
| 0              | 0.785  |
| 1              | 0.725  |
| 2              | 0.665  |
| 3              | 0.582  |
| 4              | 0.508  |


## Combined portfolios
| Beta | Size 0 | Size 1 | Size 2 | Size 3 | Size 4 | 
|--------------------------|------------------|------------------|------------------|------------------|------------------|
| 0                        | 0.772            | 0.702            | 0.640            | 0.527            | 0.621            |
| 1                        | 0.786            | 0.732            | 0.664            | 0.596            | 0.587            |
| 2                        | 0.788            | 0.741            | 0.680            | 0.594            | 0.519            |
| 3                        | 0.775            | 0.723            | 0.663            | 0.574            | 0.449            |
| 4                        | 0.787            | 0.720            | 0.661            | 0.580            | 0.441            |
