quarterpath<-"C:/Users/Josh/Documents/All_Reports_20140930"
file.variables<-function(quarterpath){
  resetwd<-getwd()
  setwd(quarterpath)
  varnames<-function(n){
    as.matrix(colnames(read.csv(list.files()[n],row.names = NULL)))
  }
  X<-lapply(1:length(list.files()),varnames)
  print(sort(unique(unlist(X))))
  setwd(resetwd)
}