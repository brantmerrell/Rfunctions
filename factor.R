

factor(statevector)
##statevector<-unique(care_outcome[,7])
##see care_outcome in data_input.R
## returns
##  list of 56 states
##  54 Levels: AL < AK < ... < GU

factor(statevector, 
       levels = statevector, ordered = TRUE)
##statevector<-unique(care_outcome[,7])
##see care_outcome in data_input.R
## returns
##  list of 56 states
##  54 Levels: AL < AK < ... < GU
       
factor(c(statevector), 
       levels = statevector, ordered = TRUE)
##statevector<-unique(care_outcome[,7])
##see care_outcome in data_input.R
## returns
##  list of 56 states
##  54 Levels: AL < AK < ... < GU


factor(c("Hi", "Med", "Hi", "Low"), 
       levels = c("Low", "Med", "Hi"), ordered = TRUE)
##see   http://stackoverflow.com/questions/
##      1296646/how-to-sort-a-dataframe-by-columns-in-r
## returns 
##  Hi Med Hi Low
##  Levels: Low < Med < Hi