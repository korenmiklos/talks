do "programs/config.do"

use "$fact_country_pair_cpv", clear

generate byte same_country = (buyer_country == seller_country)
generate ln_value = ln(total_value_eur)
generate ln_contract = ln(n_lots)
generate ln_sellers = ln(n_sellers)

label variable same_country "Same country"

reghdfe ln_value same_country, absorb(buyer_country seller_country)
estimates store value

reghdfe ln_contract same_country, absorb(buyer_country seller_country)
estimates store contract

reghdfe ln_sellers same_country, absorb(buyer_country seller_country)
estimates store sellers

esttab value contract sellers using "$table_home_bias", replace ///
    b(3) se(3) star(* 0.10 ** 0.05 *** 0.01) ///
    mtitles("ln value" "ln lots" "ln sellers") ///
    stats(N r2_a, fmt(0 3) labels("Observations" "Adjusted R-squared")) ///
    title("Home bias in public procurement awards") ///
    label
