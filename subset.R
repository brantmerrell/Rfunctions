"2014-10-15 08:17:30 CDT"
subset(data.frame(read.csv("002.csv")), sulfate != "NA")
#   3418 2010-05-11  3.5700  0.5240  2

#@"2014-10-15 08:16:29 CDT"
subset(data.frame(read.csv("002.csv")), sulfate == "NA")
#   <0 rows> (or 0-length row.names)

#@"2014-10-15 08:15:35 CDT"
subset(data.frame(read.csv("002.csv")), sulfate == NA)
#   <0 rows> (or 0-length row.names)

#@"2014-10-15 08:14:46 CDT"
subset(data.frame(read.csv("002.csv")), sulfate != NA)
#   <0 rows> (or 0-length row.names)

#@"2014-10-15 08:13:26 CDT"
subset(data.frame(read.csv("002.csv"), sulfate != NA))
#   Err sulfate not found

#@"2014-10-11 18:53:08 CDT"
subset(schedule, (schedule$activity=="CSV") | (schedule$activity==" CSV"))
successful

#@"2014-10-11 18:51:24 CDT"
subset(schedule,schedule$activity==(" CSV" | "CSV"))
#   Err operations are possible only for numeric, logical or complex types

#@"2014-10-11 18:31:04 CDT"
## use schedule.txt rather than testschedule.txt
subset(schedule,schedule$activity==" CSV")
## successful
subset(schedule,schedule$activity==" RStudio")
## successful
subset(schedule,schedule$start=="2014-10-11 18:37:57 CDT")
## successful
subset(schedule,schedule$end=="2014-10-11 18:37:57 CDT")
## successful

#@"2014-10-11 18:16:24 CDT"
## undo subset.R"2014-10-11 16:49:15 CDT" using "colspace" dicovery (list.R"2014-10-11 17:49:52 CDT")
## return testschedule to full schedule size
subset(schedule,schedule$activity=="CSV")
## successful
subset(schedule,schedule$start==" 2014-10-11 15:08:53 CDT")
## successful
subset(schedule,schedule$end==" 2014-10-11 15:16:46 CDT")
## successful
subset(schedule,schedule$location==" apt")
## successful

#@"2014-10-11 18:09:45 CDT"
## repeat subset.R"2014-10-11 17:05:48 CDT" using "colspace" dicovery (list.R"2014-10-11 17:49:52 CDT")
## try converting the testschedule data frame to a matrix
subset(schedule,schedule$activity=="CSV")
#   Err $ invalid for atomic vectors
subset(schedule,schedule[,1]=="CSV")
## successful
subset(schedule,schedule[,2]==" 2014-10-11 15:08:53 CDT")
## successful

#@"2014-10-11 18:02:10 CDT"
## repeat subset.R"2014-10-11 17:15:40 CDT" using "colspace" dicovery (list.R"2014-10-11 17:49:52 CDT")
## try converting each column of the data frame to a vector (vector.R"2014-10-11 17:17:32 CDT")
subset(schedule, activity=="CSV")
## successful
subset(schedule, start==" 2014-10-11 15:08:53 CDT")
## successful
subset(schedule, schedule$end==" 2014-10-11 15:16:46 CDT")
## successful
subset(schedule, schedule$location==" locatest")
## successful

#@"2014-10-11 17:32:12 CDT"
## try converting each such vector column to a list (list.R)
# mixed results @"2014-10-11 17:35:20 CDT"
# discovery @"2014-10-11 17:49:52 CDT"

#@"2014-10-11 17:15:40 CDT"
## try converting each column of the data frame to a vector (vector.R"2014-10-11 17:17:32 CDT")
subset(schedule, activity=="CSV")
## successful
subset(schedule, start=="2014-10-11 15:08:53 CDT")
#   <0 rows> (or 0-length row.names)
subset(schedule, schedule$end=="2014-10-11 15:16:46 CDT")
#   <0 rows> (or 0-length row.names)
schedule$location=="SMU"
#   <0 rows> (or 0-length row.names)
# Theory @"2014-10-11 16:58:32 CDT" withstands conversion of columns to vectors

