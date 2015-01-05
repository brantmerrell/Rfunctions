clock<-function(punch,comment=""){
  X<-as.matrix(read.csv("C:/Users/Josh/Documents/CSV Personal/clock.csv",colClasses="character"))
  Y<-as.matrix(data.frame(punch,Sys.time(),comment))
  Z<-rbind(X,Y)
  write.csv(Z,"C:/Users/Josh/Documents/CSV Personal/clock.csv",row.names=FALSE)
  print(tail(read.csv("C:/Users/Josh/Documents/CSV Personal/clock.csv"),3))
}