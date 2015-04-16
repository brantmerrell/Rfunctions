<<<<<<< HEAD
<<<<<<< HEAD
mongoframe<-function(dataframe=data,
                     db=acdb,
                     collection,
                     host="d2051750.mongolab.com:51750",
=======
mongoframe<-function(dataframe=data,db=acdb,collection,host="d2051750.mongolab.com:51750",
>>>>>>> d2a3c3a10dc56c8adc5cd1281333de604cc56fbd
=======
mongoframe<-function(dataframe=data,db=acdb,collection,host="d2051750.mongolab.com:51750",
>>>>>>> d2a3c3a10dc56c8adc5cd1281333de604cc56fbd
                     username="TestUser",password="TestPassword"){
  namespace <- paste(db, collection, sep=".")
  for(doc in 1:nrow(dataframe)){
    b<-mongo.bson.from.df(dataframe[doc,])
    ok <- mongo.insert(mongo, namespace, b)
  }
}

df<-read.csv(file.path(getwd(),"csv",list.files(file.path(getwd(),"CSV"),"*\\.csv")[1]))
filename<-list.files(file.path(getwd(),"CSV"),"*\\.csv")[1]

workdoc<-paste
library(RMongo)

mongo <- mongoDbConnect("acdb", "ds051750.mongolab.com", 51750)
output <- ?dbInsertDocument(rmongo.object=mongo, 
                           collection="ShareableStuffUser", 
                           doc=workdoc)
list.files(pattern="*\\.pdf")
library(rmongodb)
list(name="Fred", age=29, city="Boston")
mongo.bson.from.list(list(name="Fred", age=29, city="Boston"))


list("X"=c(1,2))

mongostore.FDIC<-function(quarter=4,year=2014){
  library(RMongo)install.packages("RMongo")
}

FDIC.mongorow<-function(row,df=data,dbN="acdb",h="localhost"){
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
