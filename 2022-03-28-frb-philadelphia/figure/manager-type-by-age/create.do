use "`1'", clear

generate byte firm_age = year - first_year_of_firm 

* keep only one CEO per firm, the least senior
collapse (max) manager_category, by(frame_id_numeric firm_age)

generate byte ceo = 1
collapse (sum) N = ceo, by(manager_category firm_age)
keep if firm_age <= 20


reshape wide N, i(firm_age) j(manager_category)
* insiders are not yet there in year 0
replace N2 = 0 if firm_age == 0
egen N = rowtotal(N?)

scalar N0_cum = 0
forval i=1/4 {
	local j = `i' - 1
	generate N`i'_cum = N`j'_cum + N`i'/N * 100
}

label variable N1_cum "Founder"
label variable N2_cum "Insider"
label variable N3_cum "Local outsider"
label variable N4_cum "Expat outsider"

label variable firm_age "Age of firm (year)"
tw (area N4_cum N3_cum N2_cum N1_cum firm_age, sort), ///
	scheme(s2mono) graphregion(color(white)) ///
	legend(position(3) cols(1) region(style(none)) stack rowgap(6)) ///
	ytitle(Share of firms (percent)) ///
	xlabel(0 2 4 6 8 10 12 14 16 18 20) ///
	ylabel(0 20 40 60 80 100)
	
graph export "`2'", replace
