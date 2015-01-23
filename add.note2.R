add.note2<-function(category,note,time=Sys.time()){
  note2<-as.matrix(read.csv("C:/Users/Josh/Documents/CSV Personal/notes2.csv",colClasses="character"))
  add2<-as.matrix(data.frame(note,time,category))
  note2<-rbind(note2,add2)
  write.csv(note2,"C:/Users/Josh/Documents/CSV Personal/notes2.csv",row.names=FALSE)
  print(
    as.character(
      unique(
        read.csv("C:/Users/Josh/Documents/CSV Personal/notes2.csv")$category
      )
    )
  )
  print(tail(subset(note2,note2[,3]==category),3))
}