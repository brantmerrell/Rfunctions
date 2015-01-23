artiquote<-function(art_number,art_quote,time=Sys.time()){
  artiquote<-as.matrix(read.csv("C:/Users/Josh/Documents/CSV Personal/artiquote.csv",colClasses="character"))
  addquote<-as.matrix(data.frame(art_quote,time,art_number))
  artiquote<-rbind(artiquote,addquote)
  write.csv(artiquote,"C:/Users/Josh/Documents/CSV Personal/artiquote.csv",row.names=FALSE)
  print(tail(artiquote,3))
}
