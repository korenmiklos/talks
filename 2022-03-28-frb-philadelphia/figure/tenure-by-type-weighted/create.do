use "`1'", clear


egen first_exit_as_ceo = min(cond(ceo==1 & exit==1,year,.)), by(frame_id_numeric person_id)

generate tenure = first_exit_as_ceo - first_year_as_ceo + 1 if first_exit_as_ceo < 2018

label variable tenure "Length of first spell at firm (year)"

histogram tenure , disc by(manager_category ) ///
	scheme(s2mono) graphregion(color(white)) ///
	
graph export "`2'", replace
