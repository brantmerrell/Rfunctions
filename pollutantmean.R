pollutantmean<-function(directory, pollutant, id){
  setwd(directory)
  fac<-getElement(read.csv(getElement(list.files(), id)), pollutant)
  mean(subset(fac, !is.na(fac)))
}
pollutantmean("specdata", "sulfate", 5)
id<-5
pollutant<-"sulfate"
