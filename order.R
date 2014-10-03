

sort(dataframetest, partial = NULL, dataframetest[,47])
##error: decreasing must be length-1 logical vector

ccc[order(ccc[,2])]
##ccc<-data.frame(a,b)
##undefinded columns selected

c<-order(data.frame(a,b)[,2], na.last=TRUE, decreasing=FALSE)
##b<-as.matrix(split(care_outcome[,11], care_outcome$State))[1]
##a<-as.matrix(split(care_outcome$Hospital.Name, care_outcome$State))[1]
##assigns a "rank number" to each Alaskan hospital 
##based on the H.A. mortality rate
##undefined columns selected

sort.list(dataframestate$coltouse)
##dataframestate<-data.frame(care_outcome[,7],rankcoltouse)
##coltouse<-care_outcome[,11]
##returns one numeric rank for each row

##sort data frame
testsorter<-dataframetest[order(dataframetest[,47]),]
##returns 4706x47 data frame
##testsorter$Hospital.Name returns ordered hospital names

order(..., na.last = TRUE, decreasing = FALSE)
