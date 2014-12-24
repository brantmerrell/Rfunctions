file.cert<-function(filepath){
  return(unique(read.csv(filepath)$cert))
}