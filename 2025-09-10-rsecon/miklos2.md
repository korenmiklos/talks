# Case Study From Our Research Lab
## Case Study From Our Research Lab
- Used since 2017 in our research groups: CEU MicroData, MACROMANAGERS.eu 
    - internally
    - when sharing data with others
- Saved about 600+ beads, two versions on average
- Interquartile range of bead sizes: 10 to 500 MB, largest is 23 GB
- Median time between saving new versions: 51 days

## Practices We Adopted
- _Everything_ is a bead: raw data, intermediate data, analysis sample, research results
- Never load data directly, from outside a bead
    - Side product: always use relative paths
- We don't often recompute everything, but good to know we _could_

## Lessons For Research Software Engineers

- Minimal learning curve for researchers
- No infrastructure requirements
- Works with existing workflows
- Complements version control
- Enables true reproducibility

## Key Takeaways

1. **Data provenance is hard** - especially with changing teams
2. **Existing tools too complex** - for heterogeneous research teams  
3. **bead keeps it simple** - focuses on one thing well
4. **Reproducibility becomes automatic** - not an afterthought

### Contact and Acknowledgements
- Web: [bead.zip](https://bead.zip)
- Installation: [https://bead.zip/install](https://bead.zip/install)
- GitHub: [github.com/e3krisztian/bead](https://github.com/e3krisztian/bead)


![](images/erc-logo.png){ width=20% }

This project has received funding from the European Research Council (ERC) under the European Union's Horizon 2020 research and innovation programme (grant agreement No 313164). The views expressed are those of the authors and do not necessarily reflect those of the ERC or the European Commission.

## References

- **World Development Indicators**: [data.worldbank.org/indicator](https://data.worldbank.org/indicator)
- **DVC (Data Version Control)**: [dvc.org](https://dvc.org)
- **Apache Airflow**: [airflow.apache.org](https://airflow.apache.org)
- **dbt**: [getdbt.com](https://www.getdbt.com)
- **KNIME**: [knime.com](https://knime.com)