STATA = stata-mp -b do
output/welfare_loss.dta: predictive_regression.do construct_variables.do temp/outcome_variables.dta temp/buyer_id_predictors.dta temp/bidder_predictors.dta
	$(STATA) predictive_regression
temp/bidder_predictors.dta temp/buyer_id_predictors.dta: create_predictors.do input/procurement_wins.dta recode_pir.do
	$(STATA) create_predictors
temp/outcome_variables.dta: input/procurement_wins.dta create_buyer_seller_matrix.do recode_pir.do
	$(STATA) create_buyer_seller_matrix
input/procurement_wins.dta: ../../data/procurement/derived/procurement_wins_data.dta
	cp $< $@