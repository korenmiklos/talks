URL := https://data.europa.eu/api/hub/store/data/ted-contract-award-notices-2023.zip

README.html: README.md assets/style.css
	pandoc $< -t revealjs -s -o $@ --css=assets/style.css
data/ted-contract-award-notices-2023.csv:
	unzip -p ~/Downloads/ted-contract-award-notices-2023.zip > $@
~/Downloads/ted-contract-award-notices-2023.zip:
	curl -Lo $@ $(URL)