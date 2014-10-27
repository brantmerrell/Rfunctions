splitandframe<-function(m,n){
  data.frame(Author=subset(Author, column==unique(column)[n]), 
             Organization=subset(Organization, column==unique(column)[n]), 
             Date=subset(Date, column==unique(column)[n]), 
             From=subset(From, column==unique(column)[n]))}

splitandframe<-function(column,n){
  data.frame(Author=subset(Author, column==unique(column)[n]), 
             Organization=subset(Organization, column==unique(column)[n]), 
             Date=subset(Date, column==unique(column)[n]), 
             From=subset(From, column==unique(column)[n]))}

effectivesplit<-function(n){
  data.frame(Author=subset(Author, From==unique(From)[n]), 
             Organization=subset(Organization, From==unique(From)[n]), 
             Date=subset(Date, From==unique(From)[n]), 
             From=subset(From, From==unique(From)[n]))}

corr<-function(directory, threshold){
  setwd(directory)
  complete<-function(file){nrow(subset(
    read.csv(file),
    is.na(getElement(read.csv(file), 2)) &
    is.na(getElement(read.csv(file), 3))))}
  complete("001.csv")
  corrsingle<-function(n){
    file<-read.csv(getElement(list.files(), n))
    complete<-subset(
      file, 
      !is.na(getElement(file, 2)) & 
        !is.na(getElement(file,3)))
    cor(complete[,2], complete[,3])
  }
  completes<-as.matrix(lapply(list.files(), complete))
  thresh<-as.matrix(subset(data.frame(list.files(), completes), completes>=threshold))
  lapply(thresh, corrsingle)
}
threshold<-1000
setwd("C:\\Users\\Josh\\Documents\\CSV\\Specdata")
## 'threshold' is a numeric vector of length 1 indicating the
## number of completely observed observations (on all
## variables) required to compute the correlation between
## nitrate and sulfate; the default is 0
threshsubset<-function(directory, threshold){
  setwd(directory)
  complete<-function(file){nrow(subset(
    read.csv(file), 
    !is.na(getElement(read.csv(file), 2)) & 
      !is.na(getElement(read.csv(file), 3))))}
  completes<-as.matrix(lapply(list.files(),complete))
  subset(data.frame(list.files(), completes), completes>=threshold)
}
threshold<-1000
threshsubset("specdata", 400)
# Error in object[[name, exact = TRUE]] : subscript out of bounds 
#@"2014-10-23 23:02:18 CDT"

setwd("C:\\Users\\Josh\\Documents\\CSV")
corrsingle<-function(directory, id){  
  setwd(directory)
  file<-read.csv(getElement(list.files(), id))
  complete<-subset(
    file, 
    !is.na(getElement(file, 2)) & 
      !is.na(getElement(file,3)))
  cor(complete[,2], complete[,3])
}
id<-2
corrsingle("C:\\Users\\Josh\\Documents\\CSV\\specdata", 1) # -0.2225526
corrsingle("specdata", 2) # -0.01895754
corrsingle("specdata", 3) # -0.1405125
#@"2014-10-23 22:20:05 CDT"

testquotes<-function(document){
  setwd("C:\\Users\\Josh\\Documents\\CSV")
  tail(read.csv(document, quote="",row.names=NULL, stringsAsFactors=FALSE))
}
testquotes("quotes.txt")

testcsv<-function(document,n){
  setwd("C:\\Users\\Josh\\Documents\\CSV")
  tail(read.csv(document, row.names=NULL), n)
}
testcsv("subset.txt")
testcsv("subseterrors.txt")
testcsv("articles.txt", 3)
testcsv("coursera tasks.txt", 34)

#@"2014-10-20 12:16:20 CDT"
complete<-function(directory, id){
  setwd("C:\\Users\\Josh\\Documents\\CSV")
  setwd(directory)
  read<-function(id){getElement(list.files(), id)} 
  files<-lapply(id, read)
  nob<-function(id){
    nrow(subset(
      read.csv(getElement(list.files(), id)), 
      !is.na(read.csv(getElement(list.files(), id))$sulfate) & 
        !is.na(read.csv(getElement(list.files(), id))$nitrate)))
  }
  data.frame(id, nobs=as.matrix(lapply(id, nob)))
}

#@"2014-10-19 18:48:15 CDT"
complete<-function(directory, id){
  setwd("C:\\Users\\Josh\\Documents\\CSV")
  setwd(directory)
  read<-function(id){getElement(list.files(), id)}
  files<-lapply(id, read)
  nob<-function(id){
    nrow(subset(
      read.csv(getElement(list.files(), id)), 
      !is.na(read.csv(getElement(list.files(), id))$sulfate) & 
        !is.na(read.csv(getElement(list.files(), id))$nitrate)))
  }
  lapply(files, nob)
}
complete("specdata", 2)
# Err subscript out of bounds

#@"2014-10-19 17:57:50 CDT"
read<-function(id){read.csv(getElement(list.files(), id))}

#@"2014-10-19 17:38:08 CDT"
complete<-function(directory, id){
  setwd("C:\\Users\\Josh\\Documents\\CSV")
  setwd(directory)
  nobs<-function(directory, id){
    nrow(subset(
      read.csv(getElement(list.files(), id)),
      !is.na(read.csv(getElement(list.files(), id))$sulfate) &
         !is.na(read.csv(getElement(list.files(), id))$nitrate))) 
  }
  for (n in id) {
    rslt <-  nob(directory, n)
    print(nob (directory, n))
  }
  data.frame(id, nobs=as.matrix(lapply(id, nobs)))
}
complete("specdata", 1) # [1] 117 WARNING
complete("specdata", 1:2) # Err 
complete("specdata", c(1,2))

