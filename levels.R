

levels(data.frame(a,b)[,2])[2]
##b<-as.matrix(split(care_outcome[,11], care_outcome$State))[1]
##a<-as.matrix(split(care_outcome$Hospital.Name, care_outcome$State))[1]
##returns "14.5", the second H.A. mortality rate in Alaska

levels(data.frame(a,b)[,2])
##b<-as.matrix(split(care_outcome[,11], care_outcome$State))[1]
##a<-as.matrix(split(care_outcome$Hospital.Name, care_outcome$State))[1]
##returns six levels ranging for 13.4 to NA.

levels(pmin.int(data.frame(a,b)[,2], na.rm=TRUE))
##b<-as.matrix(split(care_outcome[,11], care_outcome$State))[1]
##a<-as.matrix(split(care_outcome$Hospital.Name, care_outcome$State))[1]
##returns six "levels" ranging from 13.4 to NA.
