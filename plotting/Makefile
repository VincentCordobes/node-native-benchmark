all: plot.svg

plot.pdf: plot.tex points.dat
	pdflatex plot.tex

plot.svg: plot.pdf
	pdf2svg plot.pdf plot.svg

.PHONY: open
open: plot.svg
	open plot.svg -a "Google Chrome"

.PHONY: clean
clean:
	rm -rf *.aux *.log *.pdf

