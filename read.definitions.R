read.definitions<-function(n,SKIP=1,workdir="C:/Users/Administrator/Documents"){
  folderpath<-file.path(workdir,"FDIC")
  filename<-list.files(folderpath,"*\\.csv")[n]
  filepath<-file.path(folderpath,filename)
  if(!file.exists(folderpath) | !file.exists(filepath)){
    dir.create(file.path(folderpath),showWarnings=FALSE)
    url<-"https://www2.fdic.gov/sdi/SDIAllDefinitions_CSV.zip"
    destfile<-file.path(workdir,"FDIC","SDIAllDefinitions_CSV.zip")
    download.file(url,destfile)
    unzip(destfile,exdir=file.path(workdir,"FDIC"))
    file.remove(destfile)
    filename<-list.files(folderpath,"*\\.csv")[n]
    filepath<-file.path(folderpath,filename)
  }
  data<-cbind(read.csv(filepath,colClasses="character",skip=SKIP),file=filename)
  names(data)<-c("X","ShortDesciption","Variable","LongDescription","File")
  return(data[,c(1,3,2,4,5)])
}