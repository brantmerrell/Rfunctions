lapply(c(2,7,11,17,23),medvariables) # "2014-10-27 16:31:10 CDT"

lapply(1:length(colnames(read.csv("outcome-of-care-measures.csv"))),medvariables)

lapply(1:length(unique(From)),effectivesplit)

## Swirl R Programming lapply and sapply
lapply(unique_vals, function(elem) elem[2]) #@"2014-10-21 23:53:05 CDT"
unique_vals<-lapply(flags, unique) #@"2014-10-21 23:49:05 CDT"
lapply(flag_shapes, range) #@"2014-10-21 23:38:47 CDT"
lapply(flag_colors, sum) #@"2014-10-21 23:31:18 CDT"
cls_list<-lapply(flags, class) #@"2014-10-21 19:53:36 CDT"

lapply(files, as.integer)
## returns NA
as.integer(files)

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
