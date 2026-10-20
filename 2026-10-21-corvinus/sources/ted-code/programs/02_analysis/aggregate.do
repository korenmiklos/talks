do "programs/config.do"

use "$can_dta", clear

* Rows without a seller country are lots that were not awarded
keep if win_country_code != ""

generate cpv2 = substr(cpv, 1, 2)

* Awards to a group of sellers list several countries joined by "---"; keep the first
replace win_country_code = substr(win_country_code, 1, 2) if strpos(win_country_code, "---") > 0

* A notice without lot divisions has an empty ID_LOT; give it a value so it counts as one lot
replace id_lot = "NOLOT" if id_lot == ""
egen lot_id = group(id_notice_can id_lot)
egen seller_key = group(win_name)

rename iso_country_code buyer_country
rename win_country_code seller_country

egen tag_seller = tag(buyer_country seller_country cpv2 seller_key)
egen tag_lot = tag(buyer_country seller_country cpv2 lot_id)

collapse (sum) n_lots=tag_lot n_sellers=tag_seller total_value_eur=award_value_euro_fin_1, by(buyer_country seller_country cpv2)

order buyer_country seller_country cpv2 n_lots n_sellers total_value_eur
save "$fact_country_pair_cpv", replace
