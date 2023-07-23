use "input/labor-share/merleg.dta", clear

generate ln_sales = ln(sales)
xtset originalid year

generate growth = ln_sales - L2.ln_sales
egen aggregate_growth = mean(growth), by(year)

keep if !missing(growth, aggregate_growth)

egen mu1 = mean(growth), by(originalid)
egen mu2 = mean(aggregate_growth), by(originalid)

tempvar XX XY
egen `XY' = mean((aggregate_growth - mu2) * (growth - mu1)), by(originalid)
egen `XX' = mean((aggregate_growth - mu2)^2), by(originalid)
generate beta = `XY' / `XX'

egen beta_portfolio = cut(beta), group(5)
egen mean_beta = mean(beta), by(beta_portfolio)

collapse (firstnm) beta_portfolio mean_beta, by(originalid)

save "output/beta.dta", replace