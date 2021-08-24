notes := $(wildcard ????-??-??-*/README.md)
slides_tex := $(patsubst %.md,%.tex,$(notes))
slides_pdf := $(patsubst %.tex,%.pdf,$(slides_tex)) 

$(slides_tex): %.tex: %.md preamble-slides.tex
	pandoc $< \
	    -t beamer \
	    --slide-level 2 \
	    -H preamble-slides.tex \
	    -o $@

$(slides_pdf): %.pdf: %.tex
	cd $(dir $@) && pdflatex $(notdir $<)
	rm $(basename $<).log $(basename $<).nav $(basename $<).aux $(basename $<).snm $(basename $<).toc

all: $(slides_pdf)

# clean up everything except pdfs and keynote files 
clean:
	latexmk -c
	rm -rf *.nav *.snm
	rm -rf $(slides_tex)

# clean up everything including pdfs and keynote files 
reallyclean:
	latexmk -C
	rm -rf $(slides_tex)
	rm -rf *.nav *.snm *.out
	rm -rf $(slides_key)

.DEFAULT_GOAL := all

.PHONY: all clean reallyclean
