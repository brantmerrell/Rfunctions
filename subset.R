## subset "R Programming rows from schedule dataframe
subset(schedule,schedule$activity=="R Programming")
# successful

## subset "R Programming rows from schedule dataframe
subset(schedule,subset=="R Programming", select=schedule$activity)
#   Err comparison (1) possible only for attomic and list types

## subset "R Programming rows from schedule dataframe
subset(schedule,subset=="R Programming")
#   Err comparison (1) possible only for attomic and list types

## subset "R Programming" rows from schedule dataframe
subset(schedule$activity,subset="R Programming")
#   Err subset must be logical

## subset "R Programming" rows from schedule dataframe
subset(schedule$activity,"R Programming")
#   Err subset must be logical

## subset "R Programming" rows from schedule dataframe
subset(schedule,"R Programming" %in% schedule$activity)
# unsuccessful - returns entire schedule dataframe.

subset(rankedsplit, rankedsplit[1])
##rankedsplit<-split(ordered_outcome, ordered_outcome$State)
##ordered_outcome<-data.frame(trimmed_outcome[order(trimmed_outcome[,3],-trimmed_outcome[,1]),])
##trimmed_outcome<-data.frame(Hospital.Name=care_outcome[,2],State=care_outcome[,7],Outcome=coltouse)
##see coltouse in control.R
##see care_outcome in data_input.R
##returns err subset must be logical


subset(rankedsplit$AK)
##rankedsplit<-split(ordered_outcome, ordered_outcome$State)
##ordered_outcome<-data.frame(trimmed_outcome[order(trimmed_outcome[,3]),])
##trimmed_outcome<-data.frame(Hospital.Name=care_outcome[,2],State=care_outcome[,7],Outcome=coltouse)
##see coltouse in control.R
##see care_outcome in data_input.R
## returns 17x3 data frame of AK hospitals ranked by 1) Outcome and 2) care_outcome.csv

subset(rankedsplit, State=="AK")
##rankedsplit<-split(ordered_outcome, ordered_outcome$State)
##ordered_outcome<-data.frame(trimmed_outcome[order(trimmed_outcome[,3]),])
##trimmed_outcome<-data.frame(Hospital.Name=care_outcome[,2],State=care_outcome[,7],Outcome=coltouse)
##see coltouse in control.R
##see care_outcome in data_input.R
## returns error: object 'State' not found
## note: dimensions null after spliting ordered_outcome

subset(data.frame(a,b), data.frame(a,b)[1])
##b<-as.matrix(split(care_outcome[,11], care_outcome$State))[1]
##a<-as.matrix(split(care_outcome$Hospital.Name, care_outcome$State))[1]
##returns error: subset must be logical

subset(data.frame(a,b)[,1], data.frame(a,b)[1])
##b<-as.matrix(split(care_outcome[,11], care_outcome$State))[1]
##a<-as.matrix(split(care_outcome$Hospital.Name, care_outcome$State))[1]
##returns error: subset must be logical

##rankhospital Combine care_outcome with 
care_outcomesubset<-subset(care_outcome, care_outcome[,7]=="TX")

## rankall.R subset file based on Arkansas
H_AK<-subset(care_outcome$Hospital.Name, care_outcome[,7]=='TX')

## rankall.R
subset(care_outcome, care_outcome[,7]=='TX')
## returns error because arguments must be the same length

## best.R Subset all hospitals (in specified state) 
## that match the lowest 30-day mortality rate
besthospitals <- subset(care_outcome, coltouse==bestscore)
##bestscore<-min(coltouse,na.rm=TRUE)
##returns all columns and 1 row of lowest coltouse score

TXsubset <- subset(care_outcome$Hospital.Name, care_outcome$State=="TX")
##returns 370 TX hospitals

TXsubset <- subset(care_outcome, care_outcome$State=="TX", Hospital.Name)
##returns 4706-3894 TX hospitals

##best.R Subset file based on state
care_outcome<-subset(care_outcome, care_outcome[,7]==state)
##head() returns 3899-3894 rows, 27 columns of TX hospitals

subset(x, ...)

## Default S3 method:
subset(x, subset, ...)

## S3 method for class 'matrix'
subset(x, subset, select, drop = FALSE, ...)

## S3 method for class 'data.frame'
subset(x, subset, select, drop = FALSE, ...)