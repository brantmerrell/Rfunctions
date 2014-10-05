

dd[with(dd, order(-z, b)), ]
## returns 4x4 with z descending as [2,1,1,1] and b ascending as Low Med Hi Hi

with(-z, b)
## error: numeric 'envir' arg not of length 1

with(dd, order(-z, b))
##see   http://stackoverflow.com/questions/
##      1296646/how-to-sort-a-dataframe-by-columns-in-r
## returns 4 2 1 3

ranked_outcome<-trimmed_outcome[with(trimmed_outcome, order(trimmed_outcome[,2],rankcoltouse))]
## returns error: undefined columns

with(data, expr, ...)
within(data, expr, ...)
