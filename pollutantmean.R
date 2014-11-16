pollutantmean<-function(directory, pollutant, id){
  setwd("C:/Users/Josh/Documents/CSV")
  setwd(directory)
  singlist<-function(id){
  fac<-getElement(read.csv(getElement(list.files(), id)), pollutant)
  as.list(subset(fac, !is.na(fac)))}
  lapply(id, singlist)
}
id<-1
pollutant<-"sulfate"
directory<-"specdata"
pollutantmean("specdata", "sulfate",1:2)

lapply(getElement(Sys.glob("*csv"),id), get.pollutant)
read.directory
read.id<-function()
read.pollutant<-function(n){
  if (pollutant=="sulfate"){
    read.csv(getElement(Sys.glob("*csv"),id))$sulfate
  }
  if (pollutant=="nitrate"){
    read.csv(getElement(Sys.glob("*csv"),id))$nitrate
  }
}
