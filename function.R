nobs
for (n in id) {
  subset(
    read.csv(getElement(list.files(), n)), 
    !is.na(read.csv(getElement(list.files(), n))$sulfate) & 
      !is.na(read.csv(getElement(list.files(), n))$nitrate))
}

#@"2014-10-15 21:11:03 CDT"
complete<-function(directory, id){
  setwd("C:\\Users\\Josh\\Documents\\CSV")
  setwd(directory)
  nobs<-nrow(subset(
    read.csv(getElement(list.files(), id)), 
    !is.na(read.csv(getElement(list.files(), id))$sulfate) & 
      !is.na(read.csv(getElement(list.files(), id))$nitrate)))
  data.frame(id, nobs)
}
complete("specdata", 1)
## correct
complete("specdata", c(2, 4, 8, 10, 12))
## Err selects more than 1 element

#@"2014-10-15 20:52:33 CDT"
nobs<-function(directory, id){
  setwd("C:\\Users\\Josh\\Documents\\CSV")
  setwd(directory)
  nrow(subset(
    read.csv(getElement(list.files(), id)), 
    !is.na(read.csv(getElement(list.files(), id))$sulfate) & 
      !is.na(read.csv(getElement(list.files(), id))$nitrate)))
}
# passes id = 1, 2, 4, 8, 10, 12, 30, 29, 28, 27, 26, 25, 3
# still needs to print data frame

#@"2014-10-15 18:36:41 CDT"
complete<-function(directory, id){
  setwd("C:\\Users\\Josh\\Documents\\CSV")
  setwd(directory)
  nrow(
    subset(
      read.csv(getElement(list.files(), id)), 
      !is.na(read.csv(getElement(list.files(), id))$sulfate)
    )
  )
}
complete("specdata", 1)
# [1] 15747
# should be 117

#@"2014-10-15 18:09:35 CDT"
complete<-function(directory, id){
  setwd("C:\\Users\\Josh\\Documents\\CSV")
  setwd(directory)
  nrow(
    subset(
      read.csv(getElement(list.files(), id)), 
      is.na(read.csv(getElement(list.files(), id))$sulfate)
      )
    )
}
complete("specdata", 1)
# [1] 40509
# should be 117

#@"2014-10-15 08:48:45 CDT"
complete<-function(directory, id){
  setwd("C:\\Users\\Josh\\Documents")
  setwd(directory)
  nrow(subset(read.csv(getElement(list.files(), id)), sulfate !="NA"))
}
complete("specdata", 1)
#   [1] 15747
## should be 117

#@"2014-10-15 08:38:07 CDT"
complete<-function(directory, id){
  setwd("C:\\Users\\Josh\\Documents")
  setwd(directory)
  nrow(subset(read.csv(getElement(list.files(), id))), sulfate!="NA")
}
complete("specdata", 1)
#   Err unused argument (sulfate!="NA")

#@"2014-10-15 08:34:33 CDT"
nobs<-function(id){nrow(subset(read.csv(getElement(list.files(), id)), sulfate!="NA"))}
nobs(1)
#   [1] 15747
## incorrect
nobs(2)
#   [1] 1041
## correct

#@"2014-10-15 08:26:50 CDT"
nobs<-function(id){
  nrow(
    subset(
      data.frame(
        read.csv(
          getElement(
            list.files(), id
          )
        )
      ), 
      sulfate != "NA"))}
nobs(2)
#   [1] 1041


#@"2014-10-15 07:58:19 CDT"
pollutantmean<-function(directory, pollutant, id){
  setwd("C:\\Users\\Josh\\Documents")
  setwd(directory)
  doc<-read.csv(getElement(list.files(), id))
  getElement(doc, pollutant)
}
pollutantmean("specdata", "sulfate", 5)
## successful

#@"2014-10-15 07:55:54 CDT"
pollutantmean<-function(directory, pollutant, id){
  setwd("C:\\Users\\Josh\\Documents")
  setwd(directory)
  doc<-read.csv(getElement(list.files(), id))
  pol<-getElement(doc, pollutant)
}
pollutantmean("specdata", "sulfate", 5)
## no errors, but nothing printed

#@"2014-10-15 07:49:22 CDT"
cc<-function(id){
  read.csv(getElement(list.files(), id))
}
cc(001)
## successful
cc(002)
## successful
cc(3)
## successful

#@"2014-10-14 23:55:51 CDT"
b<-function(pollutant){
  getElement(read.csv("001.csv"), pollutant)
}
b("sulfate")
b("nitrate")
## successful


#@"2014-10-14 23:15:39 CDT"
b<-function(pollutant){
  read.csv("001.csv")$pollutant
}
b("sulfate")
b("nitrate")
#   NULL
## unsuccessful

#@"2014-10-14 22:58:43 CDT"
a<-function(directory){
  setwd("C:\\Users\\Josh\\Documents")
  setwd(directory)
}
a("specdata")
## successful

#@"2014-10-14 22:32:52 CDT"
a<-function(directory){setwd(directory)}
a("C:\\Users\\Josh\\Documents\\specdata")
## sets directory if file path is full and specially formatted
a("specdata")
## fails to set directory based on file name

#@"2014-10-13 17:16:07 CDT"
read.csv("001.csv")
## successful

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
RStudio<-subschedule1(" RStudio")
CSV<-subschedule1(" CSV")
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