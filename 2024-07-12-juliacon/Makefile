URL := https://data.europa.eu/api/hub/store/data/ted-contract-award-notices-2023.zip
ASSETS := $(wildcard assets/*)
FIGURES := $(wildcard figures/*)

README.html: README.md $(ASSETS) $(FIGURES)
	pandoc $< -t revealjs -s -o $@ --css=assets/style.css
data/ted-contract-award-notices-2023.csv:
	unzip -p ~/Downloads/ted-contract-award-notices-2023.zip > $@
~/Downloads/ted-contract-award-notices-2023.zip:
	curl -Lo $@ $(URL)