#@"2014-10-11 19:07:40 CDT"
subschedule1<-function(input){subset(schedule,schedule$activity==c(" ", "input"))}
subschedule1("RStudio")
## unsuccessful

#@"2014-10-11 18:58:42 CDT"
subschedule1<-function(input){
  subset(
    schedule, (schedule$activity==input) | 
      (schedule$activity== input)
  )
}
subschedule1(" RStudio")
## successful
subschedule1("RStudio")
## unsuccessful

#@"2014-10-11 18:56:37 CDT"
subschedule1<-function(input){subset(schedule,schedule$activity=="input")}
subschedule1(" RStudio")
## unsuccessful

#@"2014-10-11 18:49:57 CDT"
subschedule1<-function(input){subset(schedule,schedule$activity==input)}
subschedule1(" RStudio")
## successful

#@"2014-10-11 15:38:21 CDT"
subschedule1<-function(input){subset(schedule,schedule$activity==input)}
subschedule1("Rstudio")
#   <0 rows>

#@"2014-10-11 15:36:41 CDT"
subschedule1<-function(input){subset(schedule,schedule$activity==input)}
subschedule1("RStudio")
#   <0 rows>

#@"2014-10-11 15:35:16 CDT"
subschedule1<-function(input){subset(schedule,schedule$activity==input)}
subschedule1("RStudio")
#   <0 rows>

#@"2014-10-11 15:28:15 CDT"
subschedule2<-function(input1,input2){
  subset(
    schedule,subset = (as.POSIXct(schedule$start) >= input1 
                       & as.POSIXct(schedule$start) <= input2)
  )
}
subschedule2("2014-10-07 21:38:00 CDT","2014-10-08 21:11:33 CDT")
#   returns [55:85]x6 data frame with dim=NULL