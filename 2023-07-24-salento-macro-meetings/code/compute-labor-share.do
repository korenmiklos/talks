use "input/labor-share/merleg.dta", clear

generate value_added = max(0, personnel_expenditure) + max(0, depreciation) + max(0, operating_surplus)
*generate value_added = max(0, max(0, sales) - max(0, materials))
generate LS = min(1, max(0, personnel_expenditure / value_added))
drop if LS == 0

foreach X in value_added LS {
    generate ln_`X' = ln(`X')
}

table year [aw = value_added], statistic(mean LS)
keep if year == 2000
merge 1:1 originalid using "output/beta.dta", keep(match) nogen

egen size_portfolio = cut(value_added), group(5)

table beta_portfolio [aw = value_added], statistic(mean LS)
table size_portfolio [aw = value_added], statistic(mean LS)
table beta_portfolio size_portfolio [aw = value_added], statistic(mean LS)

table beta_portfolio [aw = value_added] if fo3 == 0, statistic(mean LS)
table beta_portfolio [aw = value_added] if fo3 == 1, statistic(mean LS)
