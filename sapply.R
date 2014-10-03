sapply(care_outcome[,11], mean, na.rm=TRUE, simplify = TRUE, USE.NAMES = TRUE)
#returns one number or "Not Available" for each row

sapply(care_outcome, mean, na.rm=TRUE, simplify = TRUE, USE.NAMES = TRUE)
##returns one NA for every column

sapply(care_outcome, mean, simplify = TRUE, USE.NAMES = TRUE)
##returns one NA for every column

sapply(X, FUN, ..., simplify = TRUE, USE.NAMES = TRUE)