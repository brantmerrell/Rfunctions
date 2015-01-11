coursera.note<-function(note, course, time=Sys.time()){
  X<-as.matrix(read.csv("C:/Users/Josh/Documents/CSV Personal/coursera.csv",colClasses="character"))
  Y<-as.matrix(data.frame(note,time,course))
  Z<-rbind(X,Y)
  write.csv(Z, "C:/Users/Josh/Documents/CSV Personal/coursera.csv", row.names=FALSE)
  print(tail(read.csv("C:/Users/Josh/Documents/CSV Personal/coursera.csv"),3))
  View(subset(Z, Z[,3]==course))
}