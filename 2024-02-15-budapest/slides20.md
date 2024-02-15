---
author: Miklós Koren (CEU, HUN-REN KRTK, CEPR and CESifo)
title: "How Can a Bunch of Amateurs Produce Quality Software?"
date: February 15, 2024^[This work was funded by the European Union under the Horizon Europe grant 101061123. Views and opinions expressed are, however, those of the author(s) only and do not necessarily reflect those of the European Union or the European Commission. Neither the European Union nor the granting authority can be held responsible for them.]
aspectratio: 1610
lang: en
titlepage: true
---
## Software is eating the world
### The weightless economy
"Software is eating the world." (Andreessen, 2011)

### Open-source software (OSS) is everywhere
Linux, Apache, MySQL, PHP, Python, R, Julia, Android, Firefox, Chrome, etc.

Also included in proprietary software

## Two economic puzzles in open source
### Why do people work for free?
Altruism, reputation concerns, alternative business models. Sizeable economic literature.

\pause

### How can a bunch of amateurs produce quality software?


## Salient features of OSS
### Price is zero
Not even that unique.

\pause

### Scratch your own itch
Developers are often their own first users: grep, TeX, Linux,  git, etc.

### Free access to source code
"Given enough eyeballs, all bugs are shallow." (Raymond, 1999)

### Software quality is only partly observable
Testing is important.

## Based on two studies

### Success and geography in the weightless economy: Evidence from open-source software
Békés, Hinz, Koren, and Lohman. 2024.

### Bugs \emoji{lady-beetle}
Koren, Békés, and Hinz. 2024.

## Data
### GitHub
Snapshot of all public repositories on GitHub on 2019-06-01. Six largest languages: JavaScript, Python, Java, Ruby, PHP, and C++. Drop smallest and largest projects. 4.4m projects, 2.7m users. Self-reported location.

### libraries.io
Dependency data for projects on major package managers (npm, PyPI, Maven, RubyGems, etc). Studying npm (JavaScript) today.

# Success and geography in the weightless economy: Evidence from open-source software

## Developer density around the globe
![](goos/paper/figures/map_developers.pdf)

## Large variation in number of projects and developers
![](goos/paper/figures/contributors_per_package_ght.pdf){ width=50% } ![](goos/paper/figures/packages_per_contributor_ght.pdf){ width=50% }

## With limits on how many projects one imports
![](goos/paper/figures/dependencies_downstream.pdf){ width=50% } ![](goos/paper/figures/dependencies_upstream.pdf){ width=50% }

## Measuring collalboration and dependencies
\begin{figure}
    \begin{subfigure}{0.5\textwidth}
        \centering
        \begin{tikzpicture}[scale=0.9]
            % Nodes and arrows for the first figure
            \node[circle, draw] (A) at (0,2) {A};
            \node[circle, draw] (B) at (4,2) {B};
            \node[circle, draw] (C) at (4,0) {C};
            \node[rectangle, draw, minimum width=2cm, minimum height=1cm] (repo) at (0,0) {Repo}; % Adjust the width and height as needed

            \draw[->] (A) -- (repo);
            \draw[->] (B) -- (repo);
            \draw[->] (C) -- (repo);
        \end{tikzpicture}
        \caption{Developers committing to a repository.}
    \end{subfigure}%
    \begin{subfigure}{0.5\textwidth}
        \centering
        \begin{tikzpicture}
            % Nodes and lines for the first figure
            \node[draw, circle, minimum size=1cm] (A) at (0,1.5) {A};
            \node[draw, circle, minimum size=1cm] (B) at (0,0) {B};
            \node[draw, rectangle, minimum width=1.5cm, minimum height=1cm] (Repo1) at (0,-1.5) {Repo 1};

            \node[draw, circle, minimum size=1cm] (C) at (3,1.5) {C};
            \node[draw, circle, minimum size=1cm] (D) at (3,0) {D};
            \node[draw, rectangle, minimum width=1.5cm, minimum height=1cm] (Repo2) at (3,-1.5) {Repo 2};

            \draw[solid] (1.5,-1.5) -- (1.5,2.5);
            \draw[->] (Repo1.east) -- (Repo2.west);
        \end{tikzpicture}
        \caption{Dependency of repository 1 on repository 2 with the respective developers.}
    \end{subfigure}%
\end{figure}


## Strong localization of collaboration patterns
![](goos/paper/figures/gravity_collaboration.png)

## No localization of dependencies
![](goos/paper/figures/gravity_dependencies2.png)

## Additional results
Organizations help overcome distance. Almost no distance penalty for developers within the same GitHub organization.

Spatially diverse teams are more productive.


# Bugs \emoji{lady-beetle}

## Model

Long-standing question in economics: how does competition affect innovation?

Model the special features of the OSS market.

## Market for software quality
::: columns

:::: column
- Two-sided market with $U$ users and $D$ developers. Each user meets $n$ developers at random.
- Users have a use case $X$.
- Developers write code and tests. Software quality is random $Z$.
- Software only works if $Z > X$.

::::

:::: column
\begin{tikzpicture}[scale=4]
    % Draw axes
    \draw[->] (0,0) -- (1.2,0) node[right] {$Z$};
    \draw[->] (0,0) -- (0,1.2) node[above] {$X$};
    
    % Draw boundaries at 1
    \draw (1,0) -- (1,1);
    \draw (0,1) -- (1,1);
    
    % Draw interval [\underline{z}, \bar{z}]
    \fill[gray!50] (0.3,0) rectangle (0.7,1);
    \draw (0.3,0) -- (0.3,1);
    \draw (0.7,0) -- (0.7,1);
    
    % Label \underline{z} and \bar{z}
    \draw (0.3,0) node[below] {$\underline{z}$};
    \draw (0.7,0) node[below] {$\bar{z}$};
    
    % Draw 45-degree dotted line
    \draw[dotted] (0,0) -- (1,1);
    
    % Draw use case X = x_0
    \draw[red, thick] (0,0.5) -- (0.5,0.5); % Left of the 45-degree line
    \draw[red, ultra thick] (0.5,0.5) -- (1,0.5) node[right] {$X = x_0$}; % Right of the 45-degree line (thicker)
\end{tikzpicture}
::::

:::


## Competition
Developers compete for users in quality. No price competition.

User selects the best of $n$ software packages. (Platforms $\to$ higher $n$.)

### How does quality depend on market structure?
$U$, $D$, and $n$.

## Predictions
Standalone projects are limited by developer's own need.

Skilled developers can leverage their quality in projects shared on platforms $\to$ contribute more.

Platform projects are tested more than standalone projects.

## Larger projects are written by more people
![Larger projects by more people](figures/n_contributors_by_commits.png)

## Larger projects are more popular
![Larger projects are more popular](figures/n_stars_by_commits.png)

## Larger projects have more bug discovery
![Larger projects have more bug discovery](figures/n_issues_by_commits.png)

## Larger projects solve a larger share of issues
![Larger projects solve a larger share of issues](figures/share_closed_by_commits.png)

## Better developers contribute more to shared projects
![Better developers contribute more to shared projects](figures/avg_n_commits_by_quality.png)

## Shared projects are better quality
![Shared projects are better quality](figures/avg_share_closed_by_quality.png)

## Next steps
Measure test coverage.

Interaction with users: bug reports, feature requests.

Sorting into collaboration.

## Get in touch
@korenmiklos

@gaborbekes

@julianhinz