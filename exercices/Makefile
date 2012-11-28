MAIN=TPLaveLinge

all: *.txt
	@echo '==> Compiling asciidoc files to generate HTML'
	asciidoc -b html5 -a icons -a iconsdir=../../images/icons/ -a data-uri -a numbered -a correction -o $(MAIN).corrige.html $(MAIN).txt
	asciidoc -a toc2 -b html5 -a icons -a iconsdir=../../images/icons/ -a data-uri -a numbered $(MAIN).txt
	asciidoc -b deckjs -a icons -a iconsdir=../../images/icons/ -a data-uri -a numbered -o $(MAIN).dekjs.html $(MAIN).txt
	asciidoc -b slidy2 -a toc2 -a icons -a iconsdir=../../images/icons/ -a data-uri -a numbered -o $(MAIN).slidy.html $(MAIN).txt
	asciidoc -b slidy2 -a toc2 -a icons -a iconsdir=../../images/icons/ -a data-uri -a numbered -a correction -o $(MAIN).corrigeSlidy.html $(MAIN).txt
	
clean: 
	@echo '==> Suppression des fichiers de compilation'
	@# fichiers de compilation latex
	@rm -f *.log *.aux *.dvi *.toc *.lot *.lof *.ilg
	@# fichiers de bibtex
	@rm -f *.blg
