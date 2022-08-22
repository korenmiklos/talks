tempfile data join_frame

* We consider only the top bidders and requestors 
local max_bidder = 1000
local max_requestor = 500
local weight value

use input/procurement_wins.dta, clear

* replace PR123456 with 99123456
do recode_pir

* We will use C,F,M 1-digit TEAOR

* only keep dyadic variables and save others for future merging
local buyer_id requestor first_cpv_division
local bidder_controls bidder_color is_hand_checked bidder_emp_2010  bidder_teaor08_1d bidder_teaor08_2d bidder_fo3 bidder_so3 bidder_mo3 bidder_xcoorkm bidder_ycoorkm
local requestor_controls budgetary_level requestor_color requestor_emp  requestor_teaor08_1d requestor_teaor08_2d requestor_fo3 requestor_so3 requestor_mo3 requestor_xcoorkm requestor_ycoorkm
local dyadic_variables wins value_bestguess


keep if wins==1
drop if missing(requestor)
* (25,890 observations deleted)
drop if missing(bidder)
* (38,175 observations deleted)
drop if bidder_so3==1
drop if missing(bidder_xcoorkm) | missing(bidder_ycoorkm) | missing(requestor_xcoorkm) | missing(requestor_ycoorkm)
* (10,672 observations deleted)
drop if value_bestguess==.|value_bestguess==0
*(14,922 observations deleted)
drop if value<=1e6

drop if missing(first_cpv_division)

collapse (sum) value wins , by(bidder requestor year)

* keep top only
foreach X in bidder requestor {
	tempvar `X'_tag `X'_sum `X'_rank
	egen ``X'_tag' = tag(`X')
	egen ``X'_sum' = sum(`weight'), by(`X') 
	egen ``X'_rank' = rank(cond(``X'_tag',-``X'_sum',.)), unique
	egen `X'_rank = max(cond(``X'_tag',``X'_rank',.)), by(`X')
}

foreach X in bidder requestor {
	keep if `X'_rank<=`max_`X''
}

drop *_rank
save `data', replace

tempfile bidder buyer year
preserve
	duplicates drop bidder, force
	keep bidder
	save `bidder'
restore
preserve
	duplicates drop requestor , force
	keep requestor 
	save `buyer'
restore
preserve
	duplicates drop year , force
	keep year 
	save `year'
restore

use `bidder', clear
cross using `buyer'
cross using `year'

merge 1:1 bidder requestor year using `data'
drop _m

mvencode value wins, mv(0) override

save temp/outcome_variables, replace
