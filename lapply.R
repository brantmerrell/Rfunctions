lapply(files, read.csv)

lapply(files, as.integer)
## returns NA

"2014-10-19 18:47:40 CDT"
lapply(list.files()[1], nob)
# Err subscript out of bounds

#@"2014-10-19 18:46:12 CDT"
lapply(files, class)
## successful

#@"2014-10-19 18:45:47 CDT"
lapply(files, nob)
# Err subscript out of bounds

#@"2014-10-19 18:00:29 CDT"
lapply(id, read) ##id<-1:2
## successful

lapply(id, getElement(list.files(), id))
# object '001.csv' of mode 'function' was not found

#@"2014-10-19 17:03:52 CDT"
lapply(id, nobs)
## works for integers and vectors

lapply(sulfate1, sort)
# [[1461]]
# numeric(0)

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
