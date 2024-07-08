URL := https://data.europa.eu/api/hub/store/data/ted-contract-award-notices-2023.zip

data/ted-contract-award-notices-2023.csv:
	unzip -p ~/Downloads/ted-contract-award-notices-2023.zip > $@
~/Downloads/ted-contract-award-notices-2023.zip:
	curl -Lo $@ $(URL)