variables<-as.vector(read.csv("C:/Users/Josh/Documents/CSV/variables.csv")[,1])
quarterpath<-"C:/Users/Josh/Documents/All_Reports/All_Reports_19921231"
var.deficit<-function(variables,quarterpath){
  folder.variables<-function(quarterpath){
    resetwd<-getwd()
    setwd(quarterpath)
    varnames<-function(n){
      as.matrix(colnames(read.csv(list.files()[n],row.names=NULL)))
    }
    return(sort(unique(unlist(lapply(1:length(list.files()),varnames)))))
  }
  qvariables<-folder.variables(quarterpath)
  return(c(deficit.variables=subset(variables,!(variables %in% qvariables))))
  setwd(resetwd)
}