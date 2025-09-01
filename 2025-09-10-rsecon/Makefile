.PHONY: all clean

IMAGES := $(wildcard images/*.png)

all: 39-bead.html README.pdf

39-bead.html: 39-bead.qmd miklos1.md krisztian.qmd miklos2.md terminal.html $(IMAGES)
	quarto render 39-bead.qmd

README.pdf: README.md preamble-slides.tex
	pandoc README.md -t beamer --pdf-engine=lualatex --slide-level 2 -H preamble-slides.tex -o README.pdf

README.md: 39-bead.qmd
	quarto render 39-bead.qmd --to markdown --output README.md

clean:
	rm -f README.tex README.aux README.log README.nav README.out README.snm README.toc README.vrb
	rm -f 39-bead.html
	rm -rf 39-bead_files/
