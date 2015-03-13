mongostore.FDIC<-function(quarter=4,year=2014){
  library(RMongo)install.packages("RMongo")
}

FDIC.mongorow<-function(row,df=FDIC,dbN="local",h="localhost"){
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
