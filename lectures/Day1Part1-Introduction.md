---
title: "Day 1 Part 1"
author: "Philip Parker"
date: "6 February 2015"
output:
  slidy_presentation:
     duration: 30
---

## Why R

- Free
- Comprehensive
- Flexible
- Does everything (interactive websites, reproducible research)
- In some cases you have no choice
- Great support for [parallel](http://www.r-bloggers.com/how-to-go-parallel-in-r-basics-tips/) processing
- It's fast...er
- Plenty of support from multiple data sources (e.g., Facebook, Twitter, weather, census data, web scrapping)
- Established procedures for downloading, storing, managing, and analysing many large survey data (e.g. PISA)
- R integrates and extends mplus, spss, python, C, Fortran, SQL, HTML/Markdown, ...


## Why not R
- It is a stupid inconsistent [language](http://www.burns-stat.com/pages/Tutor/R_inferno.pdf)
- It is a full language not a macro language (e.g. spss). The learning curve is steep!!
- It is community supported so no one is paid to be nice to you
- Error messages are designed for those familiar with the language


## Some things are just easier in R
Some things are just easier in R:

- Say goodbye to reverse scored items
- Dummy coding
- Multilevel modelling
- glm
- SEM

## Did I mention pretty graphs?
![plot of chunk unnamed-chunk-1](figure/unnamed-chunk-1-1.png) 

## Interactive graphs
<iframe src="http://rpubs.com/PhilipParker/plots2" width="800" height="800"></iframe>


## Pretend you are working!

```r
## install.packages('fun')
library(fun)
mine_sweeper()
gomoku()
```


## Installing R
Notes for how to install are located [here](https://github.com/pdparker/rcourse)

- R is the programming language and can be installed [here](http://cran.r-project.org/)
- R studio is the better GUI and can be installed [here](http://www.rstudio.com/products/rstudio/download/)

Rstudio now covers:

  - R programming
  - R graphics
  - R markdown for word documents, PDFs, web pages
  - Shiny for interactive web pages
  - Git for version control
  - We will only work with R programming in this course
  
Lets look at Rstudio now
  
## Reproducible Research
Rs greatest strength is reproducibility. To leverage this:

- Don't be lazy
- Comment comment comment
- Markdown is a super super easy language integrated into Rstudio for html, word, pdf, or slides
- Go do a git course. Absolutely life saving!


```r
#This is a comment. Have lots of them in your script.
```

## Reproducible Research
- Never use point and click menus (only time saving the FIRST time!!)
- Have a quarantined data file. OR just use SQL and only give collaborators read permission 
- Only create new data files if you have to!
- Make your code clean, use indentation.
- Use descriptive names - there is no silly 8 character limits for variable names in R
- BE CONSISTENT!!! I use camelCase for everything


