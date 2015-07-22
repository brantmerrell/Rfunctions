corr<-function(directory="specdata", threshold=0){
  setwd(directory)
  nob<-function(n){
    nrow(
      subset(read.csv(getElement(Sys.glob("*csv"),n)),
             !is.na(read.csv(getElement(Sys.glob("*csv"),n))$nitrate) &
               !is.na(read.csv(getElement(Sys.glob("*csv"),n))$sulfate)))
  }
  correlation<-function(n){    
    nitrate<-as.matrix(subset(read.csv(getElement(Sys.glob("*csv"),n))$nitrate,
                              !is.na(read.csv(getElement(Sys.glob("*csv"),n))$nitrate) &
                                !is.na(read.csv(getElement(Sys.glob("*csv"),n))$sulfate)))
    sulfate<-as.matrix(subset(read.csv(getElement(Sys.glob("*csv"),n))$sulfate,
                              !is.na(read.csv(getElement(Sys.glob("*csv"),n))$nitrate) &
                                !is.na(read.csv(getElement(Sys.glob("*csv"),n))$sulfate)))
    return(cor(sulfate,nitrate))
  }
  nobs<-data.frame(fle=as.matrix(1:length(Sys.glob("*csv"))),
                   nob=as.matrix(lapply(1:length(Sys.glob("*csv")), nob)),
                   correlation=as.matrix(lapply(1:length(Sys.glob("*csv")), correlation)))
  return(as.numeric(subset(nobs$correlation, nobs$nob>=threshold)))
}
