#@"2014-10-19 17:41:06 CDT"
apply(as.matrix(id), 2, getElement(list.files(), id))
# object '001.csv' of mode 'function' was not found

"2014-10-19 16:59:55 CDT"
apply(as.matrix(sulfate1), 2, sort)

#@"2014-10-19 16:35:52 CDT"
apply(read.csv("001.csv")$sulfate, 1, min)
# Err dim(X) must have a positive length
# http://cran.r-project.org/doc/FAQ/R-FAQ.html#Why-do-my-matrices-lose-dimensions_003f
apply(sulfate1, 1, min) ## sulfate1<-read.csv("001.csv")$sulfate
## same Err
# http://stackoverflow.com/questions/16682576/r-error-dimx-must-have-a-positive-length
apply(as.vector(sulfate1), 2, min) ## sulfate1<-read.csv("001.csv")$sulfate
## same Err
apply(as.matrix(sulfate1), 1, min) ## sulfate1<-read.csv("001.csv")$sulfate
# [1453]     NA     NA     NA     NA     NA     NA     NA     NA     NA
apply(as.matrix(read.csv("001.csv")$sulfate), 1, min)
# [1453]     NA     NA     NA     NA     NA     NA     NA     NA     NA

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