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