## template file for exersise ex2.html ##
#install package MASS
# note you only need to run this ONCE!!

## UNCOMMENT LINE BELOW TO RUN ##
#install.packages("MASS")

# load package
library(MASS)
# Correlation matrix from Blau and Duncan (1967)
sigma <- matrix(c(1,.538,.374,
                  .538,1,.445,
                  .374,.445,1), 3,3)
# Colnames for variables
colnames(sigma) <- c("destSocialClass", "Education", "originSocialClass")
# Row names for variables
row.names(sigma) <- colnames(sigma)
# Simulate data
# n = number of participants
# mu = mean variables
# Sigma = correlation or covariance matrix
BD1967Data <- mvrnorm(n = 200, mu = rep(0,3), Sigma = sigma)