pollutantmean<-function(directory, pollutant, id=1:332){
  setwd("C:/Users/Josh/Documents/CSV")
  setwd(directory)
  count.nitrate<-function(n){
    length(subset(read.csv(getElement(Sys.glob("*csv"),n))$nitrate,
                  !is.na(read.csv(getElement(Sys.glob("*csv"),n))$nitrate)))
  }
  count.sulfate<-function(n){
    length(subset(read.csv(getElement(Sys.glob("*csv"),n))$sulfate,
                  !is.na(read.csv(getElement(Sys.glob("*csv"),n))$sulfate)))
  }
  sum.nitrate<-function(n){
    sum(read.csv(getElement(Sys.glob("*csv"),n))$nitrate,na.rm=TRUE)
  }
  sum.sulfate<-function(n){
    sum(read.csv(getElement(Sys.glob("*csv"),n))$sulfate,na.rm=TRUE)
  }
  extraction<-data.frame(count_N=as.matrix(lapply(id, count.nitrate)),
                         count_S=as.matrix(lapply(id, count.sulfate)),
                         sum_N=as.matrix(lapply(id, sum.nitrate)),
                         sum_S=as.matrix(lapply(id, sum.sulfate)))
  mean.nitrate<-(sum(as.numeric(extraction$sum_N))/
                   sum(as.numeric(extraction$count_N)))
  mean.sulfate<-(sum(as.numeric(extraction$sum_S))/
                   sum(as.numeric(extraction$count_S)))
  if (toupper(pollutant)=="NITRATE"){
    return(mean.nitrate)
  }
  if (toupper(pollutant)=="SULFATE"){
    return(mean.sulfate)
  }
}