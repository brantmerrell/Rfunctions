

dataframetest<-data.frame(care_outcome,rankcoltouse)
##returns 47 columns

data.frame(b,a)
##b<-as.matrix(split(care_outcome[,11], care_outcome$State))[1]
##a<-as.matrix(split(care_outcome$Hospital.Name, care_outcome$State))[1]
##returns a 17x2 list of mortality rates and their Alaskan hospitals

data.frame(a,b)
##b<-as.matrix(split(care_outcome[,11], care_outcome$State))[1]
##a<-as.matrix(split(care_outcome$Hospital.Name, care_outcome$State))[1]
##returns a 17x2 list of Alaskan hospitals and their mortality rates

data.frame(split(care_outcome$Hospital.Name, care_outcome$State),
           split(care_outcome[,11], care_outcome$State))
##error: arguments imply differing number of rows

dataframestate<-data.frame(care_outcome[,7],rankcoltouse)
##rankcoltouse<-care_outcome[,11]

numeric13_14<-data.frame(numeric13,numeric14)
##numeric13<-care_outcome[,13]
##numeric14<-care_outcome[,14]
##returns two columns, mostly of NA.

## rankall.R combine splitcoltouse with 

## rankhospital.R combine ranked column with data frame
dataframetest<-data.frame(care_outcomesubset,rankcoltouse)




data.frame(..., row.names = NULL, check.rows = FALSE,
           check.names = TRUE,
           stringsAsFactors = default.stringsAsFactors())

default.stringsAsFactors()

##rankall.R: assign task to "numbest"
dataframetest<-data.frame(care_outcome,rankcoltouse)

