.SUFFIXES: .Rmd .html

all: ex.1.html ex.2.html ex.3.html ex.4.html

%.html: %.Rmd
	/usr/bin/Rscript -e "knitr::knit2html('$*.Rmd')"

clean:
	rm *.md

cleanhtml:
	rm -rf *.html figures/


