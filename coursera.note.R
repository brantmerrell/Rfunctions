coursera.note<-function(note, course, time=Sys.time()){
  coursera<-as.matrix(read.csv("C:/Users/Josh/Documents/CSV Personal/coursera.csv",colClasses="character"))
  Y<-as.matrix(data.frame(note,time,course))
  coursera<-rbind(coursera,Y)
  write.csv(coursera, "C:/Users/Josh/Documents/CSV Personal/coursera.csv", row.names=FALSE)
  print(tail(read.csv("C:/Users/Josh/Documents/CSV Personal/coursera.csv"),3))
  View(subset(Z, Z[,3]==course))
}