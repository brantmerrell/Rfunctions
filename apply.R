

##setwd('C:\\Users\\Josh\\Documents\\Coursera\\medicalrank')
##care_outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
head(apply(care_outcome[14:17], 2, mean, na.rm=TRUE))
##difference between true and false appears nonexistent.

apply(X, MARGIN, FUN, ...)

?apply