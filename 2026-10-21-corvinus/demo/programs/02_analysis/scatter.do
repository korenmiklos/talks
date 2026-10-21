do "programs/config.do"

use "$fact_country_pair_cpv", clear

generate ln_value = ln(total_value_eur)
generate ln_contract = ln(n_lots)
generate byte same_country = (buyer_country == seller_country)

set seed 12345

twoway ///
    (scatter ln_value ln_contract if same_country == 1, mcolor(navy%25) msymbol(circle) jitter(3)) ///
    (scatter ln_value ln_contract if same_country == 0, mcolor(cranberry%25) msymbol(circle) jitter(3)) ///
    (lfit ln_value ln_contract), ///
    legend(order(1 "Same country" 2 "Different country" 3 "Linear fit") position(6) rows(1)) ///
    xtitle("Log number of lots") ytitle("Log total value (EUR)")

graph export "$figure_value_lots", replace width(1600)
