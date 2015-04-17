add.refFrame<-function(userN,passW,collec,dataB,hst,fileP,mostR,workdir=getwd()){
  filepath<-file.path(workdir,"CSV Personal/refFrame.csv")
  refFrame<-read.csv(filepath,colClasses="character")
  refFrame<-rbind(refFrame,
                  data.frame(username=userN,
                             password=passW,
                             filepath=fileP,
                             database=dataB,
                             collection=collec,
                             host=hst,
                             mostRecent=mostR))
  write.csv(refFrame,filepath,row.names=FALSE)
  print(tail(read.csv(filepath),3))
}

mongo.csv<-function(refRow,workdir=getwd()){
  refFrame<-read.csv(file.path(workdir,"CSV Personal/refFrame.csv"),colClasses="character")
  username<-refFrame$username[refRow]
  password<-refFrame$password[refRow]
  dataframe<-read.csv(refFrame$filepath[refRow])
  db<-refFrame$database[refrow]
  collection<-refFrame$collection[refRow]
  host<-refFrame$host[refRow]
  library(rmongodb)
  namespace <- paste(db, collection, sep=".")
  for(doc in 1:nrow(dataframe)){
    mongo <- mongo.create(host=host , db=db, username=username, password=password)
    b <- mongo.bson.from.df(dataframe[doc,])
    ok <- mongo.insert(mongo, namespace, b)
    print(dataframe[doc,])
  }
}

mongoframe<-function(username, password,
                     dataframe=chesspgn,
                     db="josh_chess",
                     collection="chesspgn",
                     host="ds049171.mongolab.com:49171"){
  library(rmongodb)
  namespace <- paste(db, collection, sep=".")
  for(doc in 1:nrow(dataframe)){
    mongo <- mongo.create(host=host , db=db, username=username, password=password)
    b <- mongo.bson.from.df(dataframe[doc,])
    ok <- mongo.insert(mongo, namespace, b)
    print(dataframe[doc,])
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
