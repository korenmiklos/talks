slides.html: slides.md style.css
	pandoc -t revealjs -s \
		--css style.css \
		--variable revealjs-url=https://unpkg.com/reveal.js@4.6.1 \
		--variable theme=white \
		--variable slideNumber=true \
		--variable transition=fade \
		--variable center=true \
		-o slides.html slides.md

clean:
	rm -f slides.html

.PHONY: clean
