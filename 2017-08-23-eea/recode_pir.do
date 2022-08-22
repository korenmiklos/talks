destring bidder, force replace
ren requestor old_code
gen long requestor = cond(substr(old_code,1,2)=="PR",99*1e6+real(substr(old_code,3,6)),real(old_code))

* Classify Közgép into construction industry
replace bidder_teaor08_2d = 45 if bidder==10950676
replace bidder_teaor08_1d = "F" if bidder==10950676

* We will use C,F,M 1-digit TEAOR
keep if inlist(bidder_teaor08_1d,"C","F","M")

* in case of multiple CPVs listed, take first one
* 2-digit division roughly corresponds to 2-digit industries
gen first_cpv_division = real(substr(cpv,1,2))
tab first_cpv_division

egen buyer_id = group(requestor first_cpv_division)

