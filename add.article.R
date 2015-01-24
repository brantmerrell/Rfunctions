add.article<-function(Author,
                      Title,
                      Organization,
                      Site,
                      Date,
                      From){
  articles<-read.csv("C:/Users/Josh/Documents/CSV/Articles.csv",colClasses="character")
  Y<-data.frame(Author=as.matrix(append(as.vector(articles$Author),Author)),
                Title=as.matrix(append(as.vector(articles$Title),Title)),
                Organization=as.matrix(append(as.vector(articles$Organization),Organization)),
                Site=as.matrix(append(as.vector(articles$Site),Site)),
                Date=as.matrix(append(as.vector(articles$Date),Date)),
                From=as.matrix(append(as.vector(articles$From),From)))
  write.csv(Y,"C:/Users/Josh/Documents/CSV/Articles.csv", row.names=FALSE)
  print(tail(Y,3))
}