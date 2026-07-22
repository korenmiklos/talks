STYLE = \
  .reveal .slides { font-size: 0.75em; } \
  .reveal h1, .reveal h2, .reveal h3 { text-transform: none !important; } \
  .reveal h1 { font-size: 2.2em; color: \#E52020; } \
  .reveal h2 { font-size: 1.5em; color: \#E52020; } \
  .reveal h3 { font-size: 1.1em; } \
  .reveal section img { border: none; box-shadow: none; max-height: 80vh; max-width: 95%; object-fit: contain; } \
  .reveal ul, .reveal ol { display: block; text-align: left; } \
  .reveal .math { font-size: 1.05em; } \
  .reveal pre { font-size: 0.85em; } \
  .reveal small { font-size: 0.6em; color: \#666; } \
  .reveal .columns { display: flex; gap: 1.5em; align-items: center; } \
  .reveal .column { flex: 1; } \
  .reveal .column img { max-height: 60vh; }

slides.html: slides.md
	@printf '%s\n' '<style>$(STYLE)</style>' '<script type="module">' 'import mermaid from "https://cdn.jsdelivr.net/npm/mermaid@10/dist/mermaid.esm.min.mjs";' 'mermaid.initialize({ startOnLoad: true, theme: "neutral", securityLevel: "loose", sequence: { actorMargin: 50, width: 150, height: 40, mirrorActors: false } });' '</script>' > /tmp/aihr-header.html
	pandoc -t revealjs -s \
	  --variable theme=white \
	  --variable revealjs-url=https://unpkg.com/reveal.js@4 \
	  --variable transition=none \
	  --variable slideNumber=true \
	  -H /tmp/aihr-header.html \
	  -o $@ $<

.PHONY: clean
clean:
	rm -f slides.html
