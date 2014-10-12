#@"2014-10-11 18:19:44 CDT"
## NOTE: do not attempt the '$' selector for matrices

#@"2014-10-11 17:06:50 CDT"
## test for subset.R"2014-10-11 17:05:48 CDT"
as.matrix(schedule)
# generates proper matrix
schedule<-as.matrix(data.frame(activity, start, end, location, minutes, hours))
# generates proper matrix
## schedule reverted to data frame @"2014-10-11 17:21:21 CDT"

## objective: automate row names for a matrix
#   from http://stackoverflow.com/questions/11187306/r-heatmap-on-imported-matlab-table
as.matrix(c(1:5),rownames.force=TRUE)
#   same output as "rownames.force=NULL"
##  unsuccessful @"2014-10-08 13:35:34 CDT"

## objective: automate row names for any matrix
#   inputs from concatenate.R @"2014-10-08 13:18:33 CDT"
as.matrix(data.frame(start), rownames.force=TRUE)
#   same output as "rownames.force=NULL"
## unsuccessful

## objective: automate row names for the schedule.R matrix
#   inputs from concatenate.R @"2014-10-08 13:11:24 CDT"
as.matrix(data.frame(activity,start,end,range,location), rownames.force=TRUE)
#   same output as "rownames.force=NULL"
## unsuccessful

## objective: automate row names from a vector for the schedule.R matrix
#   inputs from concatenate.R @"2014-10-08 13:10:06 CDT"
as.matrix(data.frame(activity,start,end,range,location), rownames.force=names)
#   same output as "rownames.force=NULL"
## unsuccessful

## objective: automate row names from a vector for the schedule.R matrix
#   inputs from concatenate.R @"2014-10-08 12:36:51 CDT"
as.matrix(data.frame(activity,start,end,range,location), rownames.force=activity)
#   same output as "rownames.force=NULL"
## unsuccessful

## objective: convert the data frame for schedule.R to a matrix
#   inputs from concatenate.R @"2014-10-08 12:36:51 CDT"
as.matrix(data.frame(activity,start,end,range,location))
#   returns 14*5 matrix


## objective: create 14*5 grid of activity, start, end, range, and location for schedule.R
#   as.matrix(x, rownames.force = NA, ...) recognizes only argument 1 as x
## Sol add parentheses to compress vectors into argument X, add argument to define X
#   inputs from concatenate.R @"2014-10-08 12:36:51 CDT"
as.matrix((activity,start,end,range,location), rownames.force = NA)
#   Err unexpected ','
## Sol data.frame()


## objective: create 14*5 grid of activity, start, end, range, and location for schedule.R
## Sol remove c() function from within matrix
#   inputs from concatenate.R @"2014-10-08 12:36:51 CDT"
as.matrix(activity,start,end,range,location)
#   returns 14*1 matrix
#   unsuccessful, looking for 14*5 matrix.

## objective: create 14*5 grid of activity, start, end, range, and location for schedule.R
#   inputs from concatenate.R @"2014-10-08 12:36:51 CDT"
as.matrix(c(activity,start,end,range,location))
#   returns 70*1 matrix
## unsuccessful, looking for 14*5 matrix


## Oct 7 - what is a good way to generate chessboard coordinates?
as.matrix(boardframe)
## see data_frame.R and PGN_97721646.R
## only returns row numbers with end-of-column labels
## purpose of matrix is questionable - see concatenate.R, Oct 7

as.matrix(AKframe[n,c(1,3)],
ALframe[n,c(1,3)],ARframe[n,c(1,3)],
AZframe[n,c(1,3)],CAframe[n,c(1,3)],
COframe[n,c(1,3)],CTframe[n,c(1,3)],
DEframe[n,c(1,3)],DCframe[n,c(1,3)],
FLframe[n,c(1,3)],GAframe[n,c(1,3)],
HIframe[n,c(1,3)],IDframe[n,c(1,3)],
ILframe[n,c(1,3)],INframe[n,c(1,3)],
IAframe[n,c(1,3)],KSframe[n,c(1,3)],
KYframe[n,c(1,3)],LAframe[n,c(1,3)],
MEframe[n,c(1,3)],MDframe[n,c(1,3)],
MAframe[n,c(1,3)],MIframe[n,c(1,3)],
MNframe[n,c(1,3)],MSframe[n,c(1,3)],
MOframe[n,c(1,3)],MTframe[n,c(1,3)],
NEframe[n,c(1,3)],NVframe[n,c(1,3)],
NHframe[n,c(1,3)],NJframe[n,c(1,3)],
NMframe[n,c(1,3)],NYframe[n,c(1,3)],
NCframe[n,c(1,3)],NDframe[n,c(1,3)],
OHframe[n,c(1,3)],OKframe[n,c(1,3)],
ORframe[n,c(1,3)],PAframe[n,c(1,3)],
PRframe[n,c(1,3)],RIframe[n,c(1,3)],
SCframe[n,c(1,3)],SDframe[n,c(1,3)],
TNframe[n,c(1,3)],TXframe[n,c(1,3)],
UTframe[n,c(1,3)],VTframe[n,c(1,3)],
VIframe[n,c(1,3)],VAframe[n,c(1,3)],
WAframe[n,c(1,3)],WVframe[n,c(1,3)],
WIframe[n,c(1,3)],WYframe[n,c(1,3)],
GUframe[n,c(1,3)])



