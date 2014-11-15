pollutantmean<-function(directory, pollutant, id){
  setwd("C:/Users/Josh/Documents/CSV")
  setwd(directory)
  singlemean<-function(id){
  fac<-getElement(read.csv(getElement(list.files(), id)), pollutant)
  mean(subset(fac, !is.na(fac)))}
  lapply(id, singlemean)
}
onetent<-pollutantmean("specdata", "sulfate", 1:10)
lapply(onetent, mean)
mean(c(3.880701,
  4.460811,
  4.327613,
  4.214956,
  4.210072,
  4.102132,
  3.820059,
  4.781354,
  3.645644,
  0.6243649))
[1] 3.806771