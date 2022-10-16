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
![](table/autor-etal-2008.pdf){ height=100% align=center }

## Inequality and polarization in Germany
![](table/dustmann-etal-2009.pdf){ height=100% align=center }

## Wage inequality has increased in many countries
- U.S. \smallcite{Katz, Loveman \& Blanchflower 1995, Autor, Katz \& Kearney 2008}
- U.K. and Japan \smallcite{Katz et al. 1995}
- Germany \smallcite{Dustmann, Ludsteck \& Schönberg 2009), Poland (Rutkowski 1996, Rutkowski 1997}
- Czech Republic, Hungary, Romania and Slovenia \smallcite{Rutkowski 1997}

## Is technology to blame?
### Emergence of radically new technologies favors some groups over others
- steam engines \smallcite{Katz \& Margo 2014, Franck \& Galor 2015}
- electrification \smallcite{Goldin \& Katz 2008, Chapter 3}
- mass production and its dissolution \smallcite{Piore \& Sabel 1984}
- automation \smallcite{Autor, Levy \& Murnane 2003, Autor 2015, Acemoglu \& Restrepo 2017} 
- industrial robots \smallcite{Acemoglu \& Restrepo 2019, Dixon, Hong \& Wu 2019, Koch, Manuylov \& Smolka 2019, Graetz \& Michaels 2018, Findeisen, Dauth, Suedekum \& Woessner 2018}

## Two challenges to this explanation
1. Inequality increase in pervasive, even within well-defined skill and occupation groups.
2. Technical revolutions are rare (in time, across countries).

## Another explanation: capital-skill complementarity
Krusell et al (2000): lower relative price of capital goods can quantitatively explain the rise in the skill premium.

## Model fits well after 20 more years
![](figure/maliar-etal-2022.pdf){ height=100% align=center }

## This paper

1. A novel theoretical mechanism of capital-*quality*-skill complementarity: *incremental* improvement of machine quality differentially affect workers with *similar* skills.
2. Direct micro evidence for this mechanism from Hungarian industry 1988--2003.
3. Access to better machines can explain about half of the increase in within-occupation wage inequality in this period.

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


## Production function
A machine produces $A$ units per time:
$$
dY = \begin{cases}
A dt    & \text{if machine running, $s=1$}\\
0       & \text{if not, $s=0$}
\end{cases}
$$

## The need for human intervention
Machine breaks down with Poisson arrival $1/\theta$.

Worker fixes it with Poisson arrival $h$.

Markov chain:
$$
\begin{pmatrix}
d\pi_1 \\
d\pi_0
\end{pmatrix} =
\begin{bmatrix}
-1/\theta & h\\
1/\theta & -h
\end{bmatrix}
\begin{pmatrix}
\pi_1 \\
\pi_0
\end{pmatrix} dt
$$

## Two measures of quality
machine quality
: Expected autonomous uptime $\theta$

worker skill
: Speed of fixing problems $h$

## Ergodic distribution of machine runtime
$$
\frac1T\int_{t=0}^T \pi_1(t)dt \approx \pi_1^*.
$$
The steady-state probability is the solution to $-\frac 1{\theta}\pi_1(t) + h[1-\pi_1(t)]=0$,
$$
\pi_1^* = \frac{\theta h}{1+\theta h}.
$$

## Expected output
A worker type $h$ on a machine type $(A,\theta)$ produces, in expectation,
\begin{equation}\label{eq:output:1}
	F(A,\theta,h) = A \pi_1 =
    A \frac{\theta h}{1+\theta h}.
\end{equation}


## Are worker skill and machine quality complementary?
For sufficiently autonomous machines, they are **substitutes**
$$
\frac   {\partial^2 F(A,\theta,h)}
    {\partial \theta \partial h} < 0
$$
iff
$$
\frac{\theta h}{1+\theta h} > 0.5.
$$

> Intuition: why bother with a good operator on a machine that does not stop frequently?

## Are worker skill and machine quality complementary?
-  But this takes a **fixed number** of machines per worker 
- Pattern may be different if $k$ can also adjust (Eeckhout and Kircher 2018).
- Recall that worker is idle $\pi_1$ fraction of the time. She can operate $1/(1-\pi_1) = 1+\theta h$ machines.
- At optimal *quantity* of machines
$$
(1+\theta h)F(A,\theta,h) = A\theta h,
$$
machine quality and worker skill are **complementary**.

> Intuition: 
> 1. Good workers can operate more machines (quality-quantity substitution).
> 2. Good machines have a higher shadow cost of downtime.

# Equilibrium assignment of machines and machinists

## Equilibrium assignment of machines and machinists
- There are two types of machines with $A_1\theta_1 > A_0\theta_0$ (for now).
- Available in quantity $K_1$ and $K_0$.
- Continuum of worker skills in inelastic supply, $h\in \mathbb R^+$ with continuous distribution $G(h)$.
- Frictionless capital and labor markets (for now).

## Equilibrium
Assignment function $k_m(h): \{0,1\}\times H \to \mathbb R^+$ capturing machine $m$ per worker $h$

Wage function $w(h): H \to \mathbb R^+$

Rental rate of capital: $R_1$ and $R_0$ such that

1. $$w(h) + k_m(h) R_m \ge k_m(h) A_m \theta_m h$$ for $m=0,1$ and $h\in H$ with equality if $k_m(h)>0$ (non-positive profits)
2. $$\int_h k_m(h)dG(h) \le K_m$$ for $m=0,1$ with equality if $R_m>0$ (machine markets clear)
3. $$\sum_{m=0}^1 k_m(h) \frac {1}{1+\theta_m h} \le 1$$ for all $h\in H$ with equality if $w(h)$ (labor markets clear) 


