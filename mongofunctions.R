

mongochess2<-function(row,df=echess,dbN="local",h="localhost"){
  library(RMongo)
  if(df[row,4]=="white"){color<--1}
  if(df[row,4]=="black"){color<-0}
  doc<-paste("{",
             "'_id':'",
             #as.numeric(paste(df[row,2],as.numeric(df[row,5])*2+color,sep="-")),"','",
             paste(df[row,1],df[row,2],df[row,3],sep="_"),"','",
             colnames(df)[1],"':'",df[row,1],"','",
             colnames(df)[2],"':'",df[row,2],"','",
             colnames(df)[3],"':'",df[row,3],"','",
             colnames(df)[4],"':'",df[row,4],"','",
             colnames(df)[5],"':'",df[row,5],"','",
             colnames(df)[6],"':'",df[row,6],"','",
             colnames(df)[7],"':'",df[row,7],"','",
             colnames(df)[8],"':'",df[row,8],"','",
             colnames(df)[9],"':'",df[row,9],
             "'}",sep="")
  mongo<-mongoDbConnect(dbName=dbN, host=h)
  output <- dbInsertDocument(rmongo.object=mongo, 
                             collection="josh_chess", 
                             doc=doc)
  dbDisconnect(mongo)
}

mongoFDIC<-function(row,df=FDIC,dbN="local",h="localhost"){
  library(RMongo)
  #workdoc<-gsub("'","\\.",toJSON(df[row,]))
  workdoc<-gsub("'","\\'",paste('{"_id":',row,
                                ',',
                                '"variable":"',
                                df[row,2],
                                '","ShortDescription":"',
                                df[row,3],
                                '","LongDescription":"',
                                df[row,4],
                                '","File":"',
                                df[row,5],
                                '"}',
                                sep=""))
  mongo <- mongoDbConnect("test", "localhost", 27017)
  output <- dbInsertDocument(rmongo.object=mongoDbConnect(dbName=dbN, host=h), 
                             collection="FDIC", 
                             doc=workdoc)
  dbDisconnect(mongo)
}

mongochess<-function(row,df=echess,dbN="local",h="localhost"){
  library(RMongo)
  doc<-paste("{'movedata':[{'",
             colnames(df)[1],"':'",df[row,1],"'},{'",
             colnames(df)[2],"':'",df[row,2],"'},{'",
             colnames(df)[3],"':'",df[row,3],"'},{'",
             colnames(df)[4],"':'",df[row,4],"'},{'",
             colnames(df)[5],"':'",df[row,5],"'},{'",
             colnames(df)[6],"':'",df[row,6],"'},{'",
             colnames(df)[7],"':'",df[row,7],"'},{'",
             colnames(df)[8],"':'",df[row,8],"'},{'",
             colnames(df)[9],"':'",df[row,9],
             "'}]}",sep="")
  output <- dbInsertDocument(rmongo.object=mongoDbConnect(dbName=dbN, host=h), 
                             collection="josh_chess", 
                             doc=doc)
  dbDisconnect(mongo)
}
