quarterpath1<-"C:/Users/Josh/Documents/All_Reports_20140930"
quarterpath2<-"C:/Users/Josh/Documents/All_Reports_20140630"
var.subtracted<-function(quarterpath1,quarterpath2){
  resetwd<-getwd()
  folder.variables<-function(quarterpath){
    setwd(quarterpath)
    setwd(quarterpath)
    varnames<-function(n){
      as.matrix(colnames(read.csv(list.files()[],row.names = NULL)))
    }
    return(sort(unique(unlist(lapply(1:length(list.files()),varnames)))))
  }
  quarter1<-folder.variables(quarterpath1)
  quarter2<-folder.variables(quarterpath2)
  return(subset(quarter1,!(quarter1 %in% quarter2)))
  setwd(resetwd)
}