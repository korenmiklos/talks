---
title: "How Similar Are International Economic Relations of EU Member States? Comparing Trade, Investment and Political Behavior"
author: 
    - Matteo Fiorini
    - Miklós Koren
    - Filippo Santi
    - Gergő Závecz
date: 
    - "RESPECT Closing Conference"
aspectratio: 16
---
# Motivation
## Is the E.U. an "optimal trade policy union"?
1. Measure heterogeneity in direction of trade (and investment) between Member States.
    - comparative advantage
    - political economy
    - geopolitical incentives
2. Estimate how this affects their bilateral diplomatic efforts.
3. Develop an early warning system for which bilateral country relations are most "out-of-line" with E.U. average.

## Measuring economic diplomacy
- News mentions from Global Database of Events, Language and Tone 2015--17 (The GDELT Project 2020).
- Actor 1, Actor 2, Type of event, Tone, Date...
- Select: Actor 1 is government entity in EUMS, Actor 2 outside.
    - intent to materially cooperate
    - state visit
    - negotiation
    - agreement
- Measure "intent" and "visits" at bilaterial level.

## Examples of "intent to cooperate"
![](exhibit/szijjarto.png) 

## Examples of "intent to cooperate"
Coded as 

- HUN $\to$ SRB, intent (meeting took place in Budapest)
- HUN $\to$ UKR, visit (meeting took place in Kiev)

## The histogram of GDELT intent and visits
![](../economic-diplomacy/exhibit/hist_dependent_before.png)

## Gravity works for state visits
\input{../economic-diplomacy/exhibit/results_gravity_dependent.tex}

# Methods
## Measuring dissimilarity
- Given a metric, is a MS *different* from the E.U. average?
    - How strongly?
- What is the proper metric?
    - capture incentives to deviate
    - statistically robust

## Trade shares
$s_{ijtp}$: export share of product $p$ in trade between country $i$ and $j$ at time $t$

$s_{*jtp}$: export share of product $p$ in trade between E.U. and country $j$ at time $t$

All dissimilarity measures (e.g., Finger and Kreinin 1979, Krugman 1991, and Fontagné et al 2018) will be
$$
F(\{s_{ijtp}\}, \{s_{*jtp}\}),
$$
typically
$$
\sum_{p=1}^P f(s_{ijtp}, s_{*jtp}).
$$

## Kullback-Leibler Divergence
Our preferred measure of difference between country-specific and EU trade shares is the Kullback-Leibler divergence (Kullback 1987, KLD henceforth), defined as
\begin{equation}
    \text{KLD}_{ijt} =
    \sum_{p=1}^P
        s_{ijtp}
        \ln(s_{ijtp} / s_{*jtp}).
\end{equation}

- only zero if all the products have the same share, positive otherwise 
- based on utility maximizing decision model (logit)

## But this is not statistically robust
![](../economic-diplomacy/exhibit/graph_good_total.png)

Small-sample upward bias because of data sparsity (Armenter and Koren 2014)

## How to allow for noise?
Allow for statistical heterogeneity ("noise") with the appropriate distribution: multivariate Polya (Eggenberger and Pólya 1923)
$$
\alpha_{ijtp} \sim \text{Dirichlet}(s_{*jtp}, T)
$$
$$
x_{ijtp} \sim \text{Multinomial}(\alpha_{ijtp}, n_{ijt})
$$

sparsity: small $n_{ijt}$

heterogeneity: $1/T$ 

## The Polya Index
1. Estimate Polya distribution by maximum likelihood.
2. Under the null of this data generating process, what is the distribution of KLD?
3. Are particular countries outliers? Compute a $p$-value.

## The Polya Index is not uniformly distributed
![](../economic-diplomacy/exhibit/hist_p_all.png)

## The Polya Index is relatively stable over time
![](../economic-diplomacy/exhibit/scatter_p_all.png)



# Data and results
## Trade, investments, and additional controls

- Export data from COMEXT (Eurostat 2019). 
- Investment data from fDIMarket database (Financial Times, 2019)
- geographic distance as well as historical and cultural ties: GeoDist dataset (Mayer and Zignago 2011)
- GDP (expressed in US dollars and taken in log form), World Bank 2020).
- United Nations General Assembly Voting Data (Voeten, Strezhnev and Bailey 2009).
- Difference in democracy from the Quality of Government Basic Dataset (Teorell et al 2020)

## Trade similarity and intent to cooperate are negatively correlated for most countries
![](../economic-diplomacy/exhibit/coefficients_intent_both_all_wofe.png)

## Trade similarity and state visits are negatively correlated for most countries
![](../economic-diplomacy/exhibit/coefficients_visits_both_all_wofe.png)