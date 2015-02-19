
# Transform .Rmd files to slidy files

all: Day1Part1-Introduction.md Day1Part1-Introduction.html Day1Part1-session2.md Day1Part1-session2.html \
	Day1Part1-session3.md Day1Part1-session3.html Day1Part2-session1.md Day1Part2-session1.html \
	Day1Part2-session2.md Day1Part2-session2.html

#Introduction
Day1Part1-Introduction.md: Day1Part1-Introduction.Rmd
	/usr/bin/Rscript -e "knitr::knit('Day1Part1-Introduction.Rmd', 'Day1Part1-Introduction.md')"

Day1Part1-Introduction.html: Day1Part1-Introduction.md
	pandoc -s -t slidy Day1Part1-Introduction.md -o Day1Part1-Introduction.html

#session 2
Day1Part1-session2.md: Day1Part1-session2.Rmd
	/usr/bin/Rscript -e "knitr::knit('Day1Part1-session2.Rmd', 'Day1Part1-session2.md')"

Day1Part1-session2.html: Day1Part1-session2.md
	pandoc -s -t slidy Day1Part1-session2.md -o Day1Part1-session2.html

# Session 3
Day1Part1-session3.md: Day1Part1-session3.Rmd
	/usr/bin/Rscript -e "knitr::knit('Day1Part1-session3.Rmd', 'Day1Part1-session3.md')"

Day1Part1-session3.html: Day1Part1-session3.md
	pandoc -s -t slidy Day1Part1-session3.md -o Day1Part1-session3.html

# Session 4
Day1Part2-session1.md: Day1Part2-session1.Rmd
	/usr/bin/Rscript -e "knitr::knit('Day1Part2-session1.Rmd', 'Day1Part2-session1.md')"

Day1Part2-session1.html: Day1Part2-session1.md
	pandoc -s -t slidy Day1Part2-session1.md -o Day1Part2-session1.html

# Session 5
Day1Part2-session2.md: Day1Part2-session2.Rmd
	/usr/bin/Rscript -e "knitr::knit('Day1Part2-session2.Rmd', 'Day1Part2-session2.md')"

Day1Part2-session2.html: Day1Part2-session2.md
	pandoc -s -t slidy Day1Part2-session2.md -o Day1Part2-session2.html

clean:
	rm -rf figure *.inp *.md *.html

cleanmd:
	rm *.md