#@"2014-10-11 17:05:48 CDT"
## try converting the testschedule data frame to a matrix
subset(schedule,schedule$activity=="CSV")
#   Err $ invalid for atomic vectors
subset(schedule,schedule[,1]=="CSV")
## successful
subset(schedule,schedule[,2]=="2014-10-11 15:08:53 CDT")
## unsuccessful

#@"2014-10-11 16:58:32 CDT"
## try rewriting testschedule.txt such that $activity is column 1.
subset(schedule,schedule$activity=="CSV")
## successful
subset(schedule,schedule$location=="SMU")
#   <0 rows> (or 0-length row.names)
subset(schedule,schedule$start=="2014-10-11 15:08:53 CDT")
#   <0 rows> (or 0-length row.names)
## Theory: for data frames read from txt files, subset() only works on columns
## that are located as the first column of their txt files.

#@"2014-10-11 16:49:15 CDT"
## try rewriting the first six rows of testschedule.txt
subset(schedule,schedule$activity=="CSV")
#   <0 rows> (or 0-length row.names)
subset(schedule,schedule$start=="2014-10-11 15:08:53 CDT")
## successful
subset(schedule,schedule$end=="2014-10-11 15:16:46 CDT")
#   <0 rows> (or 0-length row.names)
subset(schedule,schedule$location=="apt")
#   <0 rows> (or 0-length row.names)

#@"2014-10-11 16:43:22 CDT"
## try reading testschedule.txt directly into data frame
subset(data.frame(read.csv("testschedule.txt")), data.frame(read.csv("testschedule.txt"))$location=="SMU")
#   <0 rows> (or 0-length row.names)

#@"2014-10-11 16:40:54 CDT"
## try reading from testschedule.txt (Data_input.R)
subset(schedule,schedule$location=="SMU")
#   <0 rows> (or 0-length row.names)

#@"2014-10-11 16:37:49 CDT" (Data_input.R)
## try reverting all read.csv objects in schedule to pre-schedule.txt format
subset(schedule,schedule$location=="SMU")
## successful

#@"2014-10-11 16:34:21 CDT"
## try subsetting different column
subset(schedule,schedule$location=="SMU")
#   <0 rows> (or 0-length row.names)

#@"2014-10-11 16:32:55 CDT"
## try removing 'minutes' and 'hours' variables from schedule dataframe.
subset(schedule,schedule$activity=="RStudio")
#   <0 rows> (or 0-length row.names)

#@"2014-10-11 16:31:07 CDT"
subset(schedule,class(activity)=="factor")
#   87x6

#@"2014-10-11 16:29:41 CDT"
subset(schedule,activity=="chess.com")
#   <0 rows> (or 0-length row.names)

#@"2014-10-11 16:24:30 CDT"
subset(schedule,schedule$activity=="chess.com")
#   <0 rows> (or 0-length row.names)

#@"2014-10-11 16:17:02 CDT"
subset(schedule,as.vector(activity)=="RStudio")
#   <0 rows> (or 0-length row.names)

#@"2014-10-11 16:08:17 CDT"
subset(schedule,activity=="RStudio")
#   <0 rows> (or 0-length row.names)

#@"2014-10-11 16:07:46 CDT"
subset(schedule,activity==RStudio)
#   Err 'Rstudio' not found

#@"2014-10-11 15:40:28 CDT"
subset(schedule,schedule$activity==RStudio)
#   Err 'Rstudio' not found

#@"2014-10-11 15:39:18 CDT"
subset(schedule,schedule$activity==Rstudio)
#   Err 'Rstudio' not found

subset(schedule,subset = (schedule$start > input1 & schedule$start < input2))

## subset "R Programming rows from schedule.R dataframe
subset(schedule,activity=="R_Programming")

## subset "R Programming rows from schedule.R dataframe
subset(schedule,activity=="R Programming")
#   [1] activity start    end      location minutes 
#   <0 rows> (or 0-length row.names)

## subset "R Programming" rows from schedule dataframe
subset(schedule2,schedule$activity=="R Programming")

## subset "R Programming" rows from schedule.R dataframe
subset(schedule,schedule$activity=="R Programming")
# successful - but quit working when schedule.R data was converted to CSV

## subset "R Programming" rows from schedule dataframe
subset(schedule,subset=="R Programming", select=schedule$activity)
#   Err comparison (1) possible only for attomic and list types

## subset "R Programming" rows from schedule dataframe
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