AKmatrix[n]
ALmatrix[n]
ARmatrix[n]
AZmatrix[n]
CAmatrix[n]
##AKmatrix<-as.matrix(AKframe)
##ALmatrix<-as.matrix(ALframe)
##ARmatrix<-as.matrix(ARframe)
##AZmatrix<-as.matrix(AZframe)
##CAmatrix<-as.matrix(AKframe)
##AKframe<-data.frame(rankedsplit[1])
##ALframe<-data.frame(rankedsplit[2])
##ARframe<-data.frame(rankedsplit[3])
##AZframe<-data.frame(rankedsplit[4])
##CAframe<-data.frame(rankedsplit[5])
##rankedsplit<-split(ordered_outcome, ordered_outcome$State)
##ordered_outcome<-data.frame(trimmed_outcome[order(trimmed_outcome[,3],-trimmed_outcome[,1]),])
##trimmed_outcome<-data.frame(Hospital.Name=care_outcome[,2],State=care_outcome[,7],Outcome=coltouse)
##see coltouse in control.R
##see care_outcome in data_input.R
##returns 3-column matrix of specified state's hospitals in outcome order
##n<-1 returns 1st listed hospital name. No outcome column, dimensions null,class "character"

AKmatrix<-as.matrix(AKframe)
ALmatrix<-as.matrix(ALframe)
ARmatrix<-as.matrix(ARframe)
AZmatrix<-as.matrix(AZframe)
CAmatrix<-as.matrix(CAframe)
##AKframe<-data.frame(rankedsplit[1])
##ALframe<-data.frame(rankedsplit[2])
##ARframe<-data.frame(rankedsplit[3])
##AZframe<-data.frame(rankedsplit[4])
##CAframe<-data.frame(rankedsplit[5])
##rankedsplit<-split(ordered_outcome, ordered_outcome$State)
##ordered_outcome<-data.frame(trimmed_outcome[order(trimmed_outcome[,3],-trimmed_outcome[,1]),])
##trimmed_outcome<-data.frame(Hospital.Name=care_outcome[,2],State=care_outcome[,7],Outcome=coltouse)
##see coltouse in control.R
##see care_outcome in data_input.R
##returns 3-column matrix of specified state's hospitals in outcome order


as.matrix(trimmed_outcome[order(trimmed_outcome[,3]),],c(1:4706))
##trimmed_outcome<-data.frame(Hospital.Name=care_outcome[,2],State=care_outcome[,7],Outcome=coltouse)
##see coltouse in control.R
##see care_outcome in data_input.R
## returns 4706x3 matrix with no "c[1:4706] and with 2 warnings

as.matrix(trimmed_outcome[order(trimmed_outcome[,3]),])
##trimmed_outcome<-data.frame(Hospital.Name=care_outcome[,2],State=care_outcome[,7],Outcome=coltouse)
##see coltouse in control.R
##see care_outcome in data_input.R
## returns 4706x3 matrix in Outcome order, but with reassigned row numbers 

as.matrix(trimmed_outcome[order(trimmed_outcome[,3]),])
##trimmed_outcome<-data.frame(Hospital.Name=care_outcome[,2],State=care_outcome[,7],Outcome=coltouse)
##see coltouse in control.R
##see care_outcome in data_input.R
## returns 3 columns ranked by Outcome, but with reassigned row numbers 

as.matrix(sort(coltouse))
##see coltouse in control.R
##see care_outcome in data_input.R
##returns coltouse numbers in rank order, with matrix rownumbers

as.matrix(coltouse)

as.matrix(trimmed_outcome)
##see coltouse in control.R
##see care_outcome in data_input.R
## returns 3 columns of hospital name, state, outcome

as.matrix(orderedsplit$AK[1],splitcoltouse$AK[1])
  ##orderedsplit <- split (testsorter$Hospital.Name, testsorter$State)
  ##splitcoltouse <-split(rankcoltouse,care_outcome$State)
  ##testsorter<-dataframetest[order(dataframetest[,47]),]
  ##rankcoltouse<-rank(coltouse,na.last=TRUE,ties.method=c("first"))
    ##see coltouse in control.R
    ##see care_outcome in data_input.R
## returns unranked Providence Alaska Medical Center

as.matrix(orderedsplit$AK,splitcoltouse$AK)
  ##orderedsplit <- split (testsorter$Hospital.Name, testsorter$State)
  ##splitcoltouse <-split(rankcoltouse,care_outcome$State)
  ##testsorter<-dataframetest[order(dataframetest[,47]),]
  ##rankcoltouse<-rank(coltouse,na.last=TRUE,ties.method=c("first"))
    ##see coltouse in control.R
    ##see care_outcome in data_input.R
##returns only hospital names

as.matrix(orderedsplit$ AK )
  ##orderedsplit <- split (testsorter$Hospital.Name, testsorter$State)
    ##alphebatized this time, not in care_outcome order
  ##testsorter<-dataframetest[order(dataframetest[,47]),]
  ##dataframetest<-data.frame(care_outcome,rankcoltouse)
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