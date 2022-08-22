clear all
tempfile data

save `data', replace emptyok

foreach classification in sitc hs {
	import delimited "data/china-`classification'.csv", case(preserve) encoding(utf-8) clear
	append using `data'
	save `data', replace
}

* make sure Germany switches 
tab Year ReporterCode 

collapse (sum) Value, by(Year PartnerCode)
ren Value import_
reshape wide import_, i(Year) j(PartnerCode)

gen china_share = import_156/import_0*100
label var china_share "Share of China in import value (%)"

tw (line china_share Year, sort), scheme(white) aspect(0.45) ///
	note("Share of PR China in the import value of Germany, UK, France and Italy." ///
	"Source: UN Comtrade.")
graph export exhibits/china-share.png, width(1200) replace 
