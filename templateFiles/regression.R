							### Running Regression in R ###
# change the working directory
getwd()
setwd("/Users/phparker/Dropbox/Rcourse/data/")
getwd()

# read in the data we need
library(foreign)
ach <- read.spss("PISA2003-Achievement.sav", to.data.frame = TRUE, use.value.labels = FALSE)
psych <- read.spss("PISA2003.sav", to.data.frame = TRUE, use.value.labels = FALSE)
names(ach)
pisa <- merge(ach,psych, by = "STIDSTD")

#Run ther model and save it to an object
model1 <- lm(SCMAT ~ PV1MATH + PV1READ + PV1SCIE, data = pisa)
#Return the output
print(summary(model1))
#Check the assumptions
plot(model1)

# Here are our original coefficents
print(coef(model1))
#Z score on the fly
model2 <- lm(SCMAT ~ scale(PV1MATH) + scale(PV1READ) +
			 	scale(PV1SCIE), data = pisa)
#Return the output
print(coef(model2))

# Change metric on the fly
model3 <- lm(SCMAT ~ I(PV1MATH/100) + I(PV1READ/100) +
			 	I(PV1SCIE/100), data = pisa)
#Return the output
print(coef(model3))


# first I am going to z-score all achievement scores
pisa[, grep("^PV[1-5].*", names(pisa))] <- apply(pisa[, grep("^PV[1-5].*", names(pisa))],
												 2, scale)
# Run the model with just SES
modelSes <- lm(SCMAT ~ ESCS, data = pisa)
print(summary(modelSes))
# Run the model with SES and achievement
modelSesAch <- lm(SCMAT ~ ESCS + PV1MATH + PV1READ + PV1SCIE, data = pisa)
print(summary(modelSesAch))
# Compare the models 
print(anova(modelSes, modelSesAch))