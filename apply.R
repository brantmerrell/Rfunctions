#@"2014-10-15 18:55:07 CDT"
apply(read.csv("001.csv"), 1, nobs)
# Err attempt to select more than one element 

apply(as.vector(coltouse), 2, rank)
##see coltouse in control.R
##see care_outcome in data_input.R
##returns err dim(x) must have positive length

apply(as.matrix(coltouse), 2, rank)
##see coltouse in control.R
##see care_outcome in data_input.R
##returns 4706 numbers with repeats and .5 and .0 decimals

apply(as.matrix(coltouse), 1, rank)
##see coltouse in control.R
##see care_outcome in data_input.R
##returns 4107 copies of the digit 1

apply(coltouse, 1, rank)
##see coltouse in control.R
##see care_outcome in data_input.R
##returns err dim(x) must have positive length



##setwd('C:\\Users\\Josh\\Documents\\Coursera\\medicalrank')
##care_outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
head(apply(care_outcome[14:17], 2, mean, na.rm=TRUE))
##difference between true and false appears nonexistent.

apply(X, MARGIN, FUN, ...)

?apply