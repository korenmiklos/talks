clear all

use temp/outcome_variables
foreach X in requestor bidder {
	merge m:1 `X' using temp/`X'_predictors
	drop if _m==2
	drop _m
}

drop __*

* Controls: location
gen distance = sqrt((bidder_xcoorkm-requestor_xcoorkm)^2 + (bidder_ycoorkm-requestor_ycoorkm)^2)
gen byte req_bp = (requestor_xcoorkm==0 & requestor_ycoorkm==0)
gen byte bid_bp = (bidder_xcoorkm==0 & bidder_ycoorkm==0)
drop *coorkm
gen both_bp = req_bp*bid_bp

gen distance_10km = int(distance/10)*10
recode distance_10km 200/max = 200

* politics 
gen right=0
replace right=1 if bidder_color=="right"&is_hand_checked==1
gen left=0
replace left=1 if bidder_color=="left"&is_hand_checked==1
gen fo3 = bidder_fo3

