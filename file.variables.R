path<-"C:/Users/Josh/Documents/All_Reports_20140930"
file.variables<-function(path){
  resetwd<-getwd()
  setwd(path)
  varnames<-function(n){
    as.matrix(colnames(read.csv(list.files()[n],row.names = NULL)))
  }
  X<-lapply(1:length(list.files()),varnames)
  print(sort(unique(unlist(X))))
  setwd(resetwd)
}