.PHONY: all clean

all: README.pdf

README.pdf: README.md
	pandoc README.md -t beamer --pdf-engine=pdflatex --slide-level 2 -H ../preamble-slides.tex -o README.pdf

clean:
	rm -f README.tex README.aux README.log README.nav README.out README.snm README.toc README.vrb