## Solution
### Monge-Kantorovich duality
$$
w(h) +(1+\theta_m h)R_m \ge 
A_m \theta_m h 
$$
for all $h$ and $m$, and $=$ if $k_m(h)>0$

1. Each worker is only assigned to one type of machine: $k_0(h)\cdot k_1(h) = 0$.
2. Machine quantity uses all available worker time: $k_m(h) = 1+\theta_m h$ if $m$ is assigned to $h$

## Assortative matching
- All skills above some $h^*$ work type-1 machines.
- Equilibrium wage rate:
$$
w(h) =
\begin{cases}
(A_1-R_1)\theta_1 h - R_1 & \text{if }h > h^*\\
(A_0-R_0)\theta_0 h - R_0 & \text{otherwise}
\end{cases}
$$
- Equilibrium rental rate such that 
$$
\int_0^{h^*}
(1 + \theta_0 h)dG(h) = K_0
$$
$$
\int_{h^*}^\infty
(1 + \theta_1 h)dG(h) = K_1
$$

## Machine assignment and wage setting by worker skill
\begin{figure}[h!]\centering
\input{figure/sorting1.tex}
\end{figure}

## A Pareto example
Suppose $G(h) = L [1-(h/h_0)^{-\alpha}]$.

Demand for good machines
$$
L\left(\frac {h^*}
    {h_0}
\right)^{-\alpha}
\left(
    1 + \frac{\alpha}{\alpha-1} \theta_1 h^* 
\right)
 = K_1
$$

# Comparative statics

## When more good machines become available, skilled workers benefit
\begin{figure}[h!]\centering
\input{figure/sorting2.tex}
\end{figure}

## Predictions
### Cross sectional patterns
1. Conditional on machine productivity, wages increase in worker skill,
2. higher skilled workers are (weakly) more likely to use a good machine,
3. workers using a good machine earn higher wages,
4. the returns to skill are higher on good machines.

## Technology upgrading
### When $R_1/R_0$ declines,
1. a larger fraction of operators within the firm uses a good machine,
2.  workers switching to a good machine receive a wage increase,
3.  the wage of all existing good machine users increases,
4.  the returns to skill increase.


# A case study of a weaving mill

## Data
Hungarian cotton weaving mill. Soviet and Czechoslovakian (STB and UTAS) weaving machines, older Swiss-made (shuttle Rüti) looms in 1988. Starting in 1989, purchase modern looms from Switzerland (Rüti F and G) and Japan (Toyota).

Data: machines installed (type, properties, output, downtime). Workers on the floor (age, piece wage, machine assignment).

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
## Imported machines and wages in Hungary
Show that

1. Better workers are more likely to get an imported machine.
2. Wages are higher on imported machines.
3. The returns to skill are higher on imported machines.

## Data
1. Linked employer-employee data (Bértarifa)
    - limit to machine operator occupations in industry (narrow skills)
    - drop firms with $<20$ employees
    - repeated random sample of 6 percent (not a panel)
2. Hungarian Customs Statistics, 1992--2003
    - all _direct_ exporter and importer
    - detailed by product (HS6): specific machines

## Sample

## Machine operator occupations
\begin{table}[h!]
\begin{threeparttable}
\input{table/occupations.tex}
\end{threeparttable}
\end{table}

## Wage inequality over time
\begin{table}[h!]
\begin{threeparttable}
\input{table/inequality_trends.tex}
\end{threeparttable}
\end{table}

# Imported machines became more prevalent

## Imported machines became more prevalent
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


## Among high-wage workers, early importers are overrepresented
![](figure/wage_density.pdf)

# Estimation
## Estimable equation
\begin{equation}\label{eq:estimable2}
\ln w_{ijot} = \alpha_{ot} + \nu_{jt}+
\gamma_h h_i
+\gamma_{\chi}\chi_{jot}
+\gamma_{\chi h}\chi_{jot}h_i
+u_{ijot}
.
\end{equation}


## Interim Agreement with EEA (1991) phased out tariffs
![](figure/tariff-phaseout.pdf)

## Occupations with faster tariff cuts adopt imported machines faster
![](figure/import_tariff_correlation.pdf)

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

## Actual and counterfactual wage change by wage percentile
\begin{figure}[h!]\centering
\includegraphics[width=0.7\linewidth]{figure/wage_growth.pdf}
\end{figure}

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

# Frictional labor markets
## Frictional labor markets
- Marginal product of labor:
$$
\lambda(h) = 
(A_m -\mu_m)\theta_m h - \mu_m.
$$
- Workers have upward-sloping labor supply curve at each employer (Card et al 2018). (Can be microfounded by a search model.)
- Wages are a weighted average of marginal product and outside option $b$,
\begin{equation}
w_{ijm} = \beta (A_m -\mu_m)\theta_m h_i - \beta\mu_m + (1-\beta)b,
\end{equation}

# Robustness
## Alternative ways of capturing import exposure
\begin{table}[h!]
\begin{threeparttable}
\input{regression/robustness/table.tex}
\end{threeparttable}
\end{table}


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

## Imported machines are more material intensive
![](figure/MperL.pdf)

## Imported machines are more _imported_ material intensive
![](figure/matimport.pdf)

## Imported machines use higher quality labor
![](figure/wage.pdf)
