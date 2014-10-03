split (testsorter$Hospital.Name, testsorter$State)[AL]

split (testsorter$Hospital.Name, testsorter$State)
##testsorter<-dataframetest[order(dataframetest[,47]),]
#dataframetest<-data.frame(care_outcome,rankcoltouse)
##returns all hospital names, split by state

head(split(dataframestate, dataframestate$coltouse))
##error group length 0 but data length > 0

split(care_outcome[,11], care_outcome$State)$AL

split(care_outcome[,11], care_outcome$State)
##returns 54 lists of numbers and NAs

split(care_outcome$Hospital.Name, care_outcome$State)
##returns 54 lists of hospital names, one for each state.

##rankall.R
splitcoltouse <-split(rankcoltouse,care_outcome$State)
AKrankcoltouse <- splitcoltouse$AK[n]
dataframesplit$AK[n]

split(x, f, drop = FALSE, ...)