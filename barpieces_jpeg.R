barpieces_jpeg<-function(id){
  filepath<-paste("C:/Users/Josh/Documents/Chess/barpieces_",id,".jpeg",sep="")
  if(file.exists(filepath)==TRUE){
    message("this game has already been plotted!")
  }
  else{
    jpeg('filepath')
    barpieces(id)
    dev.off()
  }
}