clear all

use input/procurement_wins.dta, clear

do recode_pir

* only keep dyadic variables and save others for future merging
local buyer_id requestor first_cpv_division
local bidder_controls bidder_fo3 bidder_color is_hand_checked bidder_emp_2010  bidder_teaor08_1d bidder_teaor08_2d bidder_fo3 bidder_so3 bidder_mo3 bidder_xcoorkm bidder_ycoorkm
local buyer_id_controls requestor first_cpv_division budgetary_level requestor_color requestor_emp  requestor_teaor08_1d requestor_teaor08_2d requestor_fo3 requestor_so3 requestor_mo3 requestor_xcoorkm requestor_ycoorkm
local dyadic_variables wins value_bestguess

* Create variable for 2010 employment level of bidders
egen bidder_emp_2010 = max(cond(year==2010,bidder_emp,.)), by(bidder)

foreach X in bidder buyer_id {
	preserve
	collapse (sum) `dyadic_variables' (last) ``X'_controls', by(`X')
	save temp/`X'_predictors, replace
	restore
}


