do "programs/config.do"

use "$can_dta", clear
keep iso_country_code win_country_code cpv award_value_euro_fin_1
replace win_country_code = substr(win_country_code, 1, 2) if strpos(win_country_code, "---") > 0
rename iso_country_code buyer_country
rename win_country_code seller_country
rename cpv cpv_code
rename award_value_euro_fin_1 contract_value_eur
save "$can_selected", replace