#@"2014-10-19 17:12:18 CDT"
complete<-function(directory, id){
  setwd("C:\\Users\\Josh\\Documents\\CSV")
  setwd(directory)
  nobs<-function(directory, id){
    nrow(subset(
      read.csv(getElement(list.files(), id)), 
      !is.na(read.csv(getElement(list.files(), id))$sulfate) & 
        !is.na(read.csv(getElement(list.files(), id))$nitrate)))
  }
  for (n in id) {
    rslt <-  nob(directory, n)
    print(nob (directory, n))
  }
  #  data.frame(id = as.vector(id), nobs = as.vector(nob(directory, id)))
}
complete("specdata", c(1,2))

  cbind(id, nobs)
}
nobs(2)
complete(2)
id<-2

complete<-function(directory, id){
  setwd("C:\\Users\\Josh\\Documents\\CSV")
  setwd(directory)
  nob<-function(directory, id){
    nrow(subset(
      read.csv(getElement(list.files(), id)), 
      !is.na(read.csv(getElement(list.files(), id))$sulfate) & 
        !is.na(read.csv(getElement(list.files(), id))$nitrate)))
  }
  for (n in id) {
    rslt <-  nob(directory, n)
    print(nob (directory, n))
  }
  #  data.frame(id = as.vector(id), nobs = as.vector(nob(directory, id)))
}
complete("specdata", c(1,2))

#@"2014-10-18 23:56:04 CDT"
multiples<-function(id, n){
  data.frame(id,n)
}
multiples(c(1,3,5), c(2,4,6))
## successful

#@"2014-10-18 23:44:52 CDT"
complete<-function(directory, id){
  setwd("C:\\Users\\Josh\\Documents\\CSV")
  setwd(directory)
  nob<-function(directory, id){
    nrow(subset(
      read.csv(getElement(list.files(), id)), 
      !is.na(read.csv(getElement(list.files(), id))$sulfate) & 
        !is.na(read.csv(getElement(list.files(), id))$nitrate)))
  }
  for (n in id) {
    nobs <-  nob(directory, n)
    print(c(id,nobs (directory, n)))
  }
  #  data.frame(id = as.vector(id), nobs = as.vector(nob(directory, id)))
}
complete("specdata", c(1,2))
# Err subscript out of bounds

#@"2014-10-18 23:23:15 CDT"
complete<-function(id){
  nobs<-nrow(subset(read.csv(getElement(list.files(),id)),
              !is.na(read.csv(getElement(list.files(),id))$sulfate) &
                !is.na(read.csv(getElement(list.files(), id))$nitrate)))
  frame<-data.frame(id,nobs)
  for (n in id) {
    rslt <- nrow(subset(read.csv(getElement(list.files(),n)),
                        !is.na(read.csv(getElement(list.files(),n))$sulfate) &
                          !is.na(read.csv(getElement(list.files(),n))$nitrate)))
    frame<-data.frame(n,rslt)
  }
  print(frame)
}
## complete(integer) works, complete(vector) doesn't


#@"2014-10-18 23:15:51 CDT"
complete<-function(directory, id){
  setwd("C:\\Users\\Josh\\Documents\\CSV")
  setwd(directory)
  for (n in id) {
    rslt <- nrow(subset(read.csv(getElement(list.files(),n)),
                        !is.na(read.csv(getElement(list.files(),n))$sulfate) & 
                          !is.na(read.csv(getElement(list.files(), n))$nitrate)))
    
  }
  data.frame(id,rslt)
}
complete("specdata", c(1,2))
#  1 1041
#  2 1041
## unsuccessful

#@"2014-10-18 23:07:37 CDT"
complete<-function(directory, id){
  setwd("C:\\Users\\Josh\\Documents\\CSV")
  setwd(directory)
  nob<-function(id){
    nrow(subset(
      read.csv(getElement(list.files(), id)), 
      !is.na(read.csv(getElement(list.files(), id))$sulfate) & 
        !is.na(read.csv(getElement(list.files(), id))$nitrate)))
  }
  for (n in id) {
    rslt <-  nob(n)
    
#     print(nob (directory, n))
    data.frame(nob,id)
  }
  #  data.frame(id = as.vector(id), nobs = as.vector(nob(directory, id)))
}
complete("specdata", c(1,2))
# Err cannot coerce class function to data frame

#@"2014-10-15 22:15:09 CDT"
complete<-function(directory, id){
  setwd("C:\\Users\\Josh\\Documents\\CSV")
  setwd(directory)
  nob<-function(directory, id){
    nrow(subset(
      read.csv(getElement(list.files(), id)), 
      !is.na(read.csv(getElement(list.files(), id))$sulfate) & 
      !is.na(read.csv(getElement(list.files(), id))$nitrate)))
  }
  for (n in id) {
   rslt <-  nob(directory, n)
   print(nob (directory, n))
  }
#  data.frame(id = as.vector(id), nobs = as.vector(nob(directory, id)))
}
complete("specdata", c(1,2))

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
# [1] 117 after correcting CSV, thus correct
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