#@"2014-10-19 15:53:16 CDT"
min(read.csv("001.csv")$sulfate, na.rm=TRUE)

pmin.int(data.frame(a,b)[,2], na.rm=TRUE)
##b<-as.matrix(split(care_outcome[,11], care_outcome$State))[1]
##a<-as.matrix(split(care_outcome$Hospital.Name, care_outcome$State))[1]
##returns a list of 17 num/NAs and six "levels" ranging from 13.4 to NA.
##isolate levels with levels(pmin.int(data.frame(a,b)[,2], na.rm=TRUE))

pmax.int(care_outcome[,11])
##returns one result for each row, NAs and integers

pmax(care_outcome[,11], na.rm=TRUE)
##returns one result for each row, NAs and integers

max(care_outcome[,11], na.rm=TRUE)
##returns NA

max(care_outcome[,11])
##returns NA

##best.R Find lowest 30-day mortality rate  
bestscore<-min(coltouse,na.rm=TRUE)

max(..., na.rm = FALSE)
min(..., na.rm = FALSE)

