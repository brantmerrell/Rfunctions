read.definitions<-function(n,SKIP=1){
  folderpath<-"C:/Users/Josh/Documents/FDIC/SDIAllDefinitions_CSV"
  filename<-list.files("C:/Users/Josh/Documents/FDIC/SDIAllDefinitions_CSV")[n]
  filepath<-paste(folderpath,filename,sep="/")
  data<-cbind(read.csv(filepath,colClasses="character",skip=SKIP),file=filename)
  names(data)<-c("X","ShortDesciption","Variable","LongDescription","File")
  return(data[,c(1,3,2,4,5)])
}
