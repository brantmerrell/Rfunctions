mongoFDIC<-function(row,df=FDIC,dbN="local",h="localhost"){
  library(RMongo)
  FDICdoc<-paste("{'FDIC':[","{'",
             colnames(df)[1],"':'",df[row,1],
             "'},{'",
             colnames(df)[2],"':'",df[row,2],
             "'},{'",
             colnames(df)[3],"':'",df[row,3],
             "'},{'",
             colnames(df)[4],"':'",df[row,4],
             "'},{'",
             colnames(df)[5],"':'",df[row,5],
             "'}","]}",sep="")
  mongo <- mongoDbConnect(dbName=dbN, host=h, 27017)
  output <- dbInsertDocument(rmongo.object=mongoDbConnect(dbName=dbN, host=h), 
                             collection="FDIC", 
                             doc=FDICdoc)
  dbDisconnect(mongo)
}
# FDIC<-alldefinitions()
#mongoFDIC(1)
#mongoFDIC(2)
#mongoFDIC(3)
#mongoFDIC(4)
#mongoFDIC(5)
