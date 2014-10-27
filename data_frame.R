
data.frame(Hospital.Name,State,H.A.Mortality,H.F.Mortality,P.Mortality)

#@"2014-10-19 17:10:59 CDT"
data.frame(id, nobs=as.matrix(lapply(id, nobs)))
# id nobs
# 1  1  117
# 2  2 1041

data.frame(as.matrix(lapply(id, nobs)))
# as.matrix.lapply.id..nobs..
# 1                         117
# 2                        1041

#@"2014-10-19 17:07:47 CDT"
data.frame(lapply(id, nobs))
data.frame(as.vector(lapply(id, nobs)))
data.frame(as.list(lapply(id, nobs)))
# X117L X1041L
# 1   117   1041

#@"2014-10-15 21:07:28 CDT"
frm<-data.frame(id, nobs)

#@"2014-10-15 08:11:27 CDT"
data.frame(read.csv("002.csv"), na.rm=TRUE)

#@"2014-10-14 23:18:38 CDT"
data.frame(read.csv("001.csv"))

#@"2014-10-11 16:46:15 CDT"
## test for Subset.R"2014-10-11 16:43:22 CDT"
data.frame(read.csv("testschedule.txt"))
data.frame(read.csv("testschedule.txt"))$location

## merge CSV files into nrow*4 data frame for schedule.$
data.frame(read.csv("activity.txt")$activity,read.csv("start.txt")$start,read.csv("end.txt")$end,read.csv("location.txt")$location)

## merge CSV files into nrow*4 data frame for schedule.R
data.frame(read.csv("activity.txt"),read.csv("start.txt"),read.csv("end.txt"),read.csv("location.txt"))
## unsuccuessful - returns nrow*8 data frame, with 4 columns of NA.

## select a row from the schedule dataframe
schedule[2,]
schedule[5,]
#   successful

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

GUframe[n,c(1,3)]
GUframe<-data.frame(rankedsplit[54])

AKframe[n,c(1,3)]
##AKframe<-data.frame(rankedsplit[1])
##rankedsplit<-split(ordered_outcome, ordered_outcome$State)
##ordered_outcome<-data.frame(trimmed_outcome[order(trimmed_outcome[,3],-trimmed_outcome[,1]),])
##trimmed_outcome<-data.frame(Hospital.Name=care_outcome[,2],State=care_outcome[,7],Outcome=coltouse)
##n<-1 returns 3 columns (hospital, state, outcome) of the nth row of the specified state

AKframe<-data.frame(rankedsplit[1])
##rankedsplit<-split(ordered_outcome, ordered_outcome$State)
##ordered_outcome<-data.frame(trimmed_outcome[order(trimmed_outcome[,3],-trimmed_outcome[,1]),])
##trimmed_outcome<-data.frame(Hospital.Name=care_outcome[,2],State=care_outcome[,7],Outcome=coltouse)
##returns specific state's hospitals in outcome order
##  alphabetic order *might* work for numerically defined ties,
##  does not work for "Not Available" ties

##trimmed_outcome<-data.frame(Hospital.Name=care_outcome[,2],State=care_outcome[,7],Outcome=coltouse)
data.frame(as.matrix(trimmed_outcome[order(trimmed_outcome[,3]),],c(1:4706))) # 4706x3
ordered_outcome<-data.frame(trimmed_outcome[order(trimmed_outcome[,3]),]) # 4706x3 
ordered_outcome<-data.frame(trimmed_outcome[order(trimmed_outcome[,3],-trimmed_outcome[,1]),]) # 4706x3 ranked by 1) outcome 2) alphabet

trimmed_outcome<-data.frame(Hospital.Name=care_outcome[,2],State=care_outcome[,7],Outcome=coltouse)
##returns 4706x3 with columns named State, Hospital.Name, and coltouse

