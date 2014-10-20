head(lapply(as.vector(sulfate1), sort))
# [[6]]
# numeric(0)

#@"2014-10-15 14:52:23 CDT"
head(top_counts, 20)

#@"2014-10-14 23:45:11 CDT"
head(read.csv("001.csv")[1])
## returns date column

#@"2014-10-14 23:23:44 CDT"
head(data.frame(read.csv("001.csv")))$sulfate
head(data.frame(read.csv("001.csv")))$nitrate
## successful

#@"2014-10-14 23:19:47 CDT"
head(data.frame(read.csv("001.csv")))
## successful

#@"2014-10-14 14:38:03 CDT"
## swirl, Getting and Cleaning Data, Manipulating Data with dplyr
head(mydf)
## successful

##rankhospital.R 
head(testsorter,n)$Hospital.Name


##best.R
head(X)
#X=outcome

head(x, ...)
## Default S3 method:
head(x, n = 6L, ...)
## S3 method for class 'data.frame'
head(x, n = 6L, ...)
## S3 method for class 'matrix'
head(x, n = 6L, ...)
## S3 method for class 'ftable'
head(x, n = 6L, ...)
## S3 method for class 'table'
head(x, n = 6L, ...)
## S3 method for class 'function'
head(x, n = 6L, ...)
