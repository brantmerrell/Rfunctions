FDIC.varscan<-function(Year,Quarter,variable){
  quarters<-data.frame(Q=c(1,2,3,4),
                       month=c("March","June","September","December"),
                       day=c(31,30,30,31),
                       datecode=c("0331","0630","0930","1231"))
  datecode<-paste(Year,
                  as.character(subset(quarters$datecode,quarters$Q==Quarter)),
                  sep="")
  folderpath<-paste("C:/Users/Administrator/Documents/FDIC/All_Reports",
                    datecode,
                    sep="_")
  if(!file.exists(folderpath)){
    download.FDIC(year=Year,quarter=Quarter)
  }
  files<-"placeholder"
  for(file in list.files(folderpath,"\\.csv")){
    filepath<-paste(folderpath,file,sep="/")
    if(variable %in% colnames(read.csv(filepath,nrows=3))){
      files<-c(files,file)
    }
  }
  files<-files[-1]
  files
}
