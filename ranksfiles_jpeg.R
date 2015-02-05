ranksfiles_jpeg<-function(id){
  filepath1<-paste("C:/Users/Josh/Documents/Chess/barfiles_",id,".jpeg",sep="")
  filepath2<-paste("C:/Users/Josh/Documents/Chess/barranks_",id,".jpeg",sep="")
  if(file.exists(filepath1)==TRUE | file.exists(filepath2)){
    message("this game has already been plotted!")
  }
  jpeg(filepath1)
  barfiles(id)
  dev.off()
  jpeg(filepath2)
  barranks(id)
  dev.off()
}
