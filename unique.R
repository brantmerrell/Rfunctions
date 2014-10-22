## Swirl R Programming lapply and sapply
unique(c(3, 4, 5, 5, 5, 6, 6)) #@"2014-10-21 23:42:56 CDT"

#@"2014-10-15 14:21:44 CDT"
unique(by_package)

#@"2014-10-15 10:15:42 CDT"
unique(read.csv(getElement(list.files(), 1))$sulfate)
# [1] <NA>    7.21    5.99    4.68    3.47    2.42    1.43    2.76    3.41    1.3 
# [601] 3.96    4.66


#@"2014-10-14 23:30:47 CDT"
unique(read.csv("200.csv")$ID)
#   [1] 200

#@"2014-10-14 23:29:15 CDT"
unique(read.csv("002.csv")$ID)
#   [1] 2

#@"2014-10-14 23:28:47 CDT"
unique(read.csv("001.csv")$ID)
#   [1] 1

statevector<-unique(care_outcome[,7])
##care_outcome in data_input
##  returns 54 states in care_outcome order