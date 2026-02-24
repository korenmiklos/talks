all: slides.pdf

slides.tex: slides.md ../preamble-slides.tex
	pandoc $< \
		-t beamer \
		--slide-level 2 \
		-V aspectratio=169 \
		-H ../preamble-slides.tex \
		-o $@

slides.pdf: slides.tex
	pdflatex slides.tex
	rm -f slides.log slides.nav slides.aux slides.snm slides.toc

clean:
	rm -f slides.tex slides.pdf slides.log slides.nav slides.aux slides.snm slides.toc slides.out

.PHONY: all clean
