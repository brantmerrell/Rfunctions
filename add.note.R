add.note<-function(note){
  X<-as.matrix(read.csv("C:/Users/Josh/Documents/CSV Personal/notes.csv",colClasses="character"))
  Y<-as.matrix(data.frame(note,Sys.time()))
  Z<-rbind(X,Y)
  write.csv(Z,"C:/Users/Josh/Documents/CSV Personal/notes.csv",row.names=FALSE)
  print(tail(read.csv("C:/Users/Josh/Documents/CSV Personal/notes.csv"),3))
}
