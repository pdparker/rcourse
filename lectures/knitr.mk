# Makefile to use knitr for presentations

SLIDES := Day1Part1-Introduction.html Day1Part1-session2.html Day1Part1-session3.html Day1Part2-session1.Rmd

all: $(SLIDES)

clean:
  rm -rf *.md mplus.*

%.html: %.Rmd
	/usr/bin/Rscript -e "knitr::knit2html('$*.Rmd')"