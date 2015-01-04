add.object<-function(object,location,comment="",time=Sys.time()){
  X<-as.matrix(read.csv("C:/Users/Josh/Documents/CSV Personal/paper.csv"))
  Y<-as.matrix(data.frame(object,location,time,comment))
  Z<-rbind(X,Y)
  write.csv(Z,"C:/Users/Josh/Documents/CSV Personal/paper.csv",row.names=FALSE)
  print(tail(read.csv("C:/Users/Josh/Documents/CSV Personal/paper.csv"),3))
}