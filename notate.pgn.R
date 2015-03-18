notate.pgn<-function(game){
  pgn<-read.pgn(game)
  pgn<-read.table(textConnection(pgn),sep=".",colClasses="character",comment.char="")
  pgn<-matrix(pgn,nrow=ncol(pgn),ncol=1)
  white<-function(n){
    n<-n+1
    as.character(read.table(textConnection(as.character(pgn[n,])),sep=" ")$V1)
  }
  black<-function(n){
    n<-n+1
    as.character(read.table(textConnection(as.character(pgn[n,])),sep=" ")$V2)
  }
  white<-unlist(lapply(1:(length(pgn)-1),white))
  black<-unlist(lapply(1:(length(pgn)-1),black))
  whitepaste<-function(n){
    paste(n,white[n],sep=".")
  }
  blackpaste<-function(n){
    paste(n,black[n],sep="...")
  }
  white<-unlist(lapply(1:length(pgn),whitepaste))
  black<-unlist(lapply(1:length(pgn),blackpaste))
  all<-c(white,black)
  all<-subset(all,grepl("NA",all)==FALSE)
  return(all)
}
