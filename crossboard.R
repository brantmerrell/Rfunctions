crossboard<-function(y){
  if(!(y %in% 1:8)){
    stop("invalid y coordinate")
  }
  paste(letters[1:8],y,sep="")
}
