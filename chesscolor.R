chesscolor<-function(pgn){
  if(ncol(read.table(textConnection(pgn),sep="."))==4){
    return("black")
  }
  if(ncol(read.table(textConnection(pgn),sep="."))==2){
    return("white")
  }
  if(!(ncol(read.table(textConnection(pgn),sep=".")) %in% c(2,4))){
    stop("invalid number of dots")
  }
}

## outdated chesscolor function - 
## - didn't know read.table could dissect character strings
#chesscolor<-function(pgn){
#  between<-function(n){
#    Qtwo<-function(n){
#      paste(n,"..",sep="")
#    }
#    Qone<-function(n){
#      paste(n,".1",sep="")
#    }
#    if(Qtwo(n)<pgn & pgn<Qone(n)){TRUE}
#    else{FALSE}
#  }
#  if(TRUE %in% lapply(1:270,between)){
#    return("black")
#  }
#  else(return("white"))
#}