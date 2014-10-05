with(dd, order(-z, b))
##see   http://stackoverflow.com/questions/
##      1296646/how-to-sort-a-dataframe-by-columns-in-r
## returns 4 2 1 3

ranked_outcome<-trimmed_outcome[with(trimmed_outcome, order(trimmed_outcome[,2],rankcoltouse))]
## returns error: undefined columns

with(data, expr, ...)
within(data, expr, ...)
