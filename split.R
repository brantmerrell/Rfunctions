

rankedsplit<-split(ordered_outcome, ordered_outcome$State)
##ordered_outcome<-data.frame(trimmed_outcome[order(trimmed_outcome[,3],-trimmed_outcome[,1]),])
##trimmed_outcome<-data.frame(Hospital.Name=care_outcome[,2],State=care_outcome[,7],Outcome=coltouse)
##see coltouse in control.R
##see care_outcome in data_input.R
##returns ordered outcome broken into states with null dimensions

rankedsplit<-split(ordered_outcome, ordered_outcome$State)
##ordered_outcome<-data.frame(trimmed_outcome[order(trimmed_outcome[,3]),])
##trimmed_outcome<-data.frame(Hospital.Name=care_outcome[,2],State=care_outcome[,7],Outcome=coltouse)
##see coltouse in control.R
##see care_outcome in data_input.R
## returns ordered_outcome broken into states and ranked by outcome, but with NULL dimensions

statified_order<-split(ordered_outcome, ordered_outcome$State)
##ordered_outcome<-trimmed_outcome[with(trimmed_outcome, order(Outcome,-State)),]
#### trimmed_outcome<-data.frame(State=care_outcome[,2],Hospital.Name=care_outcome[,7],Outcome=coltouse),levels=(statevector,ordered=true)

statified_trim<-split(trimmed_outcome, trimmed_outcome$State)
## trimmed_outcome<-data.frame(State=care_outcome[,2],Hospital.Name=care_outcome[,7],Outcome=coltouse),levels=(statevector,ordered=true)
## returns 4510 elements, 1.6 GB


split(care_outcome, care_outcome$State)$AK
##see care_outcome in data_input.R
##returns all columns of AK hospitals

split(care_outcome$Hospital.Name, care_outcome$State)$AK
##see care_outcome in data_input.R
## returns 17 AK hospitals

split(care_outcome$Hospital.Name, care_outcome$State)$AL
##see care_outcome in data_input.R
## returns 98 AL hospitals

split(care_outcome$Hospital.Name, care_outcome$state)
##returns error: group length is 0 but data length > 0
##fixed when state is capitalized to "State"

orderedsplit <- split (testsorter$Hospital.Name, testsorter$State)
    ##alphebatized this time, not in care_outcome order
  ##testsorter<-dataframetest[order(dataframetest[,47]),]
  ##dataframetest<-data.frame(care_outcome,rankcoltouse)
  ##rankcoltouse<-rank(coltouse,na.last=TRUE,ties.method=c("first"))
    ##see coltouse in control.R
    ##see care_outcome in data_input.R
##returns 54 lists of Hospital Names

ALsplit<-split (testsorter, testsorter$State)[AL]
##testsorter<-dataframetest[order(dataframetest[,47]),]
##head() returns 267-2

split (testsorter$Hospital.Name, testsorter$State)[AL]
##head() returns 77x1 hospital names from AL

split (testsorter$Hospital.Name, testsorter$State)
##testsorter<-dataframetest[order(dataframetest[,47]),]
#dataframetest<-data.frame(care_outcome,rankcoltouse)
##returns all hospital names, split by state

head(split(dataframestate, dataframestate$coltouse))
##error group length 0 but data length > 0
##dataframestate<-data.frame(care_outcome[,7],rankcoltouse)

split(care_outcome[,11], care_outcome$State)$AL
##returns 98 results (AL?) for H.A. mortality

split(care_outcome[,11], care_outcome$State)
##returns 54 lists of numbers and NAs

split(care_outcome$Hospital.Name, care_outcome$State)
##returns 54 lists of hospital names, one list for each state.

##rankall.R
splitcoltouse <-split(rankcoltouse,care_outcome$State)
##rankcoltouse<-rank(coltouse,na.last=TRUE,ties.method=c("first"))
##returns a list of numbers specifying ranks, one list for each state

AKrankcoltouse <- splitcoltouse$AK[4]
##returns the ranking of the fourth listed hospital in AK 
## - not of the hospital ranked fourth in the state.

dataframesplit$AK[4]


split(x, f, drop = FALSE, ...)