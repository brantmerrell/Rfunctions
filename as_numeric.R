## convert times in schedule to numbers for tapply experiment
as.numeric(start)
#   returns NAs

numeric14<-as.numeric(care_outcome[,14])

numeric13<-as.numeric(care_outcome[,13])

as.numeric(care_outcome[,13:14])
##returns error: (list) object cannot be coerced to type 'double'