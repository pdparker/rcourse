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

# first I am going to z-score all achievement scores
pisa[, grep("^PV[1-5].*", names(pisa))] <- apply(pisa[, grep("^PV[1-5].*", names(pisa))],
												 2, scale)
#model without moderation
modelMain <- lm(SCMAT ~ PV1MATH + gender, data = pisa)
print(summary(modelMain))
#Model with interaction
modelInt <- lm(SCMAT ~ PV1MATH*gender, data = pisa)
print(summary(modelInt))
#Compute simple effect
library(car)
deltaMethod(modelInt,g = "ach + int*1",vcov. = vcov(modelInt),parameterNames = c("int", "ach", "gen", "int"))
deltaMethod(modelInt,g = "ach + int*2",vcov. = vcov(modelInt),parameterNames = c("int", "ach", "gen", "int"))


#load the mediation package
library(mediation)
# here we will use the subset command to account for missing data on SCMAT
# First we explore the effect of gender on achievement
modelA <- lm(PV1MATH ~ gender, data = pisa)
# Second we estimate the effect of gender and PV1MATH allowing for a treatment by mediator interaction
modelB <- lm(SCMAT ~ gender*PV1MATH, data = pisa, subset = !is.na(SCMAT) )
# Now we calculate the mediation using simulation (see help file for how to do bootstrapping)
modelAB <- mediate(modelA, modelB, treat = 'gender', mediator = 'PV1MATH', sims = 100)
# Get the results and plot them
print(summary(modelAB) )
plot(modelAB)

#First lets create a blue colar versus white colar variable
# We will do this via the recode function in the car package
library(car)
pisa$socialClass <- recode(pisa$SSECATEG, "c(1,2) = 0; c(3,4) = 1")
# now we can run our logistic regression
modelLogistic <- glm(socialClass ~ ESCS, data = pisa, family = binomial(link = 'logit') )
# Summary of the model
print(summary(modelLogistic) )
# Coefs in log odds
print(exp(coef(modelLogistic) ))

modelRandomSlope <- lmer(SCMAT ~ PV1MATH + (PV1MATH|SCHOOLID.x) , data = pisa)


#plot
visualize.lme <- function (model, coefficient, group, ...){
	r <- ranef(model)[[group]]
	f <- fixef(model)
	
	effects <- data.frame(r[,1]+f[1], r[,2]+f[2])
	
	number.lines <- nrow(effects)
	
	predictor.min <- tapply(model@frame[[coefficient]], model@frame[[group]], min, na.rm=TRUE)
	predictor.max <- tapply(model@frame[[coefficient]], model@frame[[group]], max, na.rm=TRUE)
	
	outcome.min <- min(predict(model), na.rm=TRUE)
	outcome.max <- max(predict(model), na.rm=TRUE)
	
	plot (c(min(predictor.min),max(predictor.max)),c(outcome.min,outcome.max), type="n")
	
	for (i in 1:number.lines){
		expression <- function(x) {effects[i,1] + (effects[i,2] * x) }
		curve(expression, from=predictor.min[i], to=predictor.max[i], add=TRUE)
	}
}



visualize.lme(modelRandomSlope, "standLRT", "SCHOOLID.x", 
			  xlab="Achievement in Math", ylab="self-concept",
			  main="Effect of achievement on self-concept stratified by school")