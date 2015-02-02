completelivemoves<-function(incomplete_ID_live){
  id<-incomplete_ID_live
  pgn<-notate.pgn(id)
  livemove<-function(pgn){
    add.move(id,pgn)
  }
  lapply(pgn,livemove)
}
