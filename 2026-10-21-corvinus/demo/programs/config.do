if `"$root"' == "" {
    global root "`c(pwd)'"
}

global raw      "$root/data/raw"
global derived  "$root/data/derived"
global output   "$root/output"
global programs "$root/programs"

global vendor  "ted"
global year    "2023"
global can_url "https://data.europa.eu/data-management/store/api/legacy/data/ted-contract-award-notices-2023.zip/"
global raw_dir "$raw/$vendor"
global can_zip "$raw_dir/ted-contract-award-notices-2023.zip"
global can_csv "$raw_dir/export_CAN_2023.csv"
