##see coltouse in control.R
##see care_outcome in data_input.R

## objective: create data frame of schedule2.R objects
schedule2<-data.frame(minutes,hours)

## objective: create 14*5 grid of activity, start, end, range, and location for schedule.R
#   inputs from concatenate.R @"2014-10-08 12:36:51 CDT"
data.frame(activity,start,end,range,location)
## successful

data.frame(description,start,end,range)
## inputs from "schedule.R" and "concatenate.R"
## returns 2x4 data frame with columns labeled date, description, start, end.


## Oct 7 - what is a good way to generate chessboard coordinates?
boardframe<-data.frame(a=c(rows[1:8]), b=c(rows[1:8]),
                       c=c(rows[1:8]), d=c(rows[1:8]),
                       e=c(rows[1:8]), f=c(rows[1:8]),
                       g=c(rows[1:8]), h=c(rows[1:8]))
## see  PGN_97721646 and concatenate.R
## on rows see vector.R and concatenate.R
## only returns colrow as row within a column. 

## can "row.names" attach a character vector as the row names of a data frame?
##        Can "row.names" attach statevector


AKframe[n,c(1,3)]
ALframe[n,c(1,3)]
ARframe[n,c(1,3)]
AZframe[n,c(1,3)]
CAframe[n,c(1,3)]
COframe[n,c(1,3)]
CTframe[n,c(1,3)]
DEframe[n,c(1,3)]
DCframe[n,c(1,3)]
FLframe[n,c(1,3)]
GAframe[n,c(1,3)]
HIframe[n,c(1,3)]
IDframe[n,c(1,3)]
ILframe[n,c(1,3)]
INframe[n,c(1,3)]
IAframe[n,c(1,3)]
KSframe[n,c(1,3)]
KYframe[n,c(1,3)]
LAframe[n,c(1,3)]
MEframe[n,c(1,3)]
MDframe[n,c(1,3)]
MAframe[n,c(1,3)]
MIframe[n,c(1,3)]
MNframe[n,c(1,3)]
MSframe[n,c(1,3)]
MOframe[n,c(1,3)]
MTframe[n,c(1,3)]
NEframe[n,c(1,3)]
NVframe[n,c(1,3)]
NHframe[n,c(1,3)]
NJframe[n,c(1,3)]
NMframe[n,c(1,3)]
NYframe[n,c(1,3)]
NCframe[n,c(1,3)]
NDframe[n,c(1,3)]
OHframe[n,c(1,3)]
OKframe[n,c(1,3)]
ORframe[n,c(1,3)]
PAframe[n,c(1,3)]
PRframe[n,c(1,3)]
RIframe[n,c(1,3)]
SCframe[n,c(1,3)]
SDframe[n,c(1,3)]
TNframe[n,c(1,3)]
TXframe[n,c(1,3)]
UTframe[n,c(1,3)]
VTframe[n,c(1,3)]
VIframe[n,c(1,3)]
VAframe[n,c(1,3)]
WAframe[n,c(1,3)]
WVframe[n,c(1,3)]
WIframe[n,c(1,3)]
WYframe[n,c(1,3)]
GUframe[n,c(1,3)]
AKframe<-data.frame(rankedsplit[1])
ALframe<-data.frame(rankedsplit[2])
ARframe<-data.frame(rankedsplit[3])
AZframe<-data.frame(rankedsplit[4])
CAframe<-data.frame(rankedsplit[5])
COframe<-data.frame(rankedsplit[6])
CTframe<-data.frame(rankedsplit[7])
DEframe<-data.frame(rankedsplit[8])
DCframe<-data.frame(rankedsplit[9])
FLframe<-data.frame(rankedsplit[10])
GAframe<-data.frame(rankedsplit[11])
HIframe<-data.frame(rankedsplit[12])
IDframe<-data.frame(rankedsplit[13])
ILframe<-data.frame(rankedsplit[14])
INframe<-data.frame(rankedsplit[15])
IAframe<-data.frame(rankedsplit[16])
KSframe<-data.frame(rankedsplit[17])
KYframe<-data.frame(rankedsplit[18])
LAframe<-data.frame(rankedsplit[19])
MEframe<-data.frame(rankedsplit[20])
MDframe<-data.frame(rankedsplit[21])
MAframe<-data.frame(rankedsplit[22])
MIframe<-data.frame(rankedsplit[23])
MNframe<-data.frame(rankedsplit[24])
MSframe<-data.frame(rankedsplit[25])
MOframe<-data.frame(rankedsplit[26])
MTframe<-data.frame(rankedsplit[27])
NEframe<-data.frame(rankedsplit[28])
NVframe<-data.frame(rankedsplit[29])
NHframe<-data.frame(rankedsplit[30])
NJframe<-data.frame(rankedsplit[31])
NMframe<-data.frame(rankedsplit[32])
NYframe<-data.frame(rankedsplit[33])
NCframe<-data.frame(rankedsplit[34])
NDframe<-data.frame(rankedsplit[35])
OHframe<-data.frame(rankedsplit[36])
OKframe<-data.frame(rankedsplit[37])
ORframe<-data.frame(rankedsplit[38])
PAframe<-data.frame(rankedsplit[39])
PRframe<-data.frame(rankedsplit[40])
RIframe<-data.frame(rankedsplit[41])
SCframe<-data.frame(rankedsplit[42])
SDframe<-data.frame(rankedsplit[43])
TNframe<-data.frame(rankedsplit[44])
TXframe<-data.frame(rankedsplit[45])
UTframe<-data.frame(rankedsplit[46])
VTframe<-data.frame(rankedsplit[47])
VIframe<-data.frame(rankedsplit[48])
VAframe<-data.frame(rankedsplit[49])
WAframe<-data.frame(rankedsplit[50])
WVframe<-data.frame(rankedsplit[51])
WIframe<-data.frame(rankedsplit[52])
WYframe<-data.frame(rankedsplit[53])
GUframe<-data.frame(rankedsplit[54])

