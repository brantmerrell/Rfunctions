
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