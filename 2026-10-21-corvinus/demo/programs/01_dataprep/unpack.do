do "programs/config.do"

capture confirm file "$can_csv"
if _rc != 0 {
    * Stata's unzipfile extracts to the current working directory, so move the extracted CSV into data/raw/ted/
    unzipfile "$can_zip", replace
    copy "export_CAN_2023.csv" "$can_csv", replace
    erase "export_CAN_2023.csv"
}

* CPV is a zero-padded 8-digit code, so import it as string to keep the leading zeros
import delimited using "$can_csv", varnames(1) encoding("UTF-8") stringcols(32) clear
compress
save "$can_dta", replace
