---
title: "Day 1 Part 1 - Data"
author: "Philip Parker"
date: "6 February 2015"
output:
  slidy_presentation:
     duration: 30
     css: css/reveal.css

---
## R basics (the boring bits) - Introduction to Object Orientated Programming

This is NOT a technical introduction but a pragmatic introduction.

Everything in R is:

- An element of a given type
- An object (think container)
- A function

## R basics (the boring bits) - Elements
'Types' data can take include:

- Integer: 1, 2, 3
- Numeric: 1.0, .2, 3.6
- Logical: TRUE, FALSE
- Character: "one", "two", "three"
- Missing or otherwise indisposed: NA, NULL, NaN

## Objects
Objects in R are just containers that you put elements into for storage.

To put something in a container we use the assignment symbols:

- object.name <- stuff you want put in the container

Containers come in the form of:

 - Vectors: 1 or more elements of the same type e.g. 1,2,3
 - Factors: character vector with 'special' properties
 - List: 1 or more objects of any type 1,"A", TRUE
 - Matrix: A two-dimensional vector with attributes [rows:columns]
 - Dataframe: A two-dimensional list with attributes [rows:columns]
 - Array: an N dimensional vector
 
## Functions

A function takes input, transforms it, and returns output. Examples include:

- mean, sd, range, min, max
- lm, t.test, aov, anova, sem, cfa
- summary, plot, str, names, print, cat

## My first R program - Assignment {.smaller}
We are going to take a vector of characters assign to an object and apply a function to it

```r
# Object <- vector of character elements
myFirst <- c("Hello","World!")
#Function cat returning the elements in a nice format
cat(myFirst, sep = " ")
```

```
## Hello World!
```

```r
# Lets assign the output of a function to an object
mySecond <- paste(myFirst, collapse = " ")
# We can now apply functions to this and functions within functions. 
# Lets shout out excitment at learning R
cat(toupper(mySecond), sep = " ")
```

```
## HELLO WORLD!
```

##Other functions to play with
- Beginner: nchar, tolower
- Intermediate: strsplit, substring
- Advanced: gsub, plot with text


## Vectors
A vector is the simplest data type. All elements have to have the same form

```r
#vector - Interger
c(1,2,3,4, NA)
```

```
## [1]  1  2  3  4 NA
```

```r
# Numeric
c(1.3,4.0,5,NA,7.5, .2)
```

```
## [1] 1.3 4.0 5.0  NA 7.5 0.2
```

```r
#Logical
c(NA,TRUE,FALSE,TRUE)
```

```
## [1]    NA  TRUE FALSE  TRUE
```

```r
#Character
c("One", "Fish", "Two", "Fish", NA)
```

```
## [1] "One"  "Fish" "Two"  "Fish" NA
```

```r
#This will not work - will convert everything to a string
c(1,TRUE,"one")
```

```
## [1] "1"    "TRUE" "one"
```

## Vector Indexing

```r
# Example vector
myVect <- c(1.3,4.0,5,NA,7.5, .2)
# Extract element 3
myVect[3]
```

```
## [1] 5
```

```r
# Extract elements 3 to 5
myVect[3:5]
```

```
## [1] 5.0  NA 7.5
```

```r
# Extract non-consecutive elements
myVect[c(1,3,6)]
```

```
## [1] 1.3 5.0 0.2
```

```r
# Which elemnts are greated than 3
which(myVect > 3) # can also use ==, <, <=, >=, !=
```

```
## [1] 2 3 5
```

```r
#Extract them
myVect[which(myVect > 3)]
```

```
## [1] 4.0 5.0 7.5
```

## Exercises
- Create a vector with 15 numeric elements
- Extract the 5th elements
- Extract elements greater than 5
- With the smallest code, extract every 2nd element (Intermediate)
- Extract only even numbers or only odd numbers (Advanced)

## Functions to try
- max, min, range, summary, plot, hist, sort
- Create a vector using the functions: sample, rep, rev

## Factors 
Factors are special character vectors

```r
#Nominal
gender <- c(rep("male",5), rep("female", 10)) 
gender <- factor(gender) 
gender
```

```
##  [1] male   male   male   male   male   female female female female female
## [11] female female female female female
## Levels: female male
```

```r
#Ordinal
height <- c(rep("Phil",5), rep("Joe", 5), rep("Herb", 5))
height <- factor(height, ordered=TRUE)
height
```

