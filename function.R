pollutantmean<-function(directory,pollutant,id=1:332){}

subschedule1<-function(input){subset(schedule,schedule$activity==input)}
# subschedule1("R_Programming") successful

subschedule2<-function(input1,input2){
  subset(
    schedule,subset = (as.POSIXct(schedule$start) >= input1 
                       & as.POSIXct(schedule$start) <= input2)
  )
}
# subschedule2("2014-10-07 21:38:00 CDT","2014-10-08 21:11:33 CDT")
# 