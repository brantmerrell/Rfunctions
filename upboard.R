upboard<-function(x){
  if(!(tolower(x) %in% c(1:8,letters[1:8]))){
    stop("invalid X coordinate")
  }
  if(tolower(x) %in% letters[1:8]){
    return(paste(tolower(x),1:8,sep=""))
  }
  if(x %in% 1:8){
    return(paste(letters[x],1:8,sep=""))
  }
}