```
##  [1] Phil Phil Phil Phil Phil Joe  Joe  Joe  Joe  Joe  Herb Herb Herb Herb
## [15] Herb
## Levels: Herb < Joe < Phil
```

## Functions to try
- table and chisq.test
- relevel

## Lists
A list is a collection of objects of any type or form

```r
int <- c(1,2,3,4, NA)
num <- 3.14
log <- "FALSE"
char <- c("One", "Fish", "Two", "Fish", NA)

myList <- list(int=int,num=num,log=log,char=char, phrase="Hello World")
myList
```

```
## $int
## [1]  1  2  3  4 NA
## 
## $num
## [1] 3.14
## 
## $log
## [1] "FALSE"
## 
## $char
## [1] "One"  "Fish" "Two"  "Fish" NA    
## 
## $phrase
## [1] "Hello World"
```

## Indexing lists

```r
#By name
myList[["char"]]
```

```
## [1] "One"  "Fish" "Two"  "Fish" NA
```

```r
# By number
myList[[4]]
```

```
## [1] "One"  "Fish" "Two"  "Fish" NA
```


## Matrix
A matrix is a two dimensional vector (rows, columns) of the same data form

```r
myMatrix <- matrix(1:100, nrow=10, ncol=10)
myMatrix
```

```
##       [,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8] [,9] [,10]
##  [1,]    1   11   21   31   41   51   61   71   81    91
##  [2,]    2   12   22   32   42   52   62   72   82    92
##  [3,]    3   13   23   33   43   53   63   73   83    93
##  [4,]    4   14   24   34   44   54   64   74   84    94
##  [5,]    5   15   25   35   45   55   65   75   85    95
##  [6,]    6   16   26   36   46   56   66   76   86    96
##  [7,]    7   17   27   37   47   57   67   77   87    97
##  [8,]    8   18   28   38   48   58   68   78   88    98
##  [9,]    9   19   29   39   49   59   69   79   89    99
## [10,]   10   20   30   40   50   60   70   80   90   100
```

```r
#not So helpful
colnames(myMatrix) <- paste0("C_",letters[1:10])
row.names(myMatrix)<- paste0("R_", letters[1:10])
myMatrix
```

```
##     C_a C_b C_c C_d C_e C_f C_g C_h C_i C_j
## R_a   1  11  21  31  41  51  61  71  81  91
## R_b   2  12  22  32  42  52  62  72  82  92
## R_c   3  13  23  33  43  53  63  73  83  93
## R_d   4  14  24  34  44  54  64  74  84  94
## R_e   5  15  25  35  45  55  65  75  85  95
## R_f   6  16  26  36  46  56  66  76  86  96
## R_g   7  17  27  37  47  57  67  77  87  97
## R_h   8  18  28  38  48  58  68  78  88  98
## R_i   9  19  29  39  49  59  69  79  89  99
## R_j  10  20  30  40  50  60  70  80  90 100
```

##Indexing Matrices
- Has the form [row,column]
- Leaving one side empty is short hand for "give me all of them""

```r
# All columns and row 3
myMatrix[3,]
```

```
## C_a C_b C_c C_d C_e C_f C_g C_h C_i C_j 
##   3  13  23  33  43  53  63  73  83  93
```

```r
# All rows and column 4
myMatrix[,4]
```

```
## R_a R_b R_c R_d R_e R_f R_g R_h R_i R_j 
##  31  32  33  34  35  36  37  38  39  40
```

```r
# Cell row 3 column 3
myMatrix[3,3]
```

```
## [1] 23
```
- Try diag, upper.tri, lower.tri
- As an example change the upper triangular elements to 0

## Data Frame
A data.frame is a structured list (rows, columns) of any data form. This is the ONLY format that SPSS uses.


```r
myData <- data.frame(var1 = 1:10, var2 = letters[1:10], var3=rep(c(TRUE,FALSE), 5))
head(myData)
```

```
##   var1 var2  var3
## 1    1    a  TRUE
## 2    2    b FALSE
## 3    3    c  TRUE
## 4    4    d FALSE
## 5    5    e  TRUE
## 6    6    f FALSE
```

```r
names(myData)
```

```
## [1] "var1" "var2" "var3"
```

```r
str(myData)
```

```
## 'data.frame':	10 obs. of  3 variables:
##  $ var1: int  1 2 3 4 5 6 7 8 9 10
##  $ var2: Factor w/ 10 levels "a","b","c","d",..: 1 2 3 4 5 6 7 8 9 10
##  $ var3: logi  TRUE FALSE TRUE FALSE TRUE FALSE ...
```

