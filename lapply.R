
lapply(head(care_outcome[,11]), na.rm=TRUE, mean)
##returns one mean for each of the first six rows, all NAs

lapply(head(care_outcome[,11]), mean, na.rm=TRUE)
##returns one mean for each of the first six rows, all NAs

lapply(head(care_outcome[,11:15]), mean, na.rm=TRUE)
##returns one mean for each column, all NAs

lapply(head(care_outcome[,11:15]), mean)
##returns one mean for each column, all NAs

lapply(care_outcome[,11], mean)
##returns one mean for each row

lapply(care_outcome, mean)
##returns one mean for each column

lapply(X, FUN, ...)
