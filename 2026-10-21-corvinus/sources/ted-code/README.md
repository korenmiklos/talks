# README

## Overview

This replication package accompanies a research project on public procurement in
the European Union. All results are built from a single data source: the 2023
vintage of the Tenders Electronic Daily (TED) CSV subset, contract award notices
(CAN). The code in this package reads the raw TED CAN export, applies the
cleaning and harmonisation steps that turn notice-level text fields into an
analysis file, and generates the tables and figures of the paper.

The package is written in Stata. One master do-file runs the whole pipeline; a
replicator should expect the data preparation step to run in minutes on a
standard desktop machine.

This README is a living document. It documents the data provenance, licensing,
computational requirements, the dimensional model, and the programs and exhibits.
It will be extended as the paper and its exhibits grow.

## Data Availability and Provenance Statements

### Statement about Rights

- [x] I certify that the author(s) of the manuscript have legitimate access to and permission to use the data used in this manuscript.
- [x] I certify that the author(s) of the manuscript have documented permission to redistribute/publish the data contained within this replication package. Appropriate permissions are documented in the [LICENSE.txt](LICENSE.txt) file.

### License for Data

The 2023 TED CSV contract award notices are published by the European Commission
under the European Commission reuse notice (Commission Decision 2011/833/EU on
the reuse of Commission documents), which permits reuse and redistribution,
including for commercial purposes, provided the source is acknowledged. The TED
CSV vintages for 2020 to 2022 are additionally published under a Creative
Commons Attribution 4.0 International (CC BY 4.0) license. In either case the
license is set by the data provider, not by the authors of this package; it is
"sticky". Redistribution is therefore permitted only with attribution to TED.
See [LICENSE.txt](LICENSE.txt) for the full text and the required attribution
statement.

### Summary of Availability

- [x] All data **are** publicly available.
- [ ] Some data **cannot be made** publicly available.
- [ ] **No data can be made** publicly available.

### Details on each Data Source

**Tenders Electronic Daily (TED) CSV subset -- Contract award notices, 2023**

- Provenance: TED is the online version of the Supplement to the Official
  Journal of the European Union, maintained by the Publications Office of the
  European Union. The CSV subset is published by the Directorate-General for
  Internal Market, Industry, Entrepreneurship and SMEs (DG GROW) of the European
  Commission. It contains selected fields from the public procurement standard
  forms: the most important fields from contract notices and contract award
  notices, such as who bought what from whom, for how much, and which procedure
  and award criteria were used. The underlying notices are self-reported by
  contracting authorities, so the data are published "as is" and are not verified
  by the Commission.
- Coverage: the full CSV subset spans 2006-01-01 to 2023-12-31 and originates
  from contracting authorities in the European Economic Area, Switzerland, North
  Macedonia, and EU institutions. This project uses the contract award notices
  for the calendar year 2023 only. Notices from the European Investment Bank and
  the European Bank for Reconstruction and Development are excluded from the
  export. In general the data cover procurement above the EU thresholds, but a
  non-negligible number of below-threshold notices is present as well.
- Unit of observation: one row per award. An award is a seller winning one or
  more lots; a single lot can be awarded to more than one seller, and a single
  award can cover several lots (those lots are listed in `ID_LOT_AWARDED`). The
  file also contains a row for lots that received no award, where the award and
  seller fields are empty. Notice-level fields repeat across all rows of a
  notice. The identifying fields are `ID_NOTICE_CAN`, `ID_LOT`, and `ID_AWARD`;
  counts and sums must be computed at the level at which a field is defined.
- Citation: TED csv dataset (2006-2023), Tenders Electronic Daily, supplement to
  the Official Journal of the European Union. DG Internal Market, Industry,
  Entrepreneurship, and SMEs, European Commission, Brussels. Available at
  https://data.europa.eu/data/datasets/ted-csv?locale=en. Version 3.5.
- Access: freely downloadable, no registration. From the dataset landing page
  https://data.europa.eu/data/datasets/ted-csv?locale=en, open the
  "Distributions" list and select **"TED - Contract award notices 2023"**
  (a ZIP archive), or download the archive directly from
  https://data.europa.eu/api/hub/store/data/ted-contract-award-notices-2023.zip.
  Save the archive to `data/raw/ted/`.
- Data dictionary: the official codebook is the *TED CSV open data -- Notes &
  Codebook*, version 3.5 (2022-11-17), by DG GROW, available at
  https://data.europa.eu/data-management/store/api/legacy/data/ted-csv-data-information-v3-5.pdf.
  The codebook documents every variable in the export, including its level
  (notice, lot, or award) and how `VALUE_EURO_FIN_1` and `DURATION` are
  constructed. The undecoded column names are also present in the header of each
  CSV file.
