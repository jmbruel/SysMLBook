#-----------------------------------------------------
MAIN=main
ICONSDIR=/Users/bruel/dev/asciidoc/images/icons
#-----------------------------------------------------

all: *.txt
	@echo '==> Compiling asciidoc files to generate HTML'
	asciidoc -a toc2 -b html5 -a icons -a iconsdir=$(ICONSDIR) -a data-uri \
	 -a numbered $(MAIN).txt
tp: ups-tp.txt
	@echo '==> Compiling asciidoc files to generate HTML'
	asciidoc -a toc2 -b html5 -a icons -a iconsdir=$(ICONSDIR) -a data-uri \
	 -o ups-tp.html -a numbered ups-tp.txt
deckjs:
	@echo '==> Compiling asciidoc files to generate SLIDES'
	asciidoc -b deckjs -a icons -a iconsdir=$(ICONSDIR) -a data-uri -a numbered \
	 -a deckjs_transition=horizontal-slide -a deckjs_theme=web-2.0 \
	 -o $(MAIN).deckjs.html $(MAIN).txt

#all: *.txt
#	@echo '==> Compiling asciidoc files to generate HTML'
#	asciidoc -a posix --unsafe make.txt

compact:
	@echo '==> Compiling asciidoc files to generate compact HTML'
	asciidoc -a theme=compact -a icons -a iconsdir=./images/icons main.txt -o main.compact.html

slidy:
	@echo '==> Compiling asciidoc files to generate HTML'
	asciidoc -a posix --unsafe make.txt

co: 
	@echo '==> Checkout de la dernière version'
	git checkout master

commit: 
	@echo '==> Commit de la dernière version'
	git add .
	git commit -m "maj by JMB"

github:
	@echo '==> Create github repo'
	git remote add origin https://github.com/jmbruel/SysMLBook.git

push:
	@echo '==> Pushing to gitub'
	git push -u origin master

init:
	@echo '==> Repository initial'
	git init

clean: 
	@echo '==> Suppression des fichiers de compilation'
	@# fichiers de compilation latex
	@rm -f *.log *.aux *.dvi *.toc *.lot *.lof *.ilg
	@# fichiers de bibtex
	@rm -f *.blg
