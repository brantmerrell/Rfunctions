mongoFDIC<-function(row,df=FDIC,dbN="local",h="localhost"){
  workdoc<-gsub("'","_",paste('{"_id":',row,
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

# library(RMongo)
# tested script:
# FDIC<-alldefinitions()
# mongoFDIC(1)
# mongoFDIC(39)
# lapply(2:38,mongoFDIC)
# lapply(40:100,mongoFDIC)
# lapply(101:300,mongoFDIC)
# lapply(301:600,mongoFDIC)
# lapply(601:900,mongoFDIC)
# lapply(901:nrow(FDIC),mongoFDIC)