- Schema assumptions (from inspecting the 2023 file):
  - One row is one award, plus a row for lots with no award. Notice-level fields
    repeat across the rows of a notice, so any count or sum must be computed at
    the level at which the field is defined.
  - `ISO_COUNTRY_CODE` is the buyer's country (ISO 3166-1 alpha-2) and
    `WIN_COUNTRY_CODE` is the seller's country. The buyer country is never
    missing; the seller country is missing for some awards.
  - Some awards go to a group of sellers from different countries, and
    `WIN_COUNTRY_CODE` then lists several codes joined by `---` (for example
    `BE---AT---SI---FI`). These are assigned to the country of the first
    mentioned seller (`BE`).
  - `CPV` is the lot's main CPV code, a zero-padded eight-digit code, so it is
    read as a string to keep the leading zeros.
  - `AWARD_VALUE_EURO_FIN_1` is the final value of the award in euros and is the
    contract-value measure used here. The `VALUE_EURO*` fields are the
    notice-level contract total and repeat across the rows of a notice.
- License / redistribution restrictions: European Commission reuse notice
  (Commission Decision 2011/833/EU); attribution required. The 2020-2022 vintages
  are also published under CC BY 4.0. Redistribution of the raw archive in this
  package is therefore permitted with attribution, which is provided in
  [LICENSE.txt](LICENSE.txt).
- Vintage caveat for 2023: the contract award notices for 2023 were documented by
  the provider as *not* including notices published in the new eForms format.
  Procuring authorities were required to submit notices as eForms from
  2023-10-25 (eForms had been optional since November 2022), and a revised 2023
  file including eForms was scheduled for release after the second quarter of
  2024. Replicators should record the download date of their archive and confirm
  whether the file they obtained includes eForms notices, because a 2023 file
  downloaded after the republication can differ from the file used here.
- Datafile: `data/raw/ted/ted-contract-award-notices-2023.zip` -- Not
  redistributed here; downloaded by `programs/01_dataprep/download.do`.

## Dataset List

| Data file | Source | Notes | Provided |
| --- | --- | --- | --- |
| `data/raw/ted/ted-contract-award-notices-2023.zip` | TED CSV subset (DG GROW) | Raw contract award notices for 2023 (106 MB zip). Redistributable under the EC reuse notice. | No |
| `data/raw/ted/export_CAN_2023.csv` | TED CSV subset (DG GROW) | The CSV uncompressed from the archive by `01_dataprep` (680 MB, 1,098,451 observations, 75 variables). | No |
| `data/derived/ted_can_2023.dta` | All listed | Cleaned and compressed analysis file (1,098,451 observations, 75 variables); source for the fact table that feeds the exhibits. | No |
| `data/derived/ted_can_2023_analysis.dta` | All listed | Convenience extract of the four core variables, renamed: `buyer_country`, `seller_country`, `cpv_code`, `contract_value_eur` (1,098,451 observations, 4 variables). Not read by the current exhibits, which use the fact table. | No |
| `data/derived/fact_country_pair_cpv.dta` | All listed | Fact table at the buyer-country x seller-country x two-digit-CPV grain: `n_lots`, `n_sellers`, `total_value_eur` (5,209 observations, 6 variables). | No |

Note: the datasets are not redistributed in this repository. The raw archive is
stored under `data/raw/ted/` as downloaded and is never edited; all processing
happens in code and produces the files under `data/derived/`.

## Dimensional Model

The analysis follows Kimball's four-step dimensional design process.

1. **Business question.** Is there home bias in the award of public procurement
   contracts -- do buyers award a larger share of contracts, and of value, to
   sellers from their own country?
2. **Grain.** One row per buyer country, seller country, and two-digit CPV code.
3. **Dimensions.** Buyer country, seller country, and two-digit CPV code.
4. **Facts.** Total value won (euros), number of distinct sellers, and number of
   lots won.

The aggregator `programs/02_analysis/aggregate.do` builds the fact table
`data/derived/fact_country_pair_cpv.dta` at this grain from the cleaned file
`data/derived/ted_can_2023.dta`. Only awarded lots (those with a seller) enter the
table. A lot is identified by the pair (`ID_NOTICE_CAN`, `ID_LOT`), with an empty
`ID_LOT` treated as the notice's single lot; a seller is identified by
`WIN_NAME`. Both are proxies: `ID_LOT` does not list the extra lots of an award
that covers several lots (`ID_LOT_AWARDED`), and `WIN_NAME` is the only seller
identifier filled for most awards.

## Computational Requirements

### Software Requirements

- Stata (code was last run with version 18).

  - Stata packages installed via `programs/00_setup.do`:
    - `ftools` (version 2.50.0, 2026-01-09)
    - `reghdfe` (version 6.13.1, 2026-01-10)
    - `ppmlhdfe` (version 2.3.3, 2025-11-02)
    - `estout` / `esttab` (version 3.33, 2026-03-23)
  - All package dependencies are installed automatically by running
    `programs/00_setup.do` once on a new system.

- No additional compilers, system libraries, or non-default tools are required.
  Reading the raw CSV needs only a standard Stata installation with Unicode
  (UTF-8) support; the raw files are UTF-8 encoded.

