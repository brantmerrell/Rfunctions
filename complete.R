complete<-function(directory, id=1:332){
  setwd("C:/Users/Josh/Documents/CSV")
  setwd(directory)
  nob<-function(n){
    nrow(
      subset(read.csv(getElement(Sys.glob("*csv"),n)),
             !is.na(read.csv(getElement(Sys.glob("*csv"),n))$nitrate) &
               !is.na(read.csv(getElement(Sys.glob("*csv"),n))$sulfate)))
  }
  complete_frame<-data.frame(id=as.matrix(id),
             nobs=as.matrix(lapply(id, nob)))
}