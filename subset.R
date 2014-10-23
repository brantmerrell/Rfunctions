subset(
  read.csv(getElement(list.files(), id)), 
  !is.na(read.csv(getElement(list.files(), id))$sulfate ) &
    !is.na(read.csv(getElement(list.files(), id))$nitrate))
#   Err ID not found

#@"2014-10-15 08:13:26 CDT"
subset(data.frame(read.csv("002.csv"), sulfate != NA))
#   Err sulfate not found

#@"2014-10-11 18:51:24 CDT"
subset(schedule,schedule$activity==(" CSV" | "CSV"))
#   Err operations are possible only for numeric, logical or complex types

#@"2014-10-11 18:16:24 CDT"
## undo subset.R"2014-10-11 16:49:15 CDT" using "colspace" dicovery (list.R"2014-10-11 17:49:52 CDT")
## return testschedule to full schedule size

#@"2014-10-11 18:09:45 CDT"
## repeat subset.R"2014-10-11 17:05:48 CDT" using "colspace" dicovery (list.R"2014-10-11 17:49:52 CDT")
## try converting the testschedule data frame to a matrix
subset(schedule,schedule$activity=="CSV")
#   Err $ invalid for atomic vectors

#@"2014-10-11 17:32:12 CDT"
## try converting each such vector column to a list (list.R)
# mixed results @"2014-10-11 17:35:20 CDT"
# discovery @"2014-10-11 17:49:52 CDT"

#@"2014-10-11 17:15:40 CDT"
# Theory @"2014-10-11 16:58:32 CDT" withstands conversion of columns to vectors

#@"2014-10-11 16:58:32 CDT"
## Theory: for data frames read from txt files, subset() only works on columns that are located as the first column of their txt files.

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