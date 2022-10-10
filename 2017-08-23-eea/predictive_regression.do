capture log close
log using output/regression.log, text replace
do construct_variables

scalar sigma = 5
scalar mu = 1/(sigma-1)
local political_variables left right fo3 

egen sector = group(bidder_teaor08_1d)
su sector
local N_sectors = r(max)

gen lambda = .
gen lambda_star = .
foreach X in `political_variables' {
	gen lambda_tilde_`X' = .
}

egen sector_tenders = sum(wins), by(sector)

forval j=1/`N_sectors' {
	su wins if sector==`j'
	* only estimate if their are at least some tenders in sector 
	if (r(N)*r(mean)>=100) {
		tempvar lambda lambda_star
		foreach X in `political_variables' {
			tempvar lambda_tilde_`X'
		}

		* no political variables
		poisson wins *_bp i.distance_10km ln_* if sector==`j' 
		predict `lambda_star', n
		
		* with political variables
		poisson wins left right fo3 *_bp i.distance_10km ln_* if sector==`j' 
		predict `lambda', n
		* gap
		foreach X in `political_variables' {
			gen `lambda_tilde_`X'' = `lambda'/exp(_b[`X']*`X')
		}
		
		foreach X of var lambda* {
			replace `X' = ``X'' if sector==`j'
		}
	}
}

local decision_maker requestor first_cpv_division

foreach X of var lambda* {
	egen sum_`X' = sum(`X'), by(`decision_maker')
	gen P_`X' = (`X'/sum_`X')
}


egen sum_n_j = sum(wins), by(`decision_maker')
gen Pij = wins/sum_n_j

BRK

gen ln_welfare_loss = mu*Pij*(ln(P_lambda_star)-ln(Pij))
gen ln_welfare_loss_per_contract = ln_welfare_loss/wins

foreach X in `political_variables' {
	gen ln_welfare_loss_`X' = mu*P_lambda*(ln(P_lambda_tilde_`X')-ln(P_lambda))
}
mvencode ln_weflare_loss*, mv(0) override


keep if Pij>0

save output/welfare_loss, replace

collapse (sum) wins value ln_welfare_loss, by(`decision_maker')
gen welfare = exp(ln_welfare_loss)

su welfare if wins>=50, d
su welfare [aw=wins]
su welfare [aw=value]

save output/welfare_loss_by_requestor, replace

log close