##orderedsplit <- split (testsorter$Hospital.Name, testsorter$State)
##splitcoltouse <-split(rankcoltouse,care_outcome$State)
##testsorter<-dataframetest[order(dataframetest[,47]),]
##rankcoltouse<-rank(coltouse,na.last=TRUE,ties.method=c("first"))
data.frame(orderedsplit$AK[1],splitcoltouse$AK[1]) # PROVIDENCE ALASKA MEDICAL CENTER                 205
data.frame(orderedsplit$AK[1:5],splitcoltouse$AK[1:5]) # 5x2: Alaska hospitals & rankings

ordered_outcome<-trimmed_outcome[with(trimmed_outcome, order(Outcome,-State)),]
##trimmed_outcome<-data.frame(State=care_outcome[,2],Hospital.Name=care_outcome[,7],Outcome=coltouse),levels=(-statevector,ordered=true)
# 4706 x 3 ordered by ascending outcome and tie-broken by alphabetic state

trimmed_outcome[with(trimmed_outcome, order(trimmed_outcome$Outcome,trimmed_outcome$State)),]
##trimmed_outcome<-data.frame(State=care_outcome[,2],Hospital.Name=care_outcome[,7],Outcome=coltouse),levels=(statevector,ordered=true)
# 4706 x 3 ascending outcome, and tie-broken by reverse-alphabetic state

dd[with(dd, order(-z, b)), ] ## http://stackoverflow.com/questions/1296646/how-to-sort-a-dataframe-by-columns-in-r
## descending z then ascending a

dd<-data.frame(b = factor(c("Hi", "Med", "Hi", "Low"), 
                      levels = c("Low", "Med", "Hi"), ordered = TRUE),
           x = c("A", "D", "A", "C"), y = c(8, 3, 9, 9),
           z = c(1, 1, 1, 2))
## http://stackoverflow.com/questions/1296646/how-to-sort-a-dataframe-by-columns-in-r

data.frame(
  State=(care_outcome[,2],),
           Hospital.Name=care_outcome[,7],
           Outcome=coltouse),

data.frame(State=care_outcome[,2],
           Hospital.Name=care_outcome[,7],
           Outcome=coltouse),

trimmed_outcome<-data.frame(State=care_outcome[,2],Hospital.Name=care_outcome[,7],Outcome=coltouse),levels=(statevector,ordered=true) # 4706x3 State, Hospital.Name, coltouse

data.frame(care_outcome[,2], care_outcome[,7],coltouse,rankcoltouse) ##rankcoltouse<-rank(coltouse,na.last=TRUE,ties.method=c("first"))

trimmed_outcome<-data.frame(care_outcome[,2], care_outcome[,7],coltouse) # H.Name, State, coltouse

trimmed_outcome<-data.frame(care_outcome[,2], care_outcome[,7], care_outcome[,11],care_outcome[,17],care_outcome[,23])
# H.Name, State, and (H.A. + H.F. + P.) mortality

data.frame(care_outcome[,2 & 7]) # all columns

data.frame(care_outcome[2,7]) # "AL"

data.frame(care_outcome[,2,7]) # 4706x1 Hospital Names ([,2])

##rankcoltouse<-rank(coltouse,na.last=TRUE,ties.method=c("first"))
dataframetest<-data.frame(care_outcome,rankcoltouse) # 6*47 unranked data frame

##b<-as.matrix(split(care_outcome[,11], care_outcome$State))[1]
##a<-as.matrix(split(care_outcome$Hospital.Name, care_outcome$State))[1]
data.frame(a,b) # 17x2 : Alaskan hospitals & mortality rates
data.frame(b,a) # 17x2 : mortality rates &r Alaskan hospitals

dataframestate<-data.frame(care_outcome[,7],rankcoltouse)

numeric13_14<-data.frame(numeric13,numeric14) ## care_outcome[,c(13:14)] is far more efficient

dataframetest<-data.frame(care_outcomesubset,rankcoltouse)##data_input.R, subset.R
dataframetest<-data.frame(care_outcome,rankcoltouse) #4706x47 ##data_input.R, rank.R
