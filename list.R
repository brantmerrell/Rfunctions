#@"2014-10-11 17:49:52 CDT"
## DISCOVERY: RStudio or list.R add a space to columns 2+ of a read.CSV.
#### CSVfile "column1" becomes "column1"
#### CSVfile "column2" becomes " column2"

#@"2014-10-11 17:35:20 CDT"
## test for subset.R"2014-10-11 17:32:12 CDT"
as.list(as.vector(read.csv("testschedule.txt")$activity))=="CSV"
#   [1] FALSE FALSE  TRUE FALSE  TRUE FALSE
## successful
as.list(as.vector(read.csv("testschedule.txt")$start))=="2014-10-11 13:09:05 CDT"
#   [1] FALSE FALSE FALSE FALSE FALSE FALSE
## unsuccessful
as.list(as.vector(read.csv("testschedule.txt")$start))==" 2014-10-11 13:09:05 CDT"
#   [1][1] FALSE FALSE FALSE FALSE FALSE  TRUE
## successful
as.list(as.vector(read.csv("testschedule.txt")$end))=="2014-10-11 15:08:53 CDT"
#   [1] FALSE FALSE FALSE FALSE FALSE FALSE
## unsuccessful
as.list(as.vector(read.csv("testschedule.txt")$end))==" 2014-10-11 15:08:53 CDT"
#   [1] FALSE FALSE  TRUE FALSE FALSE FALSE
## successful

as.list(as.vector(read.csv("testschedule.txt")$location))

as.list(ALsplit)
##statesplitsplit<-split (testsorter$Hospital.Name, testsorter$State)
##testsorter<-dataframetest[order(dataframetest[,47]),]
##dataframetest<-data.frame(care_outcome,rankcoltouse)
##rankcoltouse<-rank(coltouse,na.last=TRUE,ties.method=c("first"))
##see coltouse in control.R
##see care_outcome in data_input.R
##returns list of 77 Arkansas hospital names