## Indexing Data Frames

```r
#By name
myData$var1
```

```
##  [1]  1  2  3  4  5  6  7  8  9 10
```

```r
#Using matrix indexing
myData[1,1:2]
```

```
##   var1 var2
## 1    1    a
```

```r
# By list indexing
myData[["var1"]]
```

```
##  [1]  1  2  3  4  5  6  7  8  9 10
```

## Data
Surprisingly most people give up on R in the first few minutes because they cannot get there data into R. Here are the main things you need:

- Know the path to where your data is located
- Know the working directory R is using
- Know the format that your data is in
- Know how to check your data is there
- Don't use the point and click features! 

## Data - where is it

- R is based on unix OS so using "/" to separate folders rather than "\". 
- Your default home location will be represented by a "~" sign  
- Lets see if a file exists (use the 'tab' key for code completion)

```r
file.exists("~/Dropbox/Rcourse/data/PISA2003.sav")
```

```
## [1] TRUE
```
- Getting and setting Rs working directory

```r
getwd()
```

```
## [1] "/Users/phparker/Dropbox/Rcourse/lectures"
```

```r
setwd("~/Dropbox/Rcourse/data")
file.exists("PISA2003.sav")
```

```
## [1] TRUE
```
- Read in the data

```r
#Assumes you have set the working directory!!
#csv data
myData <- read.csv("myCSV.csv", header=TRUE, na.strings = c(-97, -98, -999) )
#txt file - tab deliminated
myData <- read.table("myText.txt", header = TRUE, sep = "\t", na.strings = -999)
#Read in SPSS data
library(foreign)
myData <- read.spss("mySPSS.sav", to.data.frame = TRUE, use.value.labels = FALSE)
```

- Foreign will also read in minitab, SAS, stata, etc.
- R also has great support for SQL and other databases.

## Installing and using packages

```r
install.packages("MplusAutomation")
library(MplusAutomation)
help(MplusAutomation)
?prepareMplusData
```

## Exporting data
- csv: ?write.csv
- txt: ?write.table
- spss: ?write.foreign
- Mplus: ?prepareMplusData

## Pulling it all together

```r
#Set the working directory
setwd("~/Dropbox/Rcourse/data")
#Load the required packages
library(foreign)# read spss data
library(MplusAutomation) # write for spss
```

```
## Loading required package: methods
```

```r
#read the data
myData <- read.spss("PISA2003-Achievement.sav", to.data.frame = TRUE, use.value.labels = FALSE)
```

```
## Warning in read.spss("PISA2003-Achievement.sav", to.data.frame = TRUE,
## use.value.labels = FALSE): PISA2003-Achievement.sav: Unrecognized record
## type 7, subtype 18 encountered in system file
```

```
## Warning in read.spss("PISA2003-Achievement.sav", to.data.frame = TRUE,
## use.value.labels = FALSE): PISA2003-Achievement.sav: Unrecognized record
## type 7, subtype 24 encountered in system file
```

```
## re-encoding from UTF-8
```

```r
#Check it read in ok
dim(myData)
```

```
## [1] 1180   23
```

```r
names(myData)
```

```
##  [1] "SCHOOLID" "STIDSTD"  "PV1MATH"  "PV2MATH"  "PV3MATH"  "PV4MATH" 
##  [7] "PV5MATH"  "PV1READ"  "PV2READ"  "PV3READ"  "PV4READ"  "PV5READ" 
## [13] "PV1SCIE"  "PV2SCIE"  "PV3SCIE"  "PV4SCIE"  "PV5SCIE"  "PV1PROB" 
## [19] "PV2PROB"  "PV3PROB"  "PV4PROB"  "PV5PROB"  "W_FSTUWT"
```

```r
#Advanced! Make that easier to read
sprintf("The number of cases is: %d and the number of variables is: %d", 
        nrow(myData), length(myData)
        )
```

```
## [1] "The number of cases is: 1180 and the number of variables is: 23"
```

## Writing to Mplus

```r
#Write to mplus file and get a mplus template file
prepareMplusData(myData[,276:316], filename = "mplus.dat")
```

```
## Error in `[.data.frame`(myData, , 276:316): undefined columns selected
```

```r
#Advanced! Write the template file to a folder
#Here I have put a dummy file location so you should 
capture.output(prepareMplusData(myData[,276:316], filename = "mplus.dat"), file = "mplus.inp")
```

```
## Error in `[.data.frame`(myData, , 276:316): undefined columns selected
```


