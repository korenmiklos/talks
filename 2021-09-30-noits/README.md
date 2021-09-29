---
title: "Foreign Firms and Foreign Managers"
author: 
    - Miklós Koren
    - Álmos Telegdy
date: 
    - "NOITS 2021. Thanks: ERC Knowledgeflows, Krisztián Fekete, Dávid Koller, Olivér Kiss, Szilárd Perédi, Bálint Szilágyi, András Vereckei, Rita Zágoni, Gergő Závecz"
aspectratio: 16
---

# Motivation
## Motivation
Why and how do firms produce abroad?

1. What are the boundaries of (global) firms?
2. Foreign owned firms perform better than domestic firms
3. Managers matter


## What are the boundaries of (global) firms?
\begin{tikzpicture}
\node (a) at (0,0) {arm's length};
\node (b) at (3,0) {relational};
\node (c) at (6,0) {acquisition};
\node (d) at (9,0) {management};
\graph { (a) -> (b) -> (c) -> (d)};
\end{tikzpicture}


## Foreign owned firms perform better than domestic firms
* US: Doms and Jensen (1998)
* UK: Griffith (1999)
* Hungary, Romania, Russia, Ukraine: Brown, Earle, Telegdy (2006)
* Indonesia: Arnold and Javorcik (2009)

## Managers matter
* Good management practices  increase  productivity  (Bloom  and  Van  Reenen  2010;  Bloom  et  al.  2012;  Bloom  et  al.  2014) and market access (Bloom et al. 2016). 
* CEOs behaving like ``leaders" gradually improve firm performance. (Bandiera, Hansen, Prat and Sadun 2018)
* Large increase  in  the  level  and  inequality  of  CEO  pay.  (Murphy  and  Zábojník  2004;  Gabaix  and  Landier  2008;  Tervio  2008; Frydman and Saks 2010)
* Managers have persistent effects across firms on investment policy, R\&D, advertising, return on assets.  (Bertrand and Schoar 2003)
* Sudden CEO death worsens firm performance. (Bennedsen, Pérez-González and Wolfenzon 2007) 
* Managers having past export experience increase likelihood of exporting (Mion and Opromolla 2014; Mion, Opromolla and Sforza 2016) and importing (Bisztray, Koren and Szeidl 2018).


## This paper
* Compile new data on which firm is run by which manager: Hungary, 1980--2018. 
* Measure different degrees of foreign control:
    1. acquisition
    2. replace CEO
    3. hire expat CEO
* Results:
    * Exporters and low-productivity firms become more tightly controlled. 
    * Firms with high immaterial capital receive local managers.
    * Foreign controlled firms become more productive and more likely to export. 


# Data

## Data
### Hungarian Manager Database
* coverage: universe of corporations, 1980--2018
* CEO: highest officer of corporation as specified in corporate law.
    - information: name, mother's name, address, tenure at firm
* 1 million firms, 2 million CEOs, 5 million job spells

### Balance sheet data
* coverage: universe of double entry firms, 1980--2018
* information: sales, exports, employment, equipment, immaterials etc.

## Names
* We use manager names to infer 
    1. CEO change
    2. nationality
    3. gender (not used today)
* Foreign manager: firm representative with a non-Hungarian first name
    - e.g. Eva Bauer v Bauer Éva
    - but: George Soros v Soros György
* Allow for misspelling, omitted middle name, missing data (jr, dr)

## Sample
- Exclude: 
    - employing less than 20 people
    - financial sector
    - domestic firms with expat CEO
    - greenfield FDI
    - firms with more than 15 CEOs
- Left with 24,500 firms

# Descriptives
## The number of CEOs increased sharply until 2010
![](input/ceo-panel/fig/manager-type-by-year/fig.pdf)

## The share of firms managed by founders gradually decreases with age
![](input/ceo-panel/fig/manager-type-by-age/fig.pdf)

## Founders stay longest at the firm
![](input/ceo-panel/fig/tenure-by-type-weighted/fig.pdf)


## Degree of control
\begin{tikzpicture}
\node (a) [text width=1.5cm] at (0,0) {domestic (243,388) (22,761)};
\node (b) [text width=1.5cm] at (3,0) {acquired (20,781) (1,770)};
\node (c) [text width=1.5cm] at (6,0) {mgr replaced (15,784) (1,235)};
\node (d) [text width=1.5cm] at (9,0) {expat hired (9,184) (654)};
\graph { (a) -> (b) -> (c) -> (d)};
\end{tikzpicture}

## Variables
* **foreign**: firm has majority foreign owner
* **foreign\_hire**: firm has a manager hired by foreign owner
* **has\_expat**: firm has an expat manager
* **CONTROL${}^k$**: one of the three ($k=1,2,3$)
* **lnL**: log employment
* **lnQL**: log output per worker
* **TFP\_cd**: TFP (simple Cobb--Douglas)
* **exporter**: firm has positive exports
* **RperK**: share of immaterial assets in total [0,1]

# Estimation
## Differences in differences
$$
Y_{it} = \alpha_i + \nu_t + \beta \text{CONTROL}_{it} + u_{it}
$$

### Old diff-in-diff
Estimate (\*) by two-way fixed effects.

### New diff-in-diff
Compute group-specific treatment effects and aggregate. (Callaway and Sant'Anna 2020)

## Problem with TWFE

## Callaway - Sant'Anna solution
$G_{i}$: time of treatment of unit $i$ (may be $\infty$)

$C_{gt} = \{i: G_i > \max(g,t)\}$: control group is not yet treated

$$
\gamma_{gt} := \sum_{i: G_i=g} (Y_{it} - Y_{ig})
- \sum_{i\in C_{gt}} (Y_{it} - Y_{ig})
$$

Aggregate $\gamma_{gt}$ with "suitable" weights


## Multiple treatments
We have three treatments: acquisition only, domestic hire, expat hire.

How to do Callaway-Sant'Anna in this case? 

Make sure treatments don't "leak" into controls. 

## Our solution
$G_{i}^k$: time of treatment $k$ of unit $i$ (may be $\infty$)

$C_{gt} = \{i: \min_k G_i^k > \max(g,t)\}$: control group is not yet treated with **any** of the treatments

$$
\gamma_{gt}^k := \sum_{i: G_i=g} (Y_{it} - Y_{ig})
- \sum_{i\in C_{gt}} (Y_{it} - Y_{ig})
$$

Each treatment has the **same** control group.

## Estimating equations
### Bernard-Jensen
Sample: domestic firms and acquisitions
$$
Y_{ist} # \mu_{st} + \sum_{k=1}^3 \beta_k \text{CONTROL}_{it}^k + u_{ist}
$$

### Selection
Sample: $\text{CONTROL}_{i}^{k-1} # 1$, years before acquisition
$$
\text{CONTROL}_{i}^k # \mu_{st} + \gamma X_{it}  + u_{ist}
$$

### Diff-in-diff
Sample: domestic firms and acquisitions
$$
Y_{ist} # \alpha_i + \mu_{st} + \sum_{k=1}^3 \beta_k \text{CONTROL}_{it}^k + u_{ist}
$$

## Callaway-Sant'Anna estimates

## Foreign firms are better in most respects
\regressiontable{cross_section}

## Positive selection on exports, negative on TFP
\regressiontable{selection}

## Hiring an expat is associated with increased productivity and exporting
\regressiontable{diffindiff}

## Expats help start exporting, but have no effect on continuation
\regressiontable{exporter}

# Conclusions
## Conclusions
* What are the causes and consequences of foreign acquisitions?
* We ask when managers are also replaced.
* Using data on the universe of foreign acquisitions in Hungary, 1980-2018, we estimate that exporters and low-productivity firms become more tightly controlled. 
* Foreign controlled firms become more productive and more likely to export. 
* These facts help inform theories about the boundaries of global firms and about the role of managers in firm performance.

## Next steps
* Collect data on parent firms.
* Build an incomplete-contract model.
