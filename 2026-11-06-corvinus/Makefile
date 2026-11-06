PANDOC ?= pandoc
PDF_ENGINE ?= pdflatex
ASSETS := $(wildcard figures/* images/*)

.PHONY: all clean

all: README.pdf

README.pdf: README.md ../preamble-slides.tex preamble.tex $(ASSETS)
	$(PANDOC) README.md --standalone -t beamer --slide-level 2 \
		--pdf-engine=$(PDF_ENGINE) -H ../preamble-slides.tex \
		-H preamble.tex -o README.pdf

clean:
	rm -f README.aux README.log README.nav README.out README.snm README.toc
