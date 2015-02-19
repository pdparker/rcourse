# Transform .Rmd files to slidy files

all: Day1Part1-Introduction.md Day1Part1-Introduction.html \
Day1Part1-session2.md Day1Part1-session2.html

Day1Part1-Introduction.md: Day1Part1-Introduction.Rmd
	/usr/bin/Rscript -e "knitr::knit('Day1Part1-Introduction.Rmd', 'Day1Part1-Introduction.md')"

Day1Part1-Introduction.html: Day1Part1-Introduction.md
	pandoc -s -t slidy Day1Part1-Introduction.md -o Day1Part1-Introduction.html

Day1Part1-session2.md: Day1Part1-session2.Rmd
	/usr/bin/Rscript -e "knitr::knit('Day1Part1-session2.Rmd', 'Day1Part1-session2.md')"

Day1Part1-session2.html: Day1Part1-session2.md
	pandoc -s -t slidy Day1Part1-session2.md -o Day1Part1-session2.html

clean:
	rm -rf *.md figure *.inp
