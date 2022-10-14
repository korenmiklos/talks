---
title: "Machines and Machinists: Incremental Technical Change and Wage Inequality"
author: 
    - Miklós Koren
    - Márton Csillag
    - János Köllő
aspectratio: 1610
---

# Motivation

## Inequality and polarization in the U.S.
![](table/autor-etal-2008.pdf)

## Inequality and polarization in Germany
![](table/dustmann-etal-2009.pdf)

## Wage inequality has increased in many countries
- U.S. (Katz, Loveman & Blanchflower 1995, Autor, Katz & Kearney 2008)
- U.K. and Japan (Katz et al. 1995)
- Germany (Dustmann, Ludsteck & Schönberg 2009), Poland (Rutkowski 1996, Rutkowski 1997)
- Czech Republic, Hungary, Romania and Slovenia (Rutkowski 1997)

## Is technology to blame?
### Emergence of radically new technologies favors some groups over others
- steam engines (Katz & Margo 2014, Franck & Galor 2015)
- electrification (Goldin & Katz 2008, Chapter 3)
- mass production and its dissolution (Piore & Sabel 1984)
- automation (Autor, Levy & Murnane 2003, Autor 2015, Acemoglu & Restrepo 2017) 
- industrial robots (Acemoglu & Restrepo 2019, Dixon, Hong & Wu 2019, Koch, Manuylov & Smolka 2019, Graetz & Michaels 2018, Findeisen, Dauth, Suedekum & Woessner 2018)

## Two challenges to this explanation
1. Inequality increase in pervasive, even within well-defined skill and occupation groups.
2. Technical revolutions are rare (in time, across countries).

## Another explanation: capital-skill complementarity


## This paper

1. A novel theoretical mechanism of capital-quality-skill complementarity: **incremental** improvement of machine quality differentially affect workers with **similar** skills.
2. Direct micro evidence for this mechanism from Hungarian industry 1988--2003.

## Weaver productivity across countries and over time

### Clark, 1987
"In 1910 one New England cotton  textile  operative performed as much work as  1.5  British,  2.3 German,  and nearly 6 Greek,  Japanese,  Indian, or Chinese  workers."

### Bessen, 2012
"A typical weaver in the United States in 1902 produced over *50 times* as many yards of cloth in an hour of weaving as did a weaver a century earlier producing a comparable cloth. [...] The weaver in 1902, however, achieved that output using *eighteen* power-driven looms while the weaver of 1802 used a single handloom."

### Sutton, 2001
"On technical performance, there was a small but significant quality gap in favour of the imported [rather than Indian] machine."


## Outline
1. An engineering production function
2. Equilibrium assignment of machines and machinists
3. A case study of a weaving mill
4. Imported machines and wages in Hungary, 1992-2003
5. Discussion and conclusion


# An engineering production function
## Standard model
$$
Y = A F(K, L)
$$

What is the shape of $F$?

## How do machines and people work together?
Tool model
: A worker feeds material into a metal press (both worker and machine busy) to produce.

Operator model
: A power loom produces in an autonomous fashion (worker idle), until a problem arises. The operator fixes it (machine idle) to get it back to work as fast as possible.

This paper: while the tool model assumes Leontief production, the operator model leads to non-trivial patterns of complementarity.

## Tool model
![](figure/tool.png)

## Operator model
![](figure/operator.png)

## Two measures of quality
machine quality
: Expected autonomous uptime $\theta$

worker skill
: Speed of fixing problems $h$

Machine busy for $\theta$, idle for $1/h$. 

Expected fraction of time working : $\theta h / (1 + \theta h) \equiv x$. 

Worker busy $(1-x)$ fraction of the time.

## Production function
$$
dY = \begin{cases}
A dt    & \text{if machine running, $s=1$}\\
0       & \text{if not, $s=0$}
\end{cases}
$$

## Markov chain for machine uptime
Kolmogorov equation:
$$
\dot x(t) = -\frac 1{\theta}x(t) + h[1-x(t)].
$$

## Ergodic distribution
$$
\frac1T\int_{t=0}^T x(t)dt \approx x^*.
$$
The steady-state probability is the solution to $-\frac 1{\theta}x(t) + h[1-x(t)]=0$,
$$
x^* = \frac{\theta h}{1+\theta h}.
$$

## Expected output
A worker type $h$ operating $k$ units of a machine type $\theta$ produces, in expectation,
\begin{equation}\label{eq:output:1}
	F(A,k,\theta,h)=A k \frac{\theta h}{1+\theta h} = Akx
