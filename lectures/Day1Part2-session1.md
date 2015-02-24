---
title: "Day 1 Part 2 - Playing with Data"
author: "Philip Parker"
date: "6 February 2015"
output:
  slidy_presentation:
     duration: 30
     css: css/reveal.css

---


## Basic Descriptives
 - For the rest of the day we will work with two subsamples of the PISA2003 data

```r
setwd("~/Dropbox/Rcourse/data/")
library(foreign)
pisaPsych <- read.spss("PISA2003.sav", to.data.frame=TRUE, use.value.labels = FALSE)
pisaAch <- read.spss("PISA2003-Achievement.sav", to.data.frame=TRUE, use.value.labels = FALSE)
names(pisaPsych)
str(pisaPsych)
```

## Basic Descriptives - Single Variable

```r
# This will strangely return NA
mean(pisaPsych$HISEI)
```

```
## [1] NA
```

```r
# Default action for missing in R is to fail. Need to tell it don't do that
mean(pisaPsych$HISEI, na.rm=TRUE)
```

```
## [1] 52.57619
```

- Try median, range, min, max, table, quantiles

## Basic Descriptives - Multiple Variables

```r
summary(pisaPsych)
# A better set of summary data is in psych package
library(psych)
describe(pisaPsych)
```

## Apply family
- The apply family is R's compact version of for loops.
- We will look at apply and tapply
- Lets get the mean values for the achievement data

```r
apply(pisaAch[,c("PV1MATH", "PV1READ", "PV1SCIE", "PV1PROB")], 2, mean, na.rm=TRUE)
```

```
##  PV1MATH  PV1READ  PV1SCIE  PV1PROB 
## 523.2091 529.9949 526.0116 529.8376
```

```r
tapply(pisaAch$PV1PROB, pisaAch$SCHOOLID, mean, na.rm=TRUE)
```

```
## 00001           00002           00003           00004           
##        491.9057        535.2215        556.6979        508.5993 
## 00005           00006           00007           00008           
##        530.8096        531.2202        442.1496        622.5143 
## 00009           00010           00011           00012           
##        611.5033        521.0110        527.0367        445.9511 
## 00013           00014           00015           00016           
##        513.0117        539.5036        512.0016        579.1769 
## 00017           00018           00019           00020           
##        524.0826        516.6261        579.2674        546.1009 
## 00021           00022           00023           00024           
##        514.9198        476.6740        610.8757        525.5136 
## 00025           00026           00027           00028           
##        551.1757        589.0355        447.8045        490.6239 
## 00029           00030           
##        455.6754        525.0950
```

```r
# Average achievement across the four domains NOTE use of 1 instead of 2
pisaAch$GPA <- apply(pisaAch[,c("PV1MATH", "PV1READ", "PV1SCIE", "PV1PROB")],1,mean, na.rm=TRUE)
```

- We will look at better ways of creating scale scores next time

## Subsetting and splitting

```r
# Splitting data
schoolAbility <- split(pisaAch, pisaAch$SCHOOLID)
# Subsetting data
girls <- subset(pisaPsych, subset = gender == 1)
boys <- subset(pisaPsych, subset = gender == 2)
```

- The lapply and sapply commands with apply functions to all dataframes in a list

## Merge
There are three main merging commands in r:

- rbind or rbind.data.frame for stacking data (rbind.fill in the plyr package for unbalanced data)
- cbind or cbind.data.frame for putting columns together
- merge

```r
#Stack data
pisaPsych <- rbind.data.frame(girls,boys)
#Merge by ID
pisaAllData <- merge(pisaPsych, pisaAch, by = "STIDSTD")
#check
sprintf("The number of CASES in pisaPsych is %d, in pisaAch is %d, and in the merged data is %d \n", 
        nrow(pisaPsych),nrow(pisaAch), nrow(pisaAllData)
        )
```

```
## [1] "The number of CASES in pisaPsych is 1180, in pisaAch is 1180, and in the merged data is 1180 \n"
```

```r
sprintf("The number of VARIABLES in pisaPsych is %d, in pisaAch is %d, and in the merged data is %d", 
        length(pisaPsych),length(pisaAch), length(pisaAllData)
        )
```

```
## [1] "The number of VARIABLES in pisaPsych is 41, in pisaAch is 24, and in the merged data is 64"
```

## Aggregation
- Ok so no IPPE presentation is complete without reference to the BFLP
- So how would we add a school average reason score to our data
- We need both aggregate, name, and merge functions

```r
schoolAvg <- aggregate(pisaAllData$GPA, by = list(pisaAllData$SCHOOLID.x), mean, na.rm=TRUE)
names(schoolAvg) <- c("SCHOOLID.x", "avg.reason")
pisaAllData <- merge(pisaAllData, schoolAvg, by = "SCHOOLID.x")
```
- How might you aggregate multiple variables at a time
- How could we aggregate by both school.id and gender

