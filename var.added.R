quarterpath1<-"C:/Users/Josh/Documents/All_Reports_20140930"
quarterpath2<-"C:/Users/Josh/Documents/All_Reports_20140630"
var.added<-function(quarterpath1,quarterpath2){
  resetwd<-getwd()
  folder.variables<-function(quarterpath){
    setwd(quarterpath)
    varnames<-function(n){
      as.matrix(colnames(read.csv(list.files()[n],row.names = NULL)))
    }
    return(sort(unique(unlist(lapply(1:length(list.files()),varnames)))))
    setwd(resetwd)
  }
  quarter1<-folder.variables(quarterpath1)
  quarter2<-folder.variables(quarterpath2)
  return(subset(quarter2,!(quarter2[1:2] %in% quarter1)))
}
