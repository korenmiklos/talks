slides.html: slides.md style.css
	pandoc -t revealjs -s \
		--css style.css \
		--variable theme=white \
		--variable slideNumber=true \
		--variable transition=fade \
		--variable center=true \
		-o slides.html slides.md

clean:
	rm -f slides.html

.PHONY: clean
