use "`1'", clear
collapse (sum) N = ceo, by(manager_category year)
keep if year >= 1990

reshape wide N, i(year) j(manager_category)

scalar N0_cum = 0
forval i=1/4 {
	local j = `i' - 1
	generate N`i'_cum = N`j'_cum + N`i'
}

label variable N1_cum "Founder"
label variable N2_cum "Insider"
label variable N3_cum "Local outsider"
label variable N4_cum "Expat outsider"

tw (area N4_cum N3_cum N2_cum N1_cum year, sort), ///
	scheme(s2mono) graphregion(color(white)) ///
	legend(position(3) cols(1) region(style(none)) stack rowgap(6)) ///
	ytitle(Number of managers) xtitle("")
	
graph export "`2'", replace
