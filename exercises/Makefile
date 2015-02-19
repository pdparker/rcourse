all: ex.1.html ex.2.html ex.3.html ex.4.html

ex.1.html: ex.1.Rmd
	/usr/bin/Rscript -e "knitr::knit2html('ex.1.Rmd')"

ex.2.html: ex.2.Rmd
	/usr/bin/Rscript -e "knitr::knit2html('ex.2.Rmd')"

ex.3.html: ex.3.Rmd
	/usr/bin/Rscript -e "knitr::knit2html('ex.3.Rmd')"

ex.4.html: ex.4.Rmd
	/usr/bin/Rscript -e "knitr::knit2html('ex.4.Rmd')"

clean:
	rm *.md

cleanhtml:
	rm *.hmtl