### Controlled Randomness

- [ ] No pseudo random generator is used in the analysis described here.
- [x] The only randomness is the jitter applied in Figure 1. The seed is set by
  `set seed 12345` in `programs/02_analysis/scatter.do` (line 9).

### Memory, Runtime, Storage Requirements

#### Summary

Approximate time needed to reproduce the analyses on a standard 2026 desktop
machine:

- [x] < 10 minutes (data preparation and analysis)
- [ ] 10-60 minutes

Approximate storage space needed:

- [ ] < 25 MB
- [ ] 25 MB - 250 MB
- [x] 250 MB - 2 GB (raw files plus derived files)
- [ ] 2 GB - 25 GB
- [ ] > 250 GB

#### Details

Data preparation reads a single large flat CSV (the 2023 contract award notices
export) and produces the cleaned file and the four-variable extract. The analysis
stage collapses the cleaned file into the fact table and runs the exhibits on it.
This is feasible in memory on a standard desktop machine but should be run with a
64-bit Stata and at least 8 GB of RAM. Storage is dominated by the unzipped raw
CSV; the ZIP archive itself is smaller and should be retained for provenance.

## Description of Programs/Code

- `programs/00_setup.do` creates all output directories and installs the needed
  Stata packages.
- `programs/01_dataprep/` extracts the raw CSV from the archive and reformats it
  into the analysis file. The file `programs/01_dataprep/main.do` runs them all;
  `select.do` builds the four-variable extract.
- `programs/02_analysis/` generates the analysis outputs. `aggregate.do` builds
  the country-pair/CPV fact table, `regress.do` produces the home-bias regression
  table, and `scatter.do` produces the value-versus-lots scatterplot. The file
  `programs/02_analysis/main.do` runs them all.
- `programs/config.do` contains the parameters shared by all programs, including
  input and output paths.

### License for Code

The code is licensed under the MIT license. See [LICENSE.txt](LICENSE.txt) for
details. The license for the data is separate and is set by the data provider;
see the data license statement above.

## Instructions to Replicators

1. Edit `programs/config.do` to adjust the default project path.
2. Run `programs/00_setup.do` once on a new system to create the directory
   structure and install the required Stata packages.
3. Download the data archive as described under "Details on each Data Source"
   above and save it to `data/raw/` in the form in which it is downloaded. Do not
   unpack it by hand; `01_dataprep` unpacks the archive into `data/raw/`.
4. Run `programs/01_dataprep/main.do` to build the analysis files from the raw
   data.
5. Run `programs/02_analysis/main.do` to produce all tables and figures.

### Details

- `programs/00_setup.do`: creates all output directories and installs the needed
  ado packages.
- `programs/01_dataprep/main.do`: builds `data/derived/ted_can_2023.dta` and the
  four-variable extract `data/derived/ted_can_2023_analysis.dta` from the raw
  2023 contract award notices. Runs in minutes.
- `programs/02_analysis/main.do`: builds the fact table and runs the exhibits.
  Order is important when running programs individually.

## List of Tables and Programs

The first exhibits are listed below. As more are added, each will be listed here
with the exact program that produces it, the line number where it is created if
the program produces more than one exhibit, and the exact output filename. Any
figure that has no underlying data will be listed explicitly as "n.a. (no data)".

| Figure/Table # | Program | Line Number | Output file | Note |
| --- | --- | --- | --- | --- |
| Table 1 | `programs/02_analysis/regress.do` | n.a. | `output/table_home_bias.tex` | Home-bias regressions of log value, log lots, and log sellers on a same-country indicator, absorbing buyer- and seller-country fixed effects. Cells with zero value drop from the log-value column. |
| Figure 1 | `programs/02_analysis/scatter.do` | n.a. | `output/scatter_value_lots.png` | Scatter of log total value against log number of lots across country-pair/CPV cells. |

## References

TED csv dataset (2006-2023). Tenders Electronic Daily, supplement to the Official
Journal of the European Union. DG Internal Market, Industry, Entrepreneurship,
and SMEs, European Commission, Brussels. Available at
https://data.europa.eu/data/datasets/ted-csv?locale=en. Version 3.5. Accessed
2026-10-07.

Directorate-General for Internal Market, Industry, Entrepreneurship and SMEs
(DG GROW), European Commission. 2022. *TED CSV open data -- Notes & Codebook*,
version 3.5, 2022-11-17.
https://data.europa.eu/data-management/store/api/legacy/data/ted-csv-data-information-v3-5.pdf.

European Commission. 2011. Commission Decision 2011/833/EU of 12 December 2011 on
the reuse of Commission documents. *Official Journal of the European Union*
L 330/39. http://data.europa.eu/eli/dec/2011/833/oj.

## Acknowledgements

The structure of this README follows the template of the Social Science Data
Editors, https://social-science-data-editors.github.io/template_README/, which is
endorsed by several social science journals.
