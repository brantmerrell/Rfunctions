convertQuarter<-function(n){
  QF<-expand.grid(years=1992:2015,quarter=1:4)
  QF<-QF[-which(QF[,"years"]==1992 & QF[,"quarter"] %in% c(1,2,3)),]
  QF<-QF[-which(QF[,"years"]==2015 & QF[,"quarter"] %in% c(2,3,4)),]
  year<-QF[n,'years']
  quarter<-QF[n,'quarter']
  quarters<-data.frame(Q=c(1,2,3,4),
                       month=c("March","June","September","December"),
                       day=c(31,30,30,31),
                       datecode=c("0331","0630","0930","1231"))
  datecode<-paste(year,
                  as.character(subset(quarters$datecode,quarters$Q==quarter)),
                  sep="")
  Url<-paste("https://www2.fdic.gov/sdi/Resource/AllReps/All_Reports_",
             datecode,
             ".zip",
             sep="")
  Destfile<-paste("fdic stg1","/All_Reports_",datecode,".zip",sep="")
  download.file(url=Url,destfile=Destfile)
  unzip(zipfile=Destfile,
        exdir="fdic stg2")
  file.remove(list.files("fdic stg1",full.names=T))
  convertDF<-function(DF){
    convertVar<-function(Var){
      if(class(Var) %in% c("numeric","integer")){Var<-colnames(DF)[Var]}
      valueVector<-as.vector(DF[,Var])
      certVector<-as.vector(DF[,"cert"])
      dateVector<-strptime(DF[,"repdte"],format="%m/%d/%Y")
      key<-paste(Var,certVector,dateVector,sep="_")
      data.frame(key=as.character(key),value=as.character(DF[,Var]))
    }
    AA<-convertVar(1)
    for(m in 2:ncol(DF)){
      AA<-rbind(AA,convertVar(m))
    }
    AA
  }
  for(File in list.files("fdic stg2",pattern="\\.csv$",full.names=T)){
    print(c(File,paste(Sys.time())))
    if(exists("DF")){rm(DF)}
    if(exists("DF2")){rm(DF2)}
    DF<-read.csv(File)
    DF2<-convertDF(DF)
    write.csv(DF2,gsub("fdic stg2","fdic stg3",File))
    print(DF2[seq(1,nrow(DF2),length.out=5),])
    file.remove(File)
    print(paste(Sys.time()))
  }
  file.remove(list.files("fdic stg2",full.names=T))
}


convertCell<-function(Row,Column,DF){
  if(class(Column) %in% c("numeric","integer")){Column<-colnames(DF)[Column]}
  key<-paste(Column,DF[Row,"cert"],strptime(DF[Row,"repdte"],format="%m/%d/%Y"),sep="_")
  data.frame(key=key,value=DF[Row,Column])
}


FDIC.Y.varcompare<-function(year,variables){
  workframe<-FDICvar.quarter(year,quarter,variables[1])
}

FDIC.YQ.varcompare<-function(year,quarter,variables){
  workframe<-FDICvar.quarter(year,quarter,variables[1])
  n<-1
  while(n<length(variables)){
    newdf<-FDICvar.quarter(year,quarter,variables[n+1])
    workframe<-cbind(workframe,newdf)
    n<-n+1
  }
  View(workframe)
  return(workframe)
}

FDIC.quartervariables<-function(Year,Quarter){
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
    download.FDIC(Year,Quarter)
  }
  varnames<-"cert"
  for(File in list.files(folderpath,"\\.csv")){
    filepath<-paste(folderpath,File,sep="/")
    varnames<-unique(c(varnames,colnames(read.csv(filepath,nrows=3))))
  }
  return(varnames)
}

FDICvar.quarter<-function(Year,Quarter,variable,comprehensive=FALSE){
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
    download.FDIC(Year,Quarter)
  }
  files<-FDIC.varscan(Year,Quarter,variable)
  filepaths<-paste(folderpath,files,sep="/")
  n<-1
  workframe<-data.frame(#cert=getElement(read.csv(filepaths[n]),"cert"),
    var=getElement(read.csv(filepaths[n]),variable))
  if(file.exists(filepaths[n+1]) & comprehensive==TRUE){
    while(n<length(filepaths)){
      newframe<-data.frame(cert=getElement(read.csv(filepaths[n+1]),"cert"),
                           var=getElement(read.csv(filepaths[n+1]),variable))
      if(!identical(newframe[,1:2],workframe[,1:2])){
        workframe<-cbind(workframe,newframe[,2])
      }
      n<-n+1
    }
  }
  names(workframe)<-replicate((ncol(workframe)),variable)
  return(workframe)
}

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

FDIC.quartershape<-function(Year,Quarter,Control_var=c("cert")){
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
  fileshape<-function(n,var_control=Control_var){
    filepath<-paste(folderpath,list.files(folderpath,"\\.csv")[n],sep="/")
    data.frame(year=Year,
               quarter=Quarter,
               width=ncol(read.csv(filepath,nrows=1)),
               width_adjusted=sum(!colnames(read.csv(filepath,nrows=1)) %in% var_control),
               length=nrow(read.csv(filepath)),
               file=list.files(folderpath,"\\.csv")[n])
  }
  n<-1
  workframe<-fileshape(n)
  while(n<length(list.files(folderpath,"\\.csv"))){
    newframe<-fileshape(n+1)
    workframe<-rbind(workframe,newframe)
    n<-n+1
  }
  return(workframe[,-4])
}

download.FDIC<-function(year,
                        quarter,
                        destfolder="C:/Users/Administrator/Documents/FDIC"){
  if(!file.exists(destfolder)){
    file.create(destfolder)
  }
  quarters<-data.frame(Q=c(1,2,3,4),
                       month=c("March","June","September","December"),
                       day=c(31,30,30,31),
                       datecode=c("0331","0630","0930","1231"))
  datecode<-paste(year,
                  as.character(subset(quarters$datecode,quarters$Q==quarter)),
                  sep="")
  Url<-paste("https://www2.fdic.gov/sdi/Resource/AllReps/All_Reports_",
             datecode,
             ".zip",
             sep="")
  Destfile<-paste(destfolder,"/All_Reports_",datecode,".zip",sep="")
  download.file(url=Url,destfile=Destfile)
  unzip(zipfile=Destfile,
        exdir=gsub("\\.zip","",Destfile))
  add.note(paste(gsub("\\.zip","",Destfile),"#autonote"))
  file.remove(Destfile)
}

alldefinitions<-function(){
  m<-length(list.files("C:/Users/Josh/Documents/FDIC/SDIAllDefinitions_CSV"))
  data<-read.definitions(1)
  n<-1
  while(n<m){
    data<-rbind(data,read.definitions(n+1))
    n<-n+1
  }
  return(data)
}

read.definitions<-function(n,SKIP=1){
  folderpath<-"C:/Users/Josh/Documents/FDIC/SDIAllDefinitions_CSV"
  filename<-list.files("C:/Users/Josh/Documents/FDIC/SDIAllDefinitions_CSV")[n]
  filepath<-paste(folderpath,filename,sep="/")
  data<-cbind(read.csv(filepath,colClasses="character",skip=SKIP),file=filename)
  names(data)<-c("X","ShortDesciption","Variable","LongDescription","File")
  return(data[,c(1,3,2,4,5)])
}
