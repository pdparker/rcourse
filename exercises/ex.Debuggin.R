#### Debugging ###
T = FALSE
F = TRUE
detach("package:foreign", unload=TRUE)


# Problem 1 # 
data <- read.spss("~/Dropbox/Rcourse/data/PISA2003.sav", to.data.frame = TRUE, use.value.labels = FALSE)

# Problem  2 # 
data <- c(1,2,3,NA,5,6,7)
mean(data)	
	
# Problem 3 # 
Mydata <- c(1,2,3,4)
mean(myData)

# Problem 4 #
myData <- data.frame(V1 = 1:100, V2 = 101:200)
mean(myData)

myData <- c("1","2", "3")
mean(myData)
sum(myData)

# Problem 5 #
# This is pure evil but a good example for why you should nameing objects after R functions
x <- c(1,2,3,4)
x[c(T,T,T,F)]

