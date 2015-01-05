add.film<-function(Film,genre,recommend,Time=Sys.time()){
  filmlist<-as.matrix(read.csv("C:/Users/Josh/Documents/CSV Personal/filmlist.csv",
                               colClasses="character"))
  film<-as.matrix(data.frame(Film,genre,recommend,Time))
  filmlist<-rbind(filmlist,film)
  write.csv(filmlist,"C:/Users/Josh/Documents/CSV Personal/filmlist.csv", 
            row.names=FALSE)
  print(tail(read.csv("C:/Users/Josh/Documents/CSV Personal/filmlist.csv"),3))
}