AKframe[n,c(1,3)]
ALframe[n,c(1,3)]
ARframe[n,c(1,3)]
AZframe[n,c(1,3)]
CAframe[n,c(1,3)]
##AKframe<-data.frame(rankedsplit[1])
##ALframe<-data.frame(rankedsplit[2])
##ARframe<-data.frame(rankedsplit[3])
##AZframe<-data.frame(rankedsplit[4])
##CAframe<-data.frame(rankedsplit[5])
##rankedsplit<-split(ordered_outcome, ordered_outcome$State)
##ordered_outcome<-data.frame(trimmed_outcome[order(trimmed_outcome[,3],-trimmed_outcome[,1]),])
##trimmed_outcome<-data.frame(Hospital.Name=care_outcome[,2],State=care_outcome[,7],Outcome=coltouse)
##n<-1 returns 3 columns (hospital, state, outcome) of the nth row of the specified state


AKframe<-data.frame(rankedsplit[1])
ALframe<-data.frame(rankedsplit[2])
ARframe<-data.frame(rankedsplit[3])
AZframe<-data.frame(rankedsplit[4])
CAframe<-data.frame(rankedsplit[5])
##rankedsplit<-split(ordered_outcome, ordered_outcome$State)
##ordered_outcome<-data.frame(trimmed_outcome[order(trimmed_outcome[,3],-trimmed_outcome[,1]),])
##trimmed_outcome<-data.frame(Hospital.Name=care_outcome[,2],State=care_outcome[,7],Outcome=coltouse)
##returns specific state's hospitals in outcome order
##  alphabetic order *might* work for numerically defined ties,
##  does not work for "Not Available" ties

ordered_outcome<-data.frame(trimmed_outcome[order(trimmed_outcome[,3],-trimmed_outcome[,1]),])
##trimmed_outcome<-data.frame(Hospital.Name=care_outcome[,2],State=care_outcome[,7],Outcome=coltouse)
##returns 4706x3 data frame ranked by 1) outcome and 2) alphabet

ordered_outcome<-data.frame(trimmed_outcome[order(trimmed_outcome[,3]),])
##trimmed_outcome<-data.frame(Hospital.Name=care_outcome[,2],State=care_outcome[,7],Outcome=coltouse)
## returns 4706x3 data frame ranked by outcome

data.frame(as.matrix(trimmed_outcome[order(trimmed_outcome[,3]),],c(1:4706)))
##trimmed_outcome<-data.frame(Hospital.Name=care_outcome[,2],State=care_outcome[,7],Outcome=coltouse)
## returns 4706x3 data frame with 2 warnings

trimmed_outcome<-data.frame(Hospital.Name=care_outcome[,2],State=care_outcome[,7],Outcome=coltouse)
##returns 4706x3 with columns named State, Hospital.Name, and coltouse

data.frame(orderedsplit$AK[1:5],splitcoltouse$AK[1:5])
##orderedsplit <- split (testsorter$Hospital.Name, testsorter$State)
##splitcoltouse <-split(rankcoltouse,care_outcome$State)
##testsorter<-dataframetest[order(dataframetest[,47]),]
##rankcoltouse<-rank(coltouse,na.last=TRUE,ties.method=c("first"))
##returns 5x2: first five Alaska hospitals with their rankings

