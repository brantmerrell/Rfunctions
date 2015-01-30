chesscolor<-function(pgn){
  between<-function(n){
    Qtwo<-function(n){
      paste(n,"..",sep="")
    }
    Qone<-function(n){
      paste(n,".1",sep="")
    }
    if(Qtwo(n)<pgn & pgn<Qone(n)){TRUE}
    else{FALSE}
  }
  generate<-function(pgn){
    n<-100
    while(n<pgn){n<-n+1}
    n<-n+1
    n:1
  }
  nm<-generate(pgn)
  if(TRUE %in% lapply(nm,between)){
    return("black")
  }
  else(return("white"))
}