GDP<-function(year,nation){
  if(!exists('GDPs')){
    if(!file.exists("data")){dir.create("data")}
    folderPattern<-"ny.gdp.mktp.cd_Indicator_en_csv_v2$"
    list.files("data","ny.gdp.mktp.cd_Indicator_en_csv_v2")
    if(length(list.files("data",folderPattern))==0){
      if(length(list.files("data",gsub("\\$",".zip",folderPattern)))==0){
        download.file("http://api.worldbank.org/v2/en/indicator/ny.gdp.mktp.cd?downloadformat=csv",
                      destfile=file.path("data","ny.gdp.mktp.cd_Indicator_en_csv_v2.zip"), 
                      mode="wb")
      }
      unzip(zipfile=file.path("data","ny.gdp.mktp.cd_Indicator_en_csv_v2.zip"),
            exdir=file.path("data","ny.gdp.mktp.cd_Indicator_en_csv_v2"))
    }
    folder<-list.files("data","ny.gdp.mktp.cd_Indicator_en_csv_v2$",full.names=T)
    GDPs<-read.csv(list.files(folder,"^ny",full.names=T),skip=3)
    GDPs<-GDPs[,colnames(GDPs)[!grepl("Indicator",colnames(GDPs))]]
  }
  ifelse(!nation %in% GDPs[,"Country.Name"],
         nationRows<-grep(nation,GDPs[,"Country.Name"]),
         nationRows<-which(GDPs[,"Country.Name"]==nation))
  year<-colnames(GDPs)[grep(paste(year,collapse="|"),colnames(GDPs))]
  world<-which(GDPs[,"Country.Name"]=="World")
  world<-as.vector(GDPs[world,year])
  nation<-as.vector(GDPs[nationRows,"Country.Name"])
  DF<-cbind(expand.grid(nation,year),NA,NA,NA)
  names(DF)<-c("nation","year","National GDP","World GDP","percent")
  for(n in 1:nrow(DF)){
    DF[n,"National GDP"]<-round(GDPs[which(GDPs[,"Country.Name"]==as.vector(DF[n,"nation"])),
                                     as.vector(DF[n,"year"])],2)
    DF[n,"World GDP"]<-world[DF[n,"year"]]
    DF[n,"percent"]<-DF[n,"National GDP"]/DF[n,"World GDP"]
  }
  DF<-DF[!is.na(DF[,"National GDP"]),]
  DF[,"year"]<-gsub("X","",DF[,"year"])
  DF[,"National GDP"]<-paste("$",signif(DF[,"National GDP"],2),sep="")
  DF[,"World GDP"]<-paste("$",signif(DF[,"World GDP"],2),sep="")
  DF[,"percent"]<-paste(round(100*DF[,"percent"],2),"%",sep="")
  DF
}
