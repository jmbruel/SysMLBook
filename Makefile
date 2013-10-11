#-----------------------------------------------------
MAIN=main
ICONSDIR=/Users/bruel/Dropbox/Public/dev/SysMLBook/slides/images/icons
IMAGESDIR=/Users/bruel/Dropbox/Public/dev/SysMLBook/images
#-----------------------------------------------------

all: *.txt
	@echo '==> Compiling asciidoc files to generate HTML'
	asciidoc -a toc2 -b html5 -a icons -a iconsdir=$(ICONSDIR) -a data-uri \
	-a stylesheet=/Users/bruel/Dropbox/Public/dev/SysMLBook/stylesheets/scribe.css \
	-a imagesdir=$(IMAGESDIR) \
	-a numbered $(MAIN).txt

tout: tp deckjs sommaire ups slidy

book:
	@echo '==> Book ouput'
	a2x -a icons -a iconsdir=$(ICONSDIR) --verbose -ftex $(MAIN).txt
#	sed "s/T2A,T2D,//g" main.tex > test.tex
	cp main.tex test.tex
	pdflatex test
	makeindex test.idx
	pdflatex test

veritas:
	@echo '==> Compiling asciidoc files to generate SLIDES'
	asciidoc -b html5 -a icons -a iconsdir=$(ICONSDIR) -a stylesheet=/Users/bruel/Dropbox/Public/dev/SysMLBook/stylesheets/scribe.css -a data-uri -a numbered \
	 -o Veritas2012.html Veritas2012.txt

icamdoc:
	@echo '==> Compiling asciidoc files to generate SLIDES ICAM'
	asciidoc -b html5 -a icons \
	 -a stylesheet=/Users/bruel/Dropbox/Public/dev/SysMLBook/stylesheets/scribe.css \
	 -a data-uri -a numbered \
	 -a iconsdir=$(ICONSDIR) \
	 -a imagesdir=$(IMAGESDIR) \
	 -o icamplain.html icam.txt

icamdoctoc:
	@echo '==> Compiling asciidoc files to generate SLIDES ICAM'
	asciidoc -b html5 -a icons -a toc2\
	 -a stylesheet=/Users/bruel/Dropbox/Public/dev/SysMLBook/stylesheets/scribe.css \
	 -a data-uri -a numbered \
	 -a iconsdir=$(ICONSDIR) \
	 -a imagesdir=$(IMAGESDIR) \
	 -o icamplaintoc.html icam.txt

icam:
	@echo '==> Compiling asciidoc files to generate SLIDES'
	asciidoc -b deckjs -a icons -a data-uri -a numbered \
	 -a icamslides \
	 -a iconsdir=$(ICONSDIR) \
	 -a imagesdir=$(IMAGESDIR) \
	 -a deckjs_transition=horizontal-slide -a deckjs_theme=web-2.0 \
	 -o icam.html icam.txt

publish:
	cp icam.html /Users/bruel/dev/jmbhome/public/teaching/SysML/icam.html
	cp icamplain.html /Users/bruel/dev/jmbhome/public/teaching/SysML/icamplain-notoc.html
	cp icamplaintoc.html /Users/bruel/dev/jmbhome/public/teaching/SysML/icamplaintoc.html

tp: ups-tp.txt
	@echo '==> Compiling asciidoc files to generate HTML'
	asciidoc -a toc2 -b html5 -a icons -a iconsdir=$(ICONSDIR) -a data-uri \
	 -o ups-tp.html -a numbered ups-tp.txt

deckjs:
	@echo '==> Compiling asciidoc files to generate SLIDES'
	asciidoc -b deckjs -a icons -a iconsdir=$(ICONSDIR) -a data-uri -a numbered \
	 -a deckjs_transition=horizontal-slide -a deckjs_theme=web-2.0 \
	 -a imagesdir=$(IMAGESDIR) \
	 -o $(MAIN).deckjs.html $(MAIN).txt

#all: *.txt
#	@echo '==> Compiling asciidoc files to generate HTML'
#	asciidoc -a posix --unsafe make.txt
sommaire: MasterDL.txt
	@echo '==> Compiling asciidoc files to generate HTML'
	asciidoc -b html5 -a icons -a iconsdir=$(ICONSDIR) MasterDL.txt
ups: ups.txt
	asciidoc -b html5 -a icons -a iconsdir=$(ICONSDIR) ups.txt
	asciidoc -b deckjs -a icons -a iconsdir=$(ICONSDIR) -a data-uri \
	 -a deckjs_transition=horizontal-slide -a deckjs_theme=web-2.0 \
	 -o ups.deckjs.html ups.txt
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
