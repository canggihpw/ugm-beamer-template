.PHONY: build clean watch examples

build:
	latexmk -xelatex main.tex

watch:
	latexmk -xelatex -pvc main.tex

clean:
	rm -rf build/

examples:
	cd examples/tutorial && latexmk -xelatex main.tex
	cd examples/footnote && latexmk -xelatex main.tex
