.SUFFIXES: .html .Rmd

HTMLS= Day1Part1-Introduction.html Day1Part1-session2.html Day1Part1-session3.html Day1Part2-session1.html

all: $(HTMLS)

$(HTMLS):

.html:
	/usr/bin/Rscript -e "knitr::knit2html('$*.Rmd')"

