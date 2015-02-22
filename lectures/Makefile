
# Transform .Rmd files to slidy files

.SUFFIXES: .Rmd .html .md

all: Day1Part1-Introduction.md Day1Part1-Introduction.html \
	Day1Part1-session2.md Day1Part1-session2.html \
	Day1Part1-session3.md Day1Part1-session3.html \
	Day1Part2-session1.md Day1Part2-session1.html \
	Day1Part2-session2.md Day1Part2-session2.html \
	Day1Part2-session3.md Day1Part2-session3.html 

#markdown
%.md: %.Rmd
	/usr/bin/Rscript -e "knitr::knit('$*.Rmd')"

#html slides
%.html: %.md
	pandoc -s -t slidy --css="slidy.css" $*.md -o $*.html
	sed -f rep.sed $*.html > temp
	mv temp $*.html

clean:
	rm -rf *.inp *.md 

cleanhtml:
	rm -rf *.html figure