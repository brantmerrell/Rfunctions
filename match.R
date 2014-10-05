

match(sixstates, care_outcome[,7], nomatch=0)
##sixstates<-c("AL","TX","VA","OK","UT","CA")
##returns 1, 3894, 4279, 3244, 4220, 270

match("AR", care_outcome[,7], nomatch=0)
##returns 193

match("AL", care_outcome[,7], nomatch=0)
##returns 1

match("TX", care_outcome[,7], nomatch=0)
##returns 3894

match(12.1, numeric13, nomatch=0)
##numeric13<-care_outcome[,13]
##returns 1

match(12.1, numeric13_14, nomatch=0)
##numeric13_14<-data.frame(numeric13,numeric14)
##numeric13<-care_outcome[,13]
##numeric14<-care_outcome[,14]
##returns 0

12.1 %in% numeric13
##numeric13_14<-data.frame(numeric13,numeric14)
##numeric13<-care_outcome[,13]
##numeric14<-care_outcome[,14]
##returns TRUE


12.1 %in% numeric13_14
##numeric13_14<-data.frame(numeric13,numeric14)
##numeric13<-care_outcome[,13]
##numeric14<-care_outcome[,14]
##returns FALSE

numeric13_14 %in% care_outcome
##numeric13_14<-data.frame(numeric13,numeric14)
##numeric13<-care_outcome[,13]
##numeric14<-care_outcome[,14]
##returns one FALSE for each column in numeric13_14


care_outcome %in% numeric13_14
##numeric13_14<-data.frame(numeric13,numeric14)
##numeric13<-care_outcome[,13]
##numeric14<-care_outcome[,14]
##returns one FALSE for each column in care_outcome

match(care_outcome, numeric13_14)
##numeric13_14<-data.frame(numeric13,numeric14)
##numeric13<-care_outcome[,13]
##numeric14<-care_outcome[,14]
##returns one NA for each column in care_outcome

match(care_outcome, numeric13_14, incomparable=NULL)
##numeric13_14<-data.frame(numeric13,numeric14)
##numeric13<-care_outcome[,13]
##numeric14<-care_outcome[,14]
##returns one NA for each column in care_outcome

match(care_outcome, numeric13_14, nomatch=1, incomparable=NULL)
##numeric13_14<-data.frame(numeric13,numeric14)
##numeric13<-care_outcome[,13]
##numeric14<-care_outcome[,14]
##returns one 1 for each column in care_outcome

match(care_outcome, numeric13_14, nomatch=NA, incomparable=NULL)
##numeric13_14<-data.frame(numeric13,numeric14)
##numeric13<-care_outcome[,13]
##numeric14<-care_outcome[,14]
##returns one NA for each column in care_outcome

##best.R, rankhospital.R check that state argument exists in file
vstt<-state %in% care_outcome[,7]
##state<-"TX"
##returns TRUE

match(x, table, nomatch = NA_integer_, incomparables = NULL)

x %in% table