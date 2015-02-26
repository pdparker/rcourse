#set working directory
setwd("/Users/phparker/Dropbox/Rcourse/data")
#read in the data
library(foreign)
pisa <- read.spss("PISA2003-items.sav", to.data.frame=TRUE, use.value.labels = FALSE)
#load required packages
library(lavaan)
library(lavaan.survey)
library(mitools)
library(semTools)
#We need to create 5 files each with one set of PVs
pisaPv <- list()
# Here we use a loop to create 5 datasets each with a unique set of PVs and give the PVs consistent names
for (i in 1:5){
	extraction <- paste0("^PV", i, ".+")
	pisaPv[[i]] <- pisa[,c(1:46, 87:167, grep(extraction, names(pisa)))]
	pisaPv[[i]][, grep("^PV[1-5]", names(pisaPv[[i]]))] <- 
		apply(pisaPv[[i]][, grep("^PV[1-5]", names(pisaPv[[i]]))],2, scale)
	names(pisaPv[[i]]) <- gsub("^PV[1-5]","",names(pisaPv[[i]]))
	}
#Tell R these are plausible values
a <- imputationList(pisaPv)
#The following set-up is approipriate for all PISA analysis with any current cohort
pisaSurvey <- svrepdesign(ids = ~1, weights = ~W_FSTUWT, data = a,
					   repweights = "W_FSTR[0-9]+", type = "Fay", rho = 0.5)
pisaSurvey

#Lets run a CFA
model <- '
selfConcept =~ ST32Q02 + ST32Q04 + ST32Q06 + ST32Q07 + ST32Q09
anxiety =~ ST32Q01 + ST32Q03 + ST32Q05 + ST32Q08 + ST32Q10
'
# Model without population corrections
fit <- cfa(model, data=pisa, estimator = 'MLR', missing = 'default')
# Model with population corrections
fitSurvey <- lavaan.survey(fit, pisaSurvey)
#Compare fit
fitMeasures(fit)[c("tli", "cfi", "rmsea", "chisq", "df")]
fitMeasures(fitSurvey)[c("tli", "cfi", "rmsea", "chisq", "df")]
# Standardized estimates
#or summary to get everything
standardizedSolution(fitSurvey)

## Multiple groups
measurementInvariance(model, data=pisa, estimator = 'MLR', missing = 'default', group = 'gender')

## Structural equation modelling
model <-  '
selfConcept =~ ST32Q02 + ST32Q04 + ST32Q06 + ST32Q07 + ST32Q09
anxiety =~ ST32Q01 + ST32Q03 + ST32Q05 + ST32Q08 + ST32Q10
selfConcept ~ MATH + READ + SCIE
anxiety ~ MATH + READ + SCIE
'
# Model without population corrections
fit <- sem(model, data=pisaPv[[1]], estimator = 'MLR', missing = 'default')
# Model with population corrections
fitSurvey <- lavaan.survey(fit, pisaSurvey)
# Summary statistics
summary(fitSurvey, fit.measures = TRUE, standardized = TRUE)

## Multigroup SEM
fit <- sem(model, data=pisaPv[[1]], estimator = 'MLR', missing = 'default', group = 'gender',
		   group.equal = c("loadings"))
# Summary statistics
out <- standardizedsolution(fit)
regression <- intersect(grep("(MATH|READ|SCIE)", out$rhs), grep("(selfConcept|anxiety)", out$lhs))
out[regression,]