data.frame(orderedsplit$AK[1],splitcoltouse$AK[1])
##orderedsplit <- split (testsorter$Hospital.Name, testsorter$State)
##splitcoltouse <-split(rankcoltouse,care_outcome$State)
##testsorter<-dataframetest[order(dataframetest[,47]),]
##rankcoltouse<-rank(coltouse,na.last=TRUE,ties.method=c("first"))
##returns PROVIDENCE ALASKA MEDICAL CENTER                 205

data.frame(
  orderedsplit$AL
  orderedsplit$AK
  orderedsplit$AZ
  orderedsplit$AR
  orderedsplit$CA
  orderedsplit$CO
  orderedsplit$CT
  orderedsplit$DE
  orderedsplit$DC
  orderedsplit$FL
  orderedsplit$GA
  orderedsplit$HI
  orderedsplit$ID
  orderedsplit$IL
  orderedsplit$IN
  orderedsplit$IA
  orderedsplit$KS
  orderedsplit$KY
  orderedsplit$LA
  orderedsplit$ME
  orderedsplit$MD
  orderedsplit$MA
  orderedsplit$MI
  orderedsplit$MN
  orderedsplit$MS
  orderedsplit$MO
  orderedsplit$MT
  orderedsplit$NE
  orderedsplit$NV
  orderedsplit$NH
  orderedsplit$NJ
  orderedsplit$NM
  orderedsplit$NY
  orderedsplit$NC
  orderedsplit$ND
  orderedsplit$OH
  orderedsplit$OK
  orderedsplit$OR
  orderedsplit$PA
  orderedsplit$PR
  orderedsplit$RI
  orderedsplit$SC
  orderedsplit$SD
  orderedsplit$TN
  orderedsplit$TX
  orderedsplit$UT
  orderedsplit$VT
  orderedsplit$VI
  orderedsplit$VA
  orderedsplit$WA
  orderedsplit$WV
  orderedsplit$WI
  orderedsplit$WY
  orderedsplit$GU)
  ##orderedsplit <- split (testsorter$Hospital.Name, testsorter$State)
    ##alphebatized this time, not in care_outcome order
  ##testsorter<-dataframetest[order(dataframetest[,47]),]
  ##dataframetest<-data.frame(care_outcome,rankcoltouse)
  ##rankcoltouse<-rank(coltouse,na.last=TRUE,ties.method=c("first"))
## returns errorr: unexpected ')'
## also returns only hospital names, no ranks or rates

data.frame(
  splitcoltouse$AL
  splitcoltouse$AK
  splitcoltouse$AZ
  splitcoltouse$AR
  splitcoltouse$CA
  splitcoltouse$CO
  splitcoltouse$CT
  splitcoltouse$DE
  splitcoltouse$DC
  splitcoltouse$FL
  splitcoltouse$GA
  splitcoltouse$HI
  splitcoltouse$ID
  splitcoltouse$IL
  splitcoltouse$IN
  splitcoltouse$IA
  splitcoltouse$KS
  splitcoltouse$KY
  splitcoltouse$LA
  splitcoltouse$ME
  splitcoltouse$MD
  splitcoltouse$MA
  splitcoltouse$MI
  splitcoltouse$MN
  splitcoltouse$MS
  splitcoltouse$MO
  splitcoltouse$MT
  splitcoltouse$NE
  splitcoltouse$NV
  splitcoltouse$NH
  splitcoltouse$NJ
  splitcoltouse$NM
  splitcoltouse$NY
  splitcoltouse$NC
  splitcoltouse$ND
  splitcoltouse$OH
  splitcoltouse$OK
  splitcoltouse$OR
  splitcoltouse$PA
  splitcoltouse$PR
  splitcoltouse$RI
  splitcoltouse$SC
  splitcoltouse$SD
  splitcoltouse$TN
  splitcoltouse$TX
  splitcoltouse$UT
  splitcoltouse$VT
  splitcoltouse$VI
  splitcoltouse$VA
  splitcoltouse$WA
  splitcoltouse$WV
  splitcoltouse$WI
  splitcoltouse$WY
  splitcoltouse$GU
)
## returns error: unexpected ')'
## also returns only numbers, no state names

