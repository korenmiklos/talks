if `"$root"' == "" {
    global root "`c(pwd)'"
}

global raw      "$root/data/raw"
global derived  "$root/data/derived"
global output   "$root/output"
global programs "$root/programs"

global vendor  "ted"
global year    "2023"
global can_url "https://data.europa.eu/api/hub/store/data/ted-contract-award-notices-2023.zip"
global raw_dir "$raw/$vendor"
global can_zip "$raw_dir/ted-contract-award-notices-2023.zip"
global can_csv "$raw_dir/export_CAN_2023.csv"
global can_dta "$derived/ted_can_2023.dta"
global can_selected "$derived/ted_can_2023_analysis.dta"
global fact_country_pair_cpv "$derived/fact_country_pair_cpv.dta"
global table_home_bias "$output/table_home_bias.tex"
global figure_value_lots "$output/scatter_value_lots.png"
