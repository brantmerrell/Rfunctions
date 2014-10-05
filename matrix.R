

as.matrix(orderedsplit$ AK )
  ##orderedsplit <- split (testsorter$Hospital.Name, testsorter$State)
    ##alphebatized this time, not in care_outcome order
  ##testsorter<-dataframetest[order(dataframetest[,47]),]
  ##dataframetest<-data.frame(care_outcome,rankcoltouse)
  ##rankcoltouse<-rank(coltouse,na.last=TRUE,ties.method=c("first"))
    ##see coltouse in control.R
    ##see care_outcome in data_input.R
## valid return - space between "$" and "AK" does not change function

AK_matrix <- as.matrix(orderedsplit$AK)
  ##orderedsplit <- split (testsorter$Hospital.Name, testsorter$State)
    ##alphebatized this time, not in care_outcome order
  ##testsorter<-dataframetest[order(dataframetest[,47]),]
  ##dataframetest<-data.frame(care_outcome,rankcoltouse)
  ##rankcoltouse<-rank(coltouse,na.last=TRUE,ties.method=c("first"))
    ##see coltouse in control.R
    ##see care_outcome in data_input.R
##returns list of 17 Alaska hospitals

AL_matrix <- as.matrix(orderedsplit$AL)
  ##orderedsplit <- split (testsorter$Hospital.Name, testsorter$State)
    ##alphebatized this time, not in care_outcome order
  ##testsorter<-dataframetest[order(dataframetest[,47]),]
  ##dataframetest<-data.frame(care_outcome,rankcoltouse)
  ##rankcoltouse<-rank(coltouse,na.last=TRUE,ties.method=c("first"))
    ##see coltouse in control.R
    ##see care_outcome in data_input.R
##returns list of 98 Alabama hospitals numbered [n,]
  ##AL_matrix[1] returns "CRESTWOOD MEDICAL CENTER"
  ##AL_matrix[2] returns "BAPTIST MEDICAL CENTER EAST"

as.matrix(orderedsplit)
##orderedsplit <- split (testsorter$Hospital.Name, testsorter$State)
####alphebatized this time, not in care_outcome order
##testsorter<-dataframetest[order(dataframetest[,47]),]
##dataframetest<-data.frame(care_outcome,rankcoltouse)
##rankcoltouse<-rank(coltouse,na.last=TRUE,ties.method=c("first"))
##see coltouse in control.R
##see care_outcome in data_input.R
##returns 54x2 list of States and hospital tabulations

as.list(ALsplit)
##ALsplit<-split (testsorter$Hospital.Name, testsorter$State)[AL]

as.matrix(ALsplit)
##ALsplit<-split (testsorter$Hospital.Name, testsorter$State)[AL]
##returns "AR Character,77"

as.matrix(hospitalsbystate)
##hospitalsbystate<-split (testsorter$Hospital.Name, testsorter$State)
##returns 54x2 list of States and hospital tabulations

as.matrix(statevector)
##statevector<-unique(care_outcome[,7])
##returns same as asmatrix.(statevector,statenumber)

as.matrix(statevector,statenumber,rownames.force=character)
##statevector<-unique(care_outcome[,7])
##statenumber<-c(1:54)
##returns same as without rownames.force=character

as.matrix(statevector,statenumber,rownames.force=NA)
##statevector<-unique(care_outcome[,7])
##statenumber<-c(1:54)
##returns same as without rownames.force=NA

as.matrix(statevector,statenumber)
##statevector<-unique(care_outcome[,7])
##statenumber<-c(1:54)
##returns 54x1 of 54 states

as.matrix(statenumber,statevector)
##statevector<-unique(care_outcome[,7])
##statenumber<-c(1:54)
##returns 54x1 of 54 numbers

as.matrix(b,a)
as.matrix(a,b)
##b<-as.matrix(split(care_outcome[,11], care_outcome$State))[1]
##a<-as.matrix(split(care_outcome$Hospital.Name, care_outcome$State))[1]
##both return a 1x1 "Character,17"

as.matrix(split(care_outcome[,11], care_outcome$State))[1]
##returns H.A. mortality rates of 5 Alaskan hospitals, +12NA

as.matrix(split(care_outcome$Hospital.Name, care_outcome$State))[1]
##returns a list of 17 alaskan hospitals

as.matrix(split(care_outcome[,11], care_outcome$State))
##returns a 54x2 matrix, listing states and tabulating hospitals per state

as.matrix(split(care_outcome$Hospital.Name, care_outcome$State))
##returns a 54x2 matrix, states in column 1, hospitals per state in column 2

matrix(data = NA, nrow = 1, ncol = 1, byrow = FALSE,
       dimnames = NULL)