ordered_outcome<-trimmed_outcome[with(trimmed_outcome, order(Outcome,-State)),]
##trimmed_outcome<-data.frame(State=care_outcome[,2],Hospital.Name=care_outcome[,7],Outcome=coltouse),levels=(-statevector,ordered=true)
##returns 4706 x 3 ordered by ascending outcome and tie-broken by alphabetic state
## Warning: In Ops.factor(State): - not meaningful for factors

trimmed_outcome[with(trimmed_outcome, order(trimmed_outcome$Outcome,trimmed_outcome$State)),]
##trimmed_outcome<-data.frame(State=care_outcome[,2],Hospital.Name=care_outcome[,7],Outcome=coltouse),levels=(statevector,ordered=true)
##returns 4706 x 3 ordered by ascending outcome and tie-broken by reverse-alphabetic state

trimmed_outcome[with(trimmed_outcome, order(trimmed_outcome$Outcome,trimmed_outcome$State))]
##trimmed_outcome<-data.frame(State=care_outcome[,2],Hospital.Name=care_outcome[,7],Outcome=coltouse),levels=(statevector,ordered=true)
## err: undefined columns

trimmed_outcome[with(trimmed_outcome, order(Outcome,State))]
##trimmed_outcome<-data.frame(State=care_outcome[,2],Hospital.Name=care_outcome[,7],Outcome=coltouse),levels=(statevector,ordered=true)
## err: undefined columns


dd[with(dd, order(-z, b)), ]
##see   http://stackoverflow.com/questions/
##      1296646/how-to-sort-a-dataframe-by-columns-in-r
## returns data frame ordered both as descending z and ascending a

dd<-data.frame(b = factor(c("Hi", "Med", "Hi", "Low"), 
                      levels = c("Low", "Med", "Hi"), ordered = TRUE),
           x = c("A", "D", "A", "C"), y = c(8, 3, 9, 9),
           z = c(1, 1, 1, 2))
##see   http://stackoverflow.com/questions/
##      1296646/how-to-sort-a-dataframe-by-columns-in-r

data.frame(
  State=(care_outcome[,2],),
           Hospital.Name=care_outcome[,7],
           Outcome=coltouse),

data.frame(State=care_outcome[,2],
           Hospital.Name=care_outcome[,7],
           Outcome=coltouse),
levels=(statevector,ordered=true)
##Error: unexpected ',' 

trimmed_outcome<-data.frame(State=care_outcome[,2],Hospital.Name=care_outcome[,7],Outcome=coltouse),levels=(statevector,ordered=true)
##returns 4706x3 with columns named State, Hospital.Name, and coltouse

data.frame(care_outcome[,2], care_outcome[,7],coltouse,rankcoltouse)
##rankcoltouse<-rank(coltouse,na.last=TRUE,ties.method=c("first"))

trimmed_outcome<-data.frame(care_outcome[,2], care_outcome[,7],coltouse)
##returns 4706x3 of H.Name, State, coltouse

trimmed_outcome<-data.frame(care_outcome[,2], care_outcome[,7], care_outcome[,11],care_outcome[,17],care_outcome[,23])
##head(trimmed_outcome) returns 6x5 of H.Name, State, and (H.A. + H.F. + P.) mortality
##see care_outcome in data_input.R

data.frame(care_outcome[,2 & 7])
##returns all columns of care_outcome
##see care_outcome in data_input.R

data.frame(care_outcome[2,7])
##returns "AL"
##see care_outcome in data_input.R

data.frame(care_outcome[,2,7])
##returns 4706x1 of Hospital Names ([,2])
##see care_outcome in data_input.R

data.frame(care_outcome[,2,7,11,17,23])
##returns error for "unused arguments (11,17,23)"
##see care_outcome in data_input.R

dataframetest<-data.frame(care_outcome,rankcoltouse)
##rankcoltouse<-rank(coltouse,na.last=TRUE,ties.method=c("first"))
##head() returns six rows, 47 columns of unranked hospital data

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
##rankcoltouse <-care_outcome[,11]
##head() returns 6X2 State and rankcoltouse

numeric13_14<-data.frame(numeric13,numeric14)
##numeric13<-care_outcome[,13]
##numeric14<-care_outcome[,14]
##returns two columns, mostly of NA.
## care_outcome[,c(13:14)] is far more efficient

dataframetest<-data.frame(care_outcomesubset,rankcoltouse)
## arguments from (data_input.R, subset.R)

dataframetest<-data.frame(care_outcome,rankcoltouse)
## arguments from (data_input.R, rank.R)
## returns 4706x47 dataframe

data.frame(..., row.names = NULL, check.rows = FALSE,
           check.names = TRUE,
           stringsAsFactors = default.stringsAsFactors())

default.stringsAsFactors()