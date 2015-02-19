## template file for exercise ex.2.html ##
# The number of participants
n <- 1000
# A normally distributed predictor variable
x <- rnorm(n, mean = 10, sd = 5)
# The predicted response variable
y.hat <- 2 + 1.2*x
# The observed response variable
y <- y.hat + rnorm(n, mean = 0, sd = 3)
#Wrap observed response and predictor variables into a data.frame
myD <- data.frame(x = x, y.observed = y)
# Run a simple regression
model1 <- lm(y ~ x, data = myD)
# Extract the summary statistics
model1.sum <- summary(model1)
#Display results
model1.sum
##END##  