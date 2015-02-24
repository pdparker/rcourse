---
title: "Day 1 Part 1 - Data"
author: "Philip Parker"
date: "6 February 2015"
output:
  slidy_presentation:
     duration: 30
     css: css/reveal.css

---


## Example data
- R has many example data sets so does most packages. To see a list of them

```r
data()
```
- To load an example data set

```r
data(iris)
head(iris)
```

```
##   Sepal.Length Sepal.Width Petal.Length Petal.Width Species
## 1          5.1         3.5          1.4         0.2  setosa
## 2          4.9         3.0          1.4         0.2  setosa
## 3          4.7         3.2          1.3         0.2  setosa
## 4          4.6         3.1          1.5         0.2  setosa
## 5          5.0         3.6          1.4         0.2  setosa
## 6          5.4         3.9          1.7         0.4  setosa
```

## Toy data
- R is great for simulation
- Maybe we want to create a toy dataset to play with

## Basics of simulation
- Bias = The expected value is not the population value
- Consistency = How often is the observed value equal to the expected value
- Efficiency = How tightly packed are repeated observations

## Simulation - Bias
Population has a $\mu = 0$ and $\sigma = 1$

```r
myFunction <- function(x) sprintf("The mean is %.2f and the SD is %.2f", mean(x), sd(x))
#bias
myFunction(replicate(100, mean(rchisq(100,2))))
```

```
## [1] "The mean is 2.00 and the SD is 0.22"
```

## Consistency

```r
#consistency
# n = 1
sum(abs(replicate(100, mean(rnorm(1)))) < .5)
```

```
## [1] 45
```

```r
# n = 10 
sum(abs(replicate(100, mean(rnorm(10)))) < .5)
```

```
## [1] 89
```
## Efficency

```r
# Efficency
#n = 1
sd(replicate(100, mean(rnorm(1))))
```

```
## [1] 0.9515241
```

```r
# n = 10
sd(replicate(100, mean(rnorm(10))))
```

```
## [1] 0.2902757
```

```r
# n = 10000
sd(replicate(100, mean(rnorm(10000))))
```

```
## [1] 0.01028532
```

## Regression1
A regression equation is:
$Y = \alpha + \beta_{1} X + \epsilon$

- Y is a continuous response variable
- alpha is mean value conditioned on the other predictors
- beta is weight applied to the predictor X
- epsilon is residual variance distributed as $N \sim (0,\sigma)$

## Regression2

```r
n <- 100
x <- rnorm(n, mean = 10, sd = 5)
y.hat <- 2 + 1.2*x
y <- y.hat + rnorm(n, mean = 0, sd = 3)
myD <- data.frame(x = x, y.observed = y)
model1 <- lm(y ~ x, data = myD)
summary(model1)
```

```
## 
## Call:
## lm(formula = y ~ x, data = myD)
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -5.9089 -1.9796 -0.3146  2.2586  6.2165 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)   3.4022     0.6395    5.32 6.57e-07 ***
## x             1.1354     0.0535   21.22  < 2e-16 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 2.827 on 98 degrees of freedom
## Multiple R-squared:  0.8213,	Adjusted R-squared:  0.8195 
## F-statistic: 450.3 on 1 and 98 DF,  p-value: < 2.2e-16
```

## Regression3
I ran this with n = 10,100,1000, 10 000 the results where:

| n         | alpha | beta |
|-----------|-------|------|
| simulated | 2     | 1.2  |
| 10        | .322  | 1.37 |
| 100       | 2.43  | 1.16 |
| 1000      | 1.85  | 1.22 |
| 10,000    | 2.07  | 1.19 |

## Simulation from Correlation or Covariance matrix

```r
library(MASS)
Sigma <- matrix(c(1,.8082,.8082,1),2,2)
Sigma
```

```
##        [,1]   [,2]
## [1,] 1.0000 0.8082
## [2,] 0.8082 1.0000
```

```r
myD <- mvrnorm(n=1000, rep(0, 2), Sigma)
cor(myD)
```

```
##           [,1]      [,2]
## [1,] 1.0000000 0.7985425
## [2,] 0.7985425 1.0000000
```

## Getting help
In R:

- Error messages - READ THEM!
- ?functionName

Help files have the following structure:

- Usage: function(argument = 1, argumentYouSupply, ...)
- Arguments: Explanations of what the arguments in useage are for and do
- Sometimes there is a list of what the function returns (useful!)
- Examples of how to use the function (USE THESE!!!)

## Outside of R you need to ask good questions


```r
library(fortunes)
fortune("Brain surgery")
```

```
## 
## I wish to perform brain surgery this afternoon at 4pm and don't know where
## to start. My background is the history of great statistician sports
## legends but I am willing to learn. I know there are courses and numerous
## books on brain surgery but I don't have the time for those. Please direct
## me to the appropriate HowTos, and be on standby for solving any problem I
## may encounter while in the operating room. Some of you might ask for
## specifics of the case, but that would require my following the posting
## guide and spending even more time than I am already taking to write this
## note.
##    -- I. Ben Fooled (aka Frank Harrell)
##       R-help (April 1, 2005)
```

## Outside of R you need to ask good questions
- Do your homework first and debug  - also read the error message you are getting!
- Reduced your problem to the simplest form that still returns an error (usually isolates the problem)
- Google
- Use meaningful titles (I see 5 to 10 "Please Help" titled threads a day!)
- Be specific, be direct, explain in full, re-read to check that the question would make sense to someone other than you
- Describe what you are trying to do not the outcome
- Give example data and code tried (this is what simulation and toy data are for)
- Don't just give a function but give the package it came from
