---
title: "Kezdi.jl: Bridging Stata and Julia for economists"
author: "Miklós Koren"
date: JuliaCon 2024
aspectratio: 1610
---
## Who am I?
Economist + wannabe software developer

| Language | Since |
|----------|-------|
| Stata    | 1997  |
| Python   | 2003  |
| Julia    | 2015  |

Data Editor at the *[Review of Econonmic Studies](https://www.restud.com/)*

# What do economists do?

## Evidence from ??? replication packages

## They don't use Julia

## They use multiple languages

## What is Stata?

### Best of Stata

### Statistics

# Tradeoffs in user interface

## $k$ standards $\to k+1$ standards

## I don't think if you at all

## What do users want?
1. convenience
2. correctness

## The Production Possibilities Frontier
- Rust: static typing, memory safe
- ChatGPT: convenient, may or may not be correct

### Good example: row-level `if`
```stata
replace distance = 5 if distance < 5
```

### Bad example: implicit variable abbreviation:
```stata
summarize gdp_per_capita
regress gdp population
```

# Features of Kezdi.jl

## Command syntax

## Row-level `if`

## Handling missing values

## Proper data structures

## User-defined functions

## Roadmap
### Data wrangling
### Programming convenience
### Statistics

## Acknowledgements