\end{equation}


## Are worker skill and machine quality complementary?
### For sufficiently autonomous machines, they are **substitutes**
$$
\frac   {\partial^2 F(A,k,\theta,h)}
    {\partial \theta \partial h} < 0
$$
iff
$$
\frac{\theta h}{1+\theta h} > 0.5.
$$

## Are worker skill and machine quality complementary?
### But this takes a **fixed number** of machines per worker 
Pattern may be different if $k$ can also adjust (Eeckhout and Kircher 2018).

Recall that worker is idle $x$ fraction of the time. She can operate $1/(1-x) = 1+\theta h$ machines.

At optimal *quantity* of machines
$$
F(A,1+\theta h,\theta,h) = A\theta h,
$$
machine quality and worker skill are **complementary**.

# Equilibrium assignment of machines and machinists

## Equilibrium assignment of machines and machinists
- Workers have upward-sloping labor supply curve at each employer (Card et al 2018). (Can be microfounded by a search model.)
- Marginal product of labor:
$$
\lambda(h) = 
(A_m -\mu_m)\theta_m h - \mu_m.
$$
- Wages are a weighted average of marginal product and outside option $b$,
\begin{equation}
w_{ijm} = \beta (A_m -\mu_m)\theta_m h_i - \beta\mu_m + (1-\beta)b,
\end{equation}

## Machine assignment and wage setting by worker skill
\begin{figure}[h!]\centering
\input{figure/sorting1.tex}
\end{figure}

## Technology upgrading by worker skill
\begin{figure}[h!]\centering
\input{figure/sorting2.tex}
\end{figure}

# A case study of a weaving mill

## The number of old and new machines, 1988--1997
![](figure/number-of-machines.pdf)

## Differences between new and old machines---Regression estimates, 1991--1997
  \begin{table}[h!]
\begin{threeparttable}
\centering
\input{table/table1.tex}
\end{threeparttable}
\end{table}

## Wage distribution before and after the adoption of new looms
\begin{figure}[h!]\centering
\includegraphics[width=\linewidth]{weaver-case-study/wage_inequality.pdf}
\end{figure}

## Wage gain from moving from an old to a new machine
\begin{table}[h!]
\begin{threeparttable}
\centering
\input{table/table3.tex}
\end{threeparttable}
\end{table}

## The effect of machine type and worker quality on log output per machine
\begin{table}[h!]
\begin{threeparttable}
\centering
\input{table/table4.tex}
\end{threeparttable}
\end{table}

# Imported machines and wages in Hungary

## The estimation sample over time
\begin{table}[h!]
\begin{threeparttable}
\input{table/sample_trends.tex}
\end{threeparttable}
\end{table}

## Average machinery tariffs
\begin{table}[h!]
\begin{threeparttable}
\input{table/tariff_trends.tex}
\end{threeparttable}
\end{table}

## Occupations with faster tariff cuts adopt imported machines faster
![](figure/import_tariff_correlation.pdf)

## Wage inequality over time
\begin{table}[h!]
\begin{threeparttable}
\input{table/inequality_trends.tex}
\end{threeparttable}
\end{table}

## Actual and counterfactual wage change by wage percentile
\begin{figure}[h!]\centering
\includegraphics[width=0.7\linewidth]{figure/wage_growth.pdf}
\end{figure}

## Among high-wage workers, early importers are overrepresented
![](figure/wage_density.pdf)

## Estimable equation
\begin{equation}\tag{\ref{eq:estimable}}
\ln w_{ij} \approx \ln(1-\beta)b +
\frac{\beta}{(1-\beta)b}
\left[
\tilde A_0\theta_0 h_i - \mu_0
+\chi_{ij} (\tilde A_1\theta_1-\tilde A_0\theta_0) (h_i-h_j^*)
\right].
\end{equation}
We map this to the available data as follows.
\begin{equation}\label{eq:estimable2}
\ln w_{ijot} = \alpha_{ot} + \nu_{jt}+
\gamma_h h_i
+\gamma_{\chi}\chi_{jot}
+\gamma_{\chi h}\chi_{jot}h_i
+u_{ijot}
.
\end{equation}

## Creating a Bartik instrument
\begin{equation}
	\hat K_{jot} = 
	\frac
		{n_{jot} + n_{jo,t+1}}
		{\sum_{l} (n_{jlt} + n_{jl,t+1})}
	\times
		K_{jt}.
\end{equation}

\begin{equation}
	\hat M_{jot} = 
	\frac
		{\hat K_{jot_0}}
		{\sum_{l} \hat K_{lot_0}}
	\times
		M_{ot}.
\end{equation}

## The effect of import exposure on wages
\begin{table}[h!]
\begin{threeparttable}
\input{regression/OLS/table.tex}
\end{threeparttable}
\end{table}

## Robustness to various firm controls
\begin{table}[h!]
\begin{threeparttable}
\input{regression/firm_controls/table.tex}
\end{threeparttable}
\end{table}

# Appendix

# Complementarity and the quality-quantity trade-off
Eeckhout and Kircher (2018) study
$$
F(\theta, h, K, L).
$$
There is positive assortative matching iff
$$
F_{\theta h} \ge \frac
    {F_{\theta L} F_{hK} }
    {F_{KL}.}
$$

## Worker wages
Workers earn $w$ in agriculture. Large $L$ number of workers, few $K$ machines.

## Net output over agriculture
$$
x - w(1-x) = x(1+w) - w
$$

## Equilibrium
$$
K(1-x) \le L
$$

## Output per worker hour
$$
\frac {xK_i}{L_i} = \frac {x}{1-x}
$$

## Output per worker hour
![](figure/output_per_hour.png)

## Return to machine quality
$$
\frac{\partial Q}{\partial \theta} = 
x(1-x)(1+w)
$$

## Return to machine quality
![](figure/return_to_theta.png)

## Value of a machine
$$
Q_i - w L_i = 
x(1 + w) - w
$$

## Value of a machine
![](figure/value_of_machine.png)

# Innovation
## Two types of innovation
1. Improve quality $\theta$
2. Build more machines $K$

Suppose both cost the same amount of final goods.

## Three epochs of innovation
1. Artisanal period. Labor is slack, wages are determined in agriculture. Improving machine quality has higher return. $x(1-x)(1+w) > x(1+w)-w$. $x$ continues to increase.
2. Mass production. Value of a machine is high enough to produce more. $K/L$ increases with constant $x$.
3. Automation. After all $L$ has been absorbed from agriculture, wages start to rise. The returns to labor-saving machine quality improvement now exceed the value of an old machine. $x$ keeps increasing.

## Plus one
4. Singularity (never reached). As $x\to1$, the ratio of machine time to worker time grows without bound. Nobody works, all work is done by robots. But to reach this state from a very large degree of automation (say, $x=0.999$), labor has to capture almost all of the output, otherwise there is no incentive to innovate further.

## Artisanal period
$$
\frac w{1+w} \le x \le \sqrt{\frac w{1+w}}
$$


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
![](figure/table-ii.pdf)

## Capital intensity around import peaks
![](figure/ES_import_ln_K_L.pdf)

## Material intensity around import peaks
![](figure/ES_import_ln_M_L.pdf)



## Investment rate distribution
![](figure/IR_dist_tot.pdf)

## Imported investment rate distribution
![](figure/IR_dist_imp.pdf)

## Import share in capital sock
![](figure/hist_impstock.pdf)


# Event studies around large investments
## Capital stock increases by same amount (by construction)
![](figure/ES_lnK.pdf)

## TFP improves more for imported investment
![](figure/ES_TFP.pdf)

## Material intensity increases for both types of investment
![](figure/ES_ln_M_L.pdf)

## Material import intensity jumps more for imported investment
![](figure/ES_matimpshare.pdf)

## Average wage reacts to domestic investment
![](figure/ES_ln_wage.pdf)



# Identification

## Interim Agreement with EEA (1991) phased out tariffs
![](figure/tariff-phaseout.pdf)

## Faster phaseout results in faster imports (Koren, Csillag and Köllő, 2019)
![](figure/import_tariff_correlation.pdf)


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
![](figure/import-probability.pdf)


# Results

## First stage
![](figure/first-stage.pdf)

## Productivity
![](figure/TFP.pdf)

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
![](figure/fxy.pdf)

## Assortative assignment (Koren, Csillag and Köllő, 2019)
![](figure/PAM.pdf)

## Imported machines are more material intensive
![](figure/MperL.pdf)

## Imported machines are more _imported_ material intensive
![](figure/matimport.pdf)

## Imported machines use higher quality labor
![](figure/wage.pdf)
