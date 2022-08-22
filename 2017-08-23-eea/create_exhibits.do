clear all
use output/welfare_loss_by_requestor, clear

gen percentage_loss = (1-welfare)*100
label var percentage_loss "Welfare loss (as percentage of spending)"
hist percentage_loss  [fw=wins], scheme(s2color)
graph export output/welfare_loss.png, width(800) replace

use output/welfare_loss, clear
drop _*

mvencode ln_welfare_loss_per_contract, mv(0)
collapse (sum) wins value (mean) ln_welfare_loss_per_contract, by(bidder)
