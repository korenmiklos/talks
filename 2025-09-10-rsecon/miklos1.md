
## The Editor Gives You One Week
You need to:

1. Address reviewer concerns about source data
2. Redo analysis with new data
3. Recreate Figure 1
4. Submit within one week

## But the Submission Was Months Ago

- Research submitted months ago
- Team has been improving data cleaning since then
    - Some team members left
- Different statistical methods now
- **First question**: How _exactly_ was Figure 1 produced?

## Research Results are Functions

$$\text{Figure 1} = \text{code}(\text{data})$$

- Results depend on both algorithms and data
- Code under version control (Git) ✓
- Tagged commit at submission ✓
- **But what about the data?**

## Data is Also a Function

$$\text{data}_1 = \text{code}_2(\text{data}_2)$$

- Data transformed by wrangling/cleaning steps
    - countries dropped
    - transformations applied
    - feature engineering details
- **Chain of data provenance**

## A Real-World Data Pipeline

![](images/Proc_LTS.png)

## The Data Provenance Problem

### Why It Is Complex:
1. **Frequent changes**: Code and data both evolve
2. **Complex pipelines**: Many steps, multiple datasets
3. **Tool heterogeneity**: Python, R, SQL, DuckDB all in one project
4. **Team dynamics**: People join, leave, change roles


## Existing Solutions

### Version Control (Git)
- Great for code
- **Not suitable for large binary data**

### Data Version Control (DVC)
[dvc.org](https://dvc.org)

- Similar spirit to bead, but delivery/versioning focused  
- **More complex than needed for provenance tracking**

### Orchestration Tools
- Apache Airflow (Python) - [airflow.apache.org](https://airflow.apache.org)
- dbt (SQL) - [getdbt.com](https://www.getdbt.com)
- KNIME (no-code) - [knime.com](https://knime.com)
- **Too complex for heterogeneous teams**

## Enter bead

**A command-line tool that captures your data’s story, step by step.**

- Much simpler than alternatives
- Language agnostic
- Supports heterogeneous teams

## What bead Does NOT Do

### Not a code runner
- You run your own code
- Python, R, Stata, SQL - doesn't matter

### Not a file delivery system
- File system stores your files
- You copy/move files yourself

### Only requirement:
- Works with flat files on file system
- Files not too big (20GB works fine)

## Core bead Concepts

### The bead
- Self-contained unit of computation
- Contains code, _reference_ to input data, results
- Packaged as ZIP file
- Remembers exact provenance

### Simple Commands
```bash
bead new my-analysis
bead input add source-data
bead save 
```

# Demo Time

