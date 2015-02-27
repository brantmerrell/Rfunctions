newsdata<-function(newslinks){
  for(newslink in newslinks){
    if(grepl("www.nytimes.com",newslink)){
      year<-read.table(textConnection(newslink),sep="/")$V4
      month<-read.table(textConnection(newslink),sep="/")$V5
      day<-read.table(textConnection(newslink),sep="/")$V6
      
    }
  }
  
}

newslink<-function(links)

musiclink<-function(links){
  if(FALSE %in% grepl("pandora.com",links)){
    message("this includes a non-pandora link")
  }
  filepath<-"C:/Users/Josh/Documents/CSV Personal/pandoralinks.csv"
  current<-as.matrix(read.csv(filepath,colClasses="character"))
  write.csv(unique(rbind(current,as.matrix(links))),filepath,row.names=FALSE)
  print(tail(read.csv(filepath),3))
}

pandoradata<-function(pandoralinks="default"){
  if("default" %in% pandoralinks){
    pandoralinks<-read.csv("C:/Users/Josh/Documents/CSV Personal/pandoralinks.csv",
                           colClasses="character")$x
  }
  data<-data.frame(artist=as.character(read.table(textConnection(pandoralinks[1]),sep="/")$V4),
                   album=as.character(read.table(textConnection(pandoralinks[1]),sep="/")$V5),
                   track=as.character(read.table(textConnection(pandoralinks[1]),sep="/")$V6),
                   link=as.character(pandoralinks[1]))
  if(length(pandoralinks)!=1){
    for(link in pandoralinks[2:length(pandoralinks)]){
      newrow<-data.frame(artist=as.character(read.table(textConnection(link),sep="/")$V4),
                         album=as.character(read.table(textConnection(link),sep="/")$V5),
                         track=as.character(read.table(textConnection(link),sep="/")$V6),
                         link=as.character(link))
      data<-rbind(data,newrow)
    }
  }
  data
}

meta.loop<-function(ids,Var="Event"){
  if(tolower(Var)=="event"){
    FUN<-function(id){as.vector(read.meta(id)$Event)}
  }
  if(tolower(Var)=="site"){
    FUN<-function(id){as.vector(read.meta(id)$Site)}
  }
  if(tolower(Var)=="date"){
    FUN<-function(id){as.vector(read.meta(id)$Date)}
  }
  if(tolower(Var)=="white"){
    FUN<-function(id){as.vector(read.meta(id)$White)}
  }
  if(tolower(Var)=="black"){
    FUN<-function(id){as.vector(read.meta(id)$Black)}
  }
  if(tolower(Var)=="result"){
    FUN<-function(id){as.vector(read.meta(id)$Result)}
  }
  if(tolower(Var)=="whiteelo"){
    FUN<-function(id){as.vector(read.meta(id)$WhiteElo)}
  }
  if(tolower(Var)=="blackelo"){
    FUN<-function(id){as.vector(read.meta(id)$BlackElo)}
  }
  if(tolower(Var)=="timecontrol"){
    FUN<-function(id){as.vector(read.meta(id)$TimeControl)}
  }
  unlist(lapply(ids,FUN))
}

dividemove<-function(n=1,incolor=c("white","black")){
  chesspgn<-"C:/Users/Josh/Documents/chess/chesspgn.csv"
  chesspgn<-read.csv(chesspgn,colClasses="character")
  while(sum(chesspgn$move %in% n)<500 & max(n)<max(as.numeric(chesspgn$move))){
    n<-c(n,(max(n)+1))
  }
  workframe<-subset(chesspgn,chesspgn$color %in% incolor & chesspgn$move %in% n)
  if(nchar(min(n))==1){filepath<-paste("C:/Users/Josh/Documents/Chess/move_0")}
  if(nchar(min(n))==2){filepath<-paste("C:/Users/Josh/Documents/Chess/move_")}
  if(2<nchar(min(n))){
    filepath<-paste("C:/Users/Josh/Documents/Chess/move_0")
    message("I might have to adjust the filenames for this length of game")
  }
  filepath<-paste(filepath,min(n),".csv",sep="")
  if(500<=nrow(workframe)){
    write.csv(workframe,filepath,row.names=FALSE)
    print(filepath)
    sampleframe<-rbind(workframe[1,],
                       workframe[as.integer(nrow(workframe)*.2),],
                       workframe[as.integer(nrow(workframe)*.4),],
                       workframe[as.integer(nrow(workframe)*.6),],
                       workframe[as.integer(nrow(workframe)*.8),],
                       workframe[as.integer(nrow(workframe)),])
  }
  else{
    sampleframe<-tail(workframe,3)
  }
  sumframe<-data.frame(King=sum(workframe$piece=="King"),
                       Queen=sum(workframe$piece=="Queen"),
                       Rook=sum(workframe$piece=="Rook"),
                       Knight=sum(workframe$piece=="Knight"),
                       Bishop=sum(workframe$piece=="Bishop"),
                       pawn=sum(workframe$piece=="pawn"),
                       total=nrow(workframe))
  print(sampleframe)
  print(sumframe)
}

retrieve<-function(country,category="Personnel"){
  country<-tolower(gsub("_"," ",country))
  category<-tolower(gsub("_"," ",category))
  if(country=="east asia" & category=="personnel"){
    data<-read.csv("C:/Users/Josh/Documents/data/personnel_nationmaster.csv",
                   colClasses="character")
    subdata<-subset(data,data$Country %in% 
                      c("China","Vietnam","North Korea","South Korea","Japan"))
    subdata$Country<-factor(subdata$Country,c("China","Japan","Vietnam","North Korea","South Korea"),
                            labels=c("China","Japan","Vietnam","North Korea","South Korea"))
    qplot(y=as.numeric(Number),data=subdata,fill=Country,alpha=I(.5),
          margins=TRUE,main="East Asian Active Duty Personnel", xlab="Year",binwidth=0.5,
          ylab=c("Personnel"))
  }
}

request(){
  
  East_Asia<-subset(data,data$Country %in% c("China","North Korea","South Korea","Vietnam","Japan"))
  East_Asia<-East_Asia[order(East_Asia$Date),]
  Date<-as.numeric(East_Asia$Date)
  Personnel<-as.numeric(East_Asia$Number)
  #China<-subset(data,data$Country=="China")
  #China<-China[order(China$Date),]
  #Date<-as.numeric(China$Date)
  #Personnel<-as.numeric(China$Number)
  barplot(c(Date,Personnel),)
  xyplot(Number ~ Date | Country, data=East_Asia, layout =c(5,1))
  lines()
}
plot(China$Date,China$Number,"l")

number<-function(row,frame=personnel_total){
  n<-gsub(",","",frame$Amount[row])
  if(grepl(" million",n)==TRUE){
    return(as.numeric(gsub(" million","",n))*1000000)
  }else(return(n))
}

nationmaster_personnel<-function(){}
download.file()

mongoFDIC<-function(row,df=FDIC,dbN="local",h="localhost"){
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



add.fitness<-function(activity,unit,measure,count,limit,Time=Sys.time(),comment=NA){
  fitnesspath<-"C:/Users/Josh/Documents/CSV Personal/fitness.csv"
  fitness<-read.csv(fitnesspath,colClasses="character")
  observation<-c(activity,unit,measure,count,limit,paste(Time),comment)
  fitness<-rbind(fitness,observation)
  write.csv(fitness,fitnesspath,row.names=FALSE)
  print(tail(read.csv(fitnesspath),3))
}

add.food<-function(fd, cbs, prt, ft, Tm=paste(Sys.time())){
  foodpath<-"C:/Users/Josh/Documents/CSV Personal/foods.csv"
  food<-as.matrix(read.csv(filepath,colClasses="character"),ncol=5)
  newrow<-as.matrix(data.frame(Time=Tm,food=fd,carbs=cbs,protein=prt,fat=ft))
  food<-rbind(food,newrow)
  write.csv(food,filepath,row.names=FALSE)
  print(tail(read.csv(filepath),3))
}

threshsplit<-function(threshold,filepath="C:/Users/Josh/Documents/Chess/chesspgn.csv"){
  data<-read.csv(filepath,colClasses="character")
  idcount<-function(id){
    sum(data$ID==id)
  }
  df<-data.frame(ID=sort(unique(data$ID)),
                 idcount=unlist(lapply(sort(unique(data$ID)),idcount)))
  games_above<-as.character(subset(df$ID,threshold<=df$idcount))
  games_below<-as.character(subset(df$ID,df$idcount<threshold))
  moves_above<-subset(data,data$ID %in% games_above)
  moves_below<-subset(data,as.integer(data$ID) %in% games_below)
  data.frame(label=c("games_above","games_below","moves_above","moves_below"),
             count=c(length(games_above),length(games_below),
                     nrow(moves_above),nrow(moves_below)))
}

doodle.note<-function(note,Time=Sys.time()){
  doodle<-as.matrix(read.csv("C:/Users/Josh/Documents/CSV Personal/doodlenotes.csv",colClasses="character"))
  obs<-as.matrix(data.frame(note,Time))
  doodle<-rbind(doodle,obs)
  write.csv(doodle,"C:/Users/Josh/Documents/CSV Personal/doodlenotes.csv",row.names=FALSE)
  print(tail(doodle,3))
}

gitpdf.note<-function(note,course,week,lecture,slide_num,slide_of,Time=Sys.time()){
  filepath<-"C:/Users/Josh/Documents/CSV Personal/gitpdf.csv"
  gitpdf<-read.csv(filepath,colClasses="character")
  newrow<-c(note,paste(Time),course,week,lecture,slide_num,slide_of)
  gitpdf<-rbind(gitpdf,newrow)
  write.csv(gitpdf,filepath,row.names=FALSE)
  tail(read.csv(filepath),3)
}

monthlyfinance<-function(year,month,category,amount,percentage){
  filepath<-"C:/Users/Josh/Documents/Finance/months.csv"
  data<-read.csv(filepath,colClasses="character")
  data<-rbind(data,c(year,month,category,amount,percentage))
  write.csv(data,filepath,row.names=FALSE)
  print(tail(read.csv(filepath)))
}


mongo.note<-function(lecnumber,mongonote,Time=Sys.time()){
  filepath<-"C:/Users/Josh/Documents/CSV Personal/Mongo.DB.csv"
  data<-read.csv(filepath,colClasses="character")
  data<-rbind(data,c(lecnumber,mongonote,paste(Time)))
  write.csv(data,filepath,row.names=FALSE)
  tail(read.csv(filepath),3)
}

read.definitions<-function(n,SKIP=1){
  folderpath<-"C:/Users/Josh/Documents/FDIC/SDIAllDefinitions_CSV"
  filename<-list.files("C:/Users/Josh/Documents/FDIC/SDIAllDefinitions_CSV")[n]
  filepath<-paste(folderpath,filename,sep="/")
  data<-cbind(read.csv(filepath,colClasses="character",skip=SKIP),file=filename)
  names(data)<-c("X","ShortDesciption","Variable","LongDescription","File")
  return(data[,c(1,3,2,4,5)])
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

bar_gamelengths<-function(chessgrid,filepath,note=NULL){
  n<-length(unique(chessgrid$ID))
  col<-colors()[24:(24+n)]
  jpeg(filepath)
  hist(as.numeric(chessgrid$move),col=c("grey10","grey20","grey30","grey40","grey50"),density=c(50,90,70),
       angle=c(0,45),main=paste("Histogram of move numbers in",n,"games"),sub=note,xlab="movenumbers")
  dev.off()
}

ranksfiles_jpeg<-function(id){
  filepath1<-paste("C:/Users/Josh/Documents/Chess/barfiles_",id,".jpeg",sep="")
  filepath2<-paste("C:/Users/Josh/Documents/Chess/barranks_",id,".jpeg",sep="")
  if(file.exists(filepath1)==TRUE | file.exists(filepath2)){
    message("this game has already been plotted!")
  }
  jpeg(filepath1)
  barfiles(id)
  dev.off()
  jpeg(filepath2)
  barranks(id)
  dev.off()
}


barranks<-function(id_OR_df){
  total<-function(file){
    sum(chessgrid$y==file)
  }
  if(class(id_OR_df)=="data.frame"){
    chessgrid<-id_OR_df
    explain<-paste("Number of Moves in",length(unique(chessgrid$ID)),"games, by rank",sep=" ")
  }
  if(class(id_OR_df) %in% c('numeric','integer')){
    id<-id_OR_df
    filepath<-"C:/Users/Josh/Documents/chess/chesspgn.csv"
    chesspgn<-read.csv(filepath,colClasses="character")
    explain<-paste("Use of ranks in game",id)
    ifelse(id %in% chesspgn$ID,
           chessgrid<-subset(chesspgn,chesspgn$ID==id),
           message("This game has not been stored in chesspgn"))
  }
  counts<-unlist(lapply(1:8,
                        total))
  df<-data.frame(counts=counts,ranks=1:8)
  col<-c("beige","bisque","blanchedalmond","burlywood","burlywood1","burlywood2","burlywood3","burlywood4")
  densitor<-as.integer(50*(mean(df$counts)+1)/(df$count+1))
  par(mar=c(6,4,4,6))
  barplot(height=df$counts,width=0.5,space=.2,
          names.arg=TRUE,legend.text=TRUE,horiz=TRUE, 
          density=densitor,angle=0,
          col=col,
          border="brown",main="Use of Board Ranks", sub=explain,
          xlab="moves",ylab="ranks",axes=TRUE,axisnames=TRUE)
  legend(x='topright', legend=paste(df$ranks,df$counts,sep=" : "), 
         fill=col,border="brown",lty=.5,pch=NULL,angle=90,
         density=densitor,box.lwd=".2",
         box.col="blue",pt.bg="maroon",
         col=col, bty='o', cex=.35,pt.cex=0,xjust=0.5,yjust=1)
}

barfiles<-function(id_OR_df){
  total<-function(file){
    sum(chessgrid$x==file)
  }
  if(class(id_OR_df)=="data.frame"){
    chessgrid<-id_OR_df
    explain<-paste("Number of Moves in",length(unique(chessgrid$ID)),"games, by file",sep=" ")
  }
  if(class(id_OR_df) %in% c('numeric','integer')){
    id<-id_OR_df
    filepath<-"C:/Users/Josh/Documents/chess/chesspgn.csv"
    chesspgn<-read.csv(filepath,colClasses="character")
    explain<-paste("Use of files in game",id)
    ifelse(id %in% chesspgn$ID,
           chessgrid<-subset(chesspgn,chesspgn$ID==id),
           message("This game has not been stored in chesspgn"))
  }
  files<-c("a","b","c","d","e","f","g","h")
  counts<-unlist(lapply(files,
                        total))
  df<-data.frame(counts=counts,files=files)
  col<-c("aquamarine1","aquamarine2","aquamarine3","aquamarine4","azure1","azure2","azure3","azure4")
  densitor<-as.integer(50*(mean(df$counts)+1)/(df$count+1))
  par(mar=c(6,4,4,6))
  barplot(height=df$counts,width=0.5,space=.2,
          names.arg=TRUE,legend.text=TRUE,horiz=FALSE, 
          density=densitor,angle=0,
          col=col,
          border="brown",main="Use of Board Files", sub=explain,
          xlab="Files",ylab="moves",axes=TRUE,axisnames=TRUE)
  legend(x='topleft', legend=paste(df$files,df$counts,sep=" : "), 
         fill=col,border="black",lty=.5,pch=NULL,angle=90,
         density=densitor,box.lwd=".2",
         box.col="blue",pt.bg="maroon",
         col=col, bty='o', cex=.35,pt.cex=0,xjust=0.5,yjust=1)
}

gamesize<-function(id){
  filepath<-"C:/Users/Josh/Documents/chess/chesspgn.csv"
  chesspgn<-read.csv(filepath,colClasses="character")
  game<-subset(chesspgn,chesspgn$ID==id)
  black<-max(as.numeric(subset(game$move,game$color=="black")))
  white<-max(as.numeric(subset(game$move,game$color=="white")))
  return(mean(c(black,white)))
}

barpieces_jpeg<-function(id){
  filepath<-paste("C:/Users/Josh/Documents/Chess/barpieces_",id,".jpeg",sep="")
  if(file.exists(filepath)==TRUE){
    message("this game has already been plotted!")
  }
  jpeg(filepath)
  barpieces(id)
  dev.off()
}

barpieces<-function(id_OR_df){
  total<-function(piece){
    sum(chessgrid$piece==piece)
  }
  if(class(id_OR_df)=="data.frame"){
    chessgrid<-id_OR_df
    explain<-paste("Number of Moves in",length(unique(chessgrid$ID)),"games",sep=" ")
  }
  if(class(id_OR_df) %in% c('numeric','integer')){
    id<-id_OR_df
    filepath<-paste("C:/Users/Josh/Documents/chess/chesspgn.csv")
    chesspgn<-read.csv(filepath,colClasses="character")
    explain<-paste("Use of pieces in game",id)
    ifelse(id %in% chesspgn$ID,
           chessgrid<-subset(chesspgn,chesspgn$ID==id),
           message("This game has not been stored in chesspgn"))
  }
  counts<-unlist(lapply(c("King","Queen","Rook","Bishop","Knight","pawn","King & Rook"),
                        total))
  pieces<-paste(c("K","Q","R","B","N","p","Cstl"),counts,sep=" : ")
  df<-data.frame(counts=counts,pieces=pieces)
  col<-c("green1","red","yellow1","royalblue2","purple2","turquoise","brown4")
  densitor<-(10^(nchar(as.integer(mean(df$counts)))+1))/(df$count+1)
  par(mar=c(8,4,6,4))
  barplot(height=df$counts,width=0.8,space=.2,
          names.arg=TRUE,legend.text=FALSE,horiz=TRUE, 
          density=densitor,angle=90, 
          col=col,
          border="brown",main="Use of Chess Pieces", sub=explain,
          xlab=NULL,ylab="pieces",axes=TRUE,axisnames=FALSE)
  legend('bottomright', legend=(df$pieces), 
         col=col,lty=1, bty='n', cex=.75)
}

read.meta<-function(id){
  filepath<-paste("C:/Users/Josh/Documents/Chess/PGN/",id,".pgn",sep="")
  if(!(file.exists(filepath))){
    download.pgn(id)
  }
  n<-1
  while(readLines(filepath)[n]!=""){
    n<-n+1
  }
  workframe<-data.frame(matrix(read.table(textConnection(readLines(filepath)[1:(n-1)]))$V2,ncol=(n-1)))
  names(workframe)<-gsub("\\[","",read.table(textConnection(readLines(filepath)[1:(n-1)]))$V1)
  workframe
}

completelivemoves<-function(incomplete_ID_live){
  id<-incomplete_ID_live
  pgn<-notate.pgn(id)
  livemove<-function(pgn){
    add.move(id,pgn)
  }
  lapply(pgn,livemove)
}

download.pgn<-function(id,update=TRUE){
  if(nchar(id)==9){
    URL<-paste("http://www.chess.com/echess/download_pgn?id=",id,sep="")
  }
  if(nchar(id)==10){
    URL<-paste("http://www.chess.com/echess/download_pgn?lid=",id,sep="")
  }
  filepath<-paste("C:/Users/Josh/Documents/Chess/PGN/",id,".pgn",sep="")
  if((file.exists(filepath)==FALSE) |
       (update==TRUE)){
         download.file(URL,filepath)
       }
}

notate.pgn<-function(id){
  pgn<-read.pgn(id)
  pgn<-read.table(textConnection(pgn),sep=".",colClasses="character",comment.char="")
  pgn<-matrix(pgn,nrow=ncol(pgn),ncol=1)
  white<-function(n){
    n<-n+1
    as.character(read.table(textConnection(as.character(pgn[n,])),sep=" ")$V1)
  }
  black<-function(n){
    n<-n+1
    as.character(read.table(textConnection(as.character(pgn[n,])),sep=" ")$V2)
  }
  white<-unlist(lapply(1:(length(pgn)-1),white))
  black<-unlist(lapply(1:(length(pgn)-1),black))
  whitepaste<-function(n){
    paste(n,white[n],sep=".")
  }
  blackpaste<-function(n){
    paste(n,black[n],sep="...")
  }
  white<-unlist(lapply(1:length(pgn),whitepaste))
  black<-unlist(lapply(1:length(pgn),blackpaste))
  all<-sort(c(white,black))
  all<-subset(all,grepl("NA",all)==FALSE)
  return(all)
}

read.pgn<-function(id){
  download.pgn(id)
  pgnpath<-paste("C:/Users/Josh/Documents/Chess/PGN/",id,".pgn",sep="")
  linecol<-function(n){
    if(readLines(pgnpath)[n]==""){
      return(0)
    }
    if(!(readLines(pgnpath)[n]=="")){
      return(ncol(read.table(textConnection(readLines(pgnpath)[n]))))
    }
    grepl(readLines(pgnpath)[n],metaproperties)
  }
  lineclass<-function(n){
    if(n==length(readLines(pgnpath))){
      return("pgn")
    }
    if(n==(length(readLines(pgnpath))-1)){
      return("pgn")
    }
    if(n<(length(readLines(pgnpath))-1) & linecol(n)==3){
      return("meta")
    }
    if((n<(length(readLines(pgnpath))-1)) & (3<linecol(n))){
      return("pgn")
    }
    if(linecol(n)==0){
      return("blank")
    }
  }
  df<-data.frame(n=1:length(readLines(pgnpath)),
                 Lclass=unlist(lapply(1:length(readLines(pgnpath)),lineclass)))
  m<-subset(df$n,df$Lclass=="pgn")
  l<-min(m)
  pgn<-paste(readLines(pgnpath)[l])
  while(l<max(m)){
    pgn<-paste(pgn,readLines(pgnpath)[l+1])
    l<-(l+1)
  }
  return(pgn)
}

# Does not yet work
# Error in download.file(URL, destfile = filepath) : unsupported URL scheme
download.pgn<-function(ID,pgnfolder="C:/Users/Josh/Documents/pgn",gamename=ID){
  if(file.exists(pgnfolder)==FALSE){
    dir.create(pgnfolder)
  }
  URL<-paste('www.chess.com/echess/download_pgn?lid=',ID,sep="")
  filepath<-paste(pgnfolder,'/',gamename,'.pgn',sep="")
  download.file(URL,destfile=filepath)
  print(read.table(paste(pgnfolder,'/',ID,'.pgn',sep=""),skip=8)[1,])
}

properties.pgn<-function(pgn){
  chesscolor<-function(pgn){
    if(ncol(read.table(textConnection(pgn),sep="."))==4){
      return("black")
    }
    if(ncol(read.table(textConnection(pgn),sep="."))==2){
      return("white")
    }
    if(!(ncol(read.table(textConnection(pgn),sep=".")) %in% c(2,4))){
      stop("invalid number of dots")
    }
  }
  movenumber<-function(pgn){
    read.table(textConnection(pgn),sep=".")[1,1]
  }
  piece<-function(pgn){
    test<-function(L){grepl(L,pgn)}
    P<-c("K","Q","R","N","B","O")
    Piece=c("King","Queen","Rook","Knight","Bishop","King & Rook")
    df<-data.frame(P=P, Piece=Piece,assess=unlist(lapply(P,test)))
    if(sum(df$assess)==0){
      return("pawn")
    }
    if(sum(df$assess)==1){
      return(as.character(subset(df$Piece,df$assess==TRUE)))
    }
    if(1<sum(df$assess)){
      stop("Input contains extra piece")
    }
  }
  upboard<-function(x){
    if(!(tolower(x) %in% c(1:8,letters[1:8]))){
      stop("invalid X coordinate")
    }
    if(tolower(x) %in% letters[1:8]){
      return(paste(tolower(x),1:8,sep=""))
    }
    if(x %in% 1:8){
      return(paste(letters[x],1:8,sep=""))
    }
  }
  test<-function(sq){grepl(sq,pgn)}
  sq<-c(unlist(lapply(1:8,upboard)),"O")
  replic8<-function(x){
    replicate(8,x)
  }
  x<-c(unlist(lapply(letters[1:8],replic8)),"multiple")
  y<-c(rep(1:8,times=8),"1|8")
  df<-data.frame(sq=sq, x=x,y=y,assess=unlist(lapply(sq,test)))
  xcoor<-function(pgn){
    return(as.character(subset(df$x,df$assess==TRUE)))
  }
  ycoor<-function(pgn){
    return(as.character(subset(df$y,df$assess==TRUE)))
  }
  sqcoor<-function(pgn){
    return(as.character(subset(df$sq,df$assess==TRUE)))
  }
  capture<-function(pgn){
    if(grepl("x",pgn)==TRUE){
      return("capture")
    }
    else{
      return("none")
    }
  }
  return(list(pgn=pgn,
              color=chesscolor(pgn),
              move=movenumber(pgn),
              piece=piece(pgn),
              x=xcoor(pgn),
              y=ycoor(pgn),
              sq=sqcoor(pgn)))
}
## 


completeID<-function(ID){
  sample1<-sort(as.numeric(subset(chesspgn$move,chesspgn$ID==ID & chesspgn$color=="white")))
  test1<-ifelse((length(sample1)!=0),identical(paste(sample1),paste(1:max(sample1))),FALSE)
  sample2<-sort(as.numeric(subset(chesspgn$move,chesspgn$ID==ID & chesspgn$color=="black")))
  test2<-ifelse((length(sample2)!=0),identical(paste(sample2),paste(1:max(sample2))),FALSE)
  ifelse((test1==TRUE & test2==TRUE),return("complete"),return("incomplete"))
}

crossboard<-function(y){
  if(!(y %in% 1:8)){
    stop("invalid y coordinate")
  }
  paste(letters[1:8],y,sep="")
}

upboard<-function(x){
  if(!(tolower(x) %in% c(1:8,letters[1:8]))){
    stop("invalid X coordinate")
  }
  if(tolower(x) %in% letters[1:8]){
    return(paste(tolower(x),1:8,sep=""))
  }
  if(x %in% 1:8){
    return(paste(letters[x],1:8,sep=""))
  }
}

pgnpiece<-function(pgn){
  test<-function(L){grepl(L,pgn)}
  P<-c("K","Q","R","N","B","O")
  Piece=c("King","Queen","Rook","Knight","Bishop","King&Rook")
  df<-data.frame(P=P, Piece=Piece,assess=unlist(lapply(P,test)))
  if(sum(df$assess)==0){
    return("pawn")
  }
  if(sum(df$assess)==1){
    return(as.character(subset(df$Piece,df$assess==TRUE)))
  }
  if(1<sum(df$assess)){
    stop("Input contains extra piece")
  }
}

movenumber<-function(pgn){
  read.table(textConnection(pgn),sep=".")[1,1]
}

add.move<-function(ID,pgn){
  if(nchar(ID)==10){type<-"livechess"}
  if(nchar(ID)==9){type<-"echess"}
  if(!(pgn %in% subset(chesspgn$pgn,chesspgn$ID==ID))){
    filepath<-"C:/Users/Josh/Documents/chess/chesspgn.csv"
    chesspgn<-read.csv(filepath,colClasses="character")
    color<-properties.pgn(pgn)$color
    move<-properties.pgn(pgn)$move
    piece<-properties.pgn(pgn)$piece
    xcoor<-properties.pgn(pgn)$x
    ycoor<-properties.pgn(pgn)$y
    sq<-properties.pgn(pgn)$sq
    newrow<-c(type,ID,pgn,color,move,piece,xcoor,ycoor,sq)
    chesspgn<-rbind(chesspgn,newrow)
    write.csv(unique(chesspgn),
              filepath,
              row.names=FALSE)
  }
  tail(read.csv(filepath),2)
}

road.toll<-function(Date,Time,Location,Toll,Admin,pg,of,ID){
  newrow<-c(Date,Time,Location,Toll,Admin,pg,of,ID)
  filepath<-"C:/Users/Josh/Documents/CSV Personal/tollroads.csv"
  tollroads<-rbind(read.csv(filepath,colClasses="character"),
                   newrow)
  write.csv(tollroads,filepath,row.names=FALSE)
  print(tail(tollroads, 3))
}

add.toll<-function(AmtDue,DateDue,Start,End,Unpaid,NewT,NewF,Hypo,nth){
  newrow<-c(AmtDue,DateDue,Start,End,Unpaid,NewT,NewF,Hypo,nth)
  filepath<-"C:/Users/Josh/Documents/CSV Personal/tolls.csv"
  tollframe<-rbind(read.csv(filepath,colClasses="character"),
                   newrow)
  write.csv(tollframe,filepath,row.names=FALSE)
  print(tail(tollframe, 3))
}

finddoc<-function(keyword){
  if(tolower(keyword) %in% c('clock','timeclock','chessclock','punch','timepunch','clock.csv')){
    return(list(filepath="C:/Users/Josh/Documents/CSV Personal/clock.csv",
                docname="clock"))
  }
  if(tolower(keyword) %in% c('article','articles','articles.csv','news')){
    return(list(filepath="C:/Users/Josh/Documents/CSV/Articles.csv",
                docname="articles"))
  }
  if(tolower(keyword) %in% c('article quotes','article quote','artiquote','artiquotes')){
    return(list(filepath="C:/Users/Josh/Documents/CSV Personal/artiquote.csv",
                docname="artiquote"))
  }
  if(tolower(keyword) %in% c('raw notes','notes.csv','notes','note')){
    return(list(filepath="C:/Users/Josh/Documents/CSV Personal/notes.csv",
                docname="notes"))
  }
  if(tolower(keyword) %in% c('sorted notes','note2','notes2','notes2.csv')){
    return(list(filepath="C:/Users/Josh/Documents/CSV Personal/notes2.csv",
                docname="notes2"))
  }
  if(tolower(keyword) %in% c('coursera','coursera.csv','coursera.note','coursera notes','coursera note')){
    return(filepath="C:/Users/Josh/Documents/CSV Personal/coursera.csv",
           docname="coursera")
  }
}

cell.modify<-function(Var, row, col, mod){
  recpath<-"C:/Users/Josh/Documents/CSV Personal/records_modify_cell.csv"
  filepath<-finddoc(Var)$filepath
  Var<-finddoc(Var)$docname
  X<-read.csv(filepath, colClasses="character")
  before<-X[row,col]
  X[row,col]<-mod
  write.csv(X, filepath, row.names=FALSE)
  records_modify_cell<-read.csv(recpath, colClasses='character')
  new_modify_cell<-data.frame(Var=Var,
                              row=row,
                              col=col,
                              before=before,
                              after=mod,
                              time=paste(Sys.time()))
  records_modify_cell<-rbind(records_modify_cell, new_modify_cell)
  write.csv(records_modify_cell, recpath, row.names=FALSE)
  list(changed=read.csv(filepath)[c((row-1):(row+1)),],
       recorded=tail(read.csv(recpath),3))
}

tailall<-function(clock=1,articles=2,artiquote=1,notes=2,notes2=2,coursera=2){
  list(
    'clock'=tail(
      as.matrix(read.csv("C:/Users/Josh/Documents/CSV Personal/clock.csv")),
      clock),
    'articles'=tail(
      as.matrix(read.csv("C:/Users/Josh/Documents/CSV/Articles.csv")),
      articles),
    'Article Quotes'=tail(
      as.matrix(read.csv("C:/Users/Josh/Documents/CSV Personal/artiquote.csv")),
      artiquote),
    'raw notes'=tail(
      as.matrix(read.csv("C:/Users/Josh/Documents/CSV Personal/notes.csv")),
      notes),
    'sorted notes'=tail(
      as.matrix(read.csv("C:/Users/Josh/Documents/CSV Personal/notes2.csv")),
      notes2),
    'coursera notes'=tail(
      as.matrix(read.csv("C:/Users/Josh/Documents/CSV Personal/coursera.csv")),
      coursera))
}

add.note2<-function(category,note,time=Sys.time()){
  note2<-as.matrix(read.csv("C:/Users/Josh/Documents/CSV Personal/notes2.csv",colClasses="character"))
  add2<-as.matrix(data.frame(note,time,category))
  note2<-rbind(note2,add2)
  write.csv(note2,"C:/Users/Josh/Documents/CSV Personal/notes2.csv",row.names=FALSE)
  print(
    as.character(
      unique(
        read.csv("C:/Users/Josh/Documents/CSV Personal/notes2.csv")$category
        )
      )
    )
  print(tail(subset(note2,note2[,3]==category),3))
}

artiquote<-function(art_number,art_quote,time=Sys.time()){
  artiquote<-as.matrix(read.csv("C:/Users/Josh/Documents/CSV Personal/artiquote.csv",colClasses="character"))
  addquote<-as.matrix(data.frame(art_quote,time,art_number))
  artiquote<-rbind(artiquote,addquote)
  write.csv(artiquote,"C:/Users/Josh/Documents/CSV Personal/artiquote.csv",row.names=FALSE)
  print(tail(artiquote,3))
}

subset.note<-function(newfilepath,newfilename, vector){
  X<-as.matrix(read.csv("C:/Users/Josh/Documents/CSV Personal/notes.csv",colClasses="character"))
  X<-X[order(X[,1]),]
  newfilename<-subset(X,X[vector,])
  X<-subset(X,X[-vector,])
  write.csv(newfilename, newfilepath, row.names=FALSE)
  write.csv(X, "C:/Users/Josh/Documents/CSV Personal/notes.csv", row.names=FALSE)
  print(tail(read.csv("C:/Users/Josh/Documents/CSV Personal/coursera.csv"),3))
  View(newfilename)
}

coursera.note<-function(note, course, category,week,time=Sys.time(),validity=NA){
  X<-as.matrix(read.csv("C:/Users/Josh/Documents/CSV Personal/coursera.csv",colClasses="character"))
  rw<-nrow(X)+1
  Y<-as.matrix(data.frame(rw,note,time,course,category,validity,week))
  Z<-rbind(X,Y)
  write.csv(Z, "C:/Users/Josh/Documents/CSV Personal/coursera.csv", row.names=FALSE)
  print(tail(Z,3))
}

view.uncategorized<-function(n){
  objects<-read.csv("C:/Users/Josh/Documents/CSV Personal/paper.csv",
                    colClasses="character")
  subset(objects[,1], objects[,6]=="" & objects[,7]=="")[n]
}

view.material<-function(n){
  objects<-read.csv("C:/Users/Josh/Documents/CSV Personal/paper.csv",
                    colClasses="character")
  selection<-sort(unique(objects$material)[n])
  subset(objects[,1],objects[,6]==selection)
}

lapply(1:length(unique(objects$object)),view.object)
view.object<-function(n){
  objects<-read.csv("C:/Users/Josh/Documents/CSV Personal/paper.csv",colClasses="character")
  selection<-sort(unique(objects$object)[n])
  subset(objects[,1],objects[,2]==selection)
}

add.film<-function(Film,genre,recommend,Time=Sys.time()){
  filmlist<-as.matrix(read.csv("C:/Users/Josh/Documents/CSV Personal/filmlist.csv",
                               colClasses="character"))
  film<-as.matrix(data.frame(Film,genre,recommend,Time))
  filmlist<-rbind(filmlist,film)
  write.csv(filmlist,"C:/Users/Josh/Documents/CSV Personal/filmlist.csv", 
            row.names=FALSE)
  print(tail(read.csv("C:/Users/Josh/Documents/CSV Personal/filmlist.csv"),3))
}

rm.paper<-function(paper,comment,time=Sys.time()){
  X<-as.matrix(read.csv("C:/Users/Josh/Documents/CSV Personal/rmpaper.csv"))
  Y<-as.matrix(data.frame(paper,comment,time))
  Z<-rbind(X,Y)
  write.csv(Z,"C:/Users/Josh/Documents/CSV Personal/rmpaper.csv",row.names=FALSE)
  print(tail(read.csv("C:/Users/Josh/Documents/CSV Personal/rmpaper.csv"),3))
}

add.object<-function(object,location,comment="",time=Sys.time()){
  objects<-as.matrix(read.csv("C:/Users/Josh/Documents/CSV Personal/paper.csv"))
  Y<-as.matrix(data.frame(object,location,time,comment))
  objects<-rbind(X,Y)
  write.csv(objects,"C:/Users/Josh/Documents/CSV Personal/paper.csv",row.names=FALSE)
  print(tail(objects,3))
}

add.note<-function(note,Time=Sys.time()){
  notes<-as.matrix(read.csv("C:/Users/Josh/Documents/CSV Personal/notes.csv",colClasses="character"))
  obs<-as.matrix(data.frame(note,Time))
  notes<-rbind(notes,obs)
  write.csv(notes,"C:/Users/Josh/Documents/CSV Personal/notes.csv",row.names=FALSE)
  print(tail(notes,3))
}

clock<-function(punch,comment=""){
  X<-as.matrix(read.csv("C:/Users/Josh/Documents/CSV Personal/clock.csv",colClasses="character"))
  Y<-as.matrix(data.frame(punch,Sys.time(),comment))
  Z<-rbind(X,Y)
  write.csv(Z,"C:/Users/Josh/Documents/CSV Personal/clock.csv",row.names=FALSE)
  print(tail(read.csv("C:/Users/Josh/Documents/CSV Personal/clock.csv"),3))
}

variables.csv<-function(folder){
  list.files<-function(n){
    replicate(ncol(read.csv(Sys.glob("*csv")[n])),Sys.glob("*csv")[n])
  }
  varnames<-function(n){
    colnames(read.csv(Sys.glob("*csv")[n]))
  }
  data.frame(file=as.matrix(unlist(lapply(1:length(Sys.glob("*csv")),list.files))),
             variable=as.matrix(unlist(lapply(1:length(Sys.glob("*csv")),varnames))))
}

colnames(read.csv(list.files()[n],row.names = NULL))

variables<-as.vector(read.csv("C:/Users/Josh/Documents/CSV/variables.csv")[,1])
quarterpath<-"C:/Users/Josh/Documents/All_Reports/All_Reports_19921231"
var.deficit<-function(variables,quarterpath){
  folder.variables<-function(quarterpath){
    varnames<-function(n){
      as.matrix(colnames(read.csv(list.files(quarterpath)[n],row.names=NULL)))
    }
    return(sort(unique(unlist(lapply(1:length(list.files()),varnames)))))
  }
  qvariables<-folder.variables(quarterpath)
  return(c(deficit.variables=subset(variables,!(variables %in% qvariables))))
}

directories<-c("C:/Users/Josh/Documents/All_Reports_20140630",
               "C:/Users/Josh/Documents/All_Reports/All_Reports_19921231")
var.masterlist<-function(directories){
  folder.variables<-function(quarterpath){
    varnames<-function(n){
      as.matrix(colnames(read.csv(list.files(quarterpath)[n],row.names = NULL)))
    }
    return(sort(unique(unlist(lapply(1:length(list.files()),varnames)))))
  }
  return(unique(unlist(lapply(directories,folder.variables))))
}
variables<-var.masterlist(directories)
write.csv(variables,"variables.csv",row.names=FALSE)

quarterpath1<-"C:/Users/Josh/Documents/All_Reports_20140930"
quarterpath2<-"C:/Users/Josh/Documents/All_Reports_20140630"
var.added<-function(quarterpath1,quarterpath2){
  folder.variables<-function(quarterpath){
    varnames<-function(n){
      as.matrix(colnames(read.csv(list.files(quarterpath)[n],row.names = NULL)))
    }
    return(sort(unique(unlist(lapply(1:length(list.files()),varnames)))))
  }
  quarter1<-folder.variables(quarterpath1)
  quarter2<-folder.variables(quarterpath2)
  return(subset(quarter2,!(quarter2[1:2] %in% quarter1)))
}
var.subtracted<-function(quarterpath1,quarterpath2){
  resetwd<-getwd()
  folder.variables<-function(quarterpath){
    setwd(quarterpath)
    colnames<-function(n){
      as.matrix(colnames(read.csv(list.files()[],row.names = NULL)))
    }
    return(sort(unique(unlist(lapply(1:length(list.files()),colnames)))))
  }
  quarter1<-folder.variables(quarterpath1)
  quarter2<-folder.variables(quarterpath2)
  return(subset(quarter1,!(quarter1 %in% quarter2)))
}

folder.cert<-function(quarterpath){
  resetwd<-getwd()
  setwd(quarterpath)
  file.cert<-function(n){
    return(unique(read.csv(list.files()[n],row.names=NULL)$cert))
  }
  return(unique(unlist(lapply(1:length(list.files()),file.cert))))
  setwd(resetwd)
}

file.cert<-function(filepath){
  return(unique(read.csv(filepath)$cert))
}

folder.variables<-function(quarterpath){
  resetwd<-getwd()
  setwd(quarterpath)
  varnames<-function(n){
    as.matrix(colnames(read.csv(list.files()[n],row.names = NULL)))
  }
  return(sort(unique(unlist(lapply(1:length(list.files()),varnames)))))
  setwd(resetwd)
}

add.paper<-function(Aut,Yr,Ttl,Jrnl,Vol,Num,Pgs){
  resetwd<-getwd()
  setwd("C:/users/Josh/Documents/CSV")
  X<-read.csv("Papers.csv",colClasses="character")
  Y<-rbind(X,c(Aut,Yr,Ttl,Jrnl,Vol,Num,Pgs))
  write.csv(Y,"Papers.csv",row.names=FALSE)
  print(tail(read.csv("Papers.csv"),3))
  setwd(resetwd)
}

add.text<-function(From,To,Time,Text){
  X<-read.csv("C:/users/Josh/Documents/CSV Personal/Texts.csv",colClasses="character")
  Y<-rbind(X,c(From,To,Time,Text))
  write.csv(Y,"C:/users/Josh/Documents/CSV Personal/Texts.csv",row.names=FALSE)
  print(tail(read.csv("C:/users/Josh/Documents/CSV Personal/Texts.csv"),3))
}

add.phrase<-function(author,phrase){
  phrasepath<-"C:/Users/Josh/Documents/CSV Personal/phrasebox.csv"
  X<-read.csv(phrasepath,colClasses="character")
  Z<-rbind(X,c(author,phrase))
  write.csv(Z,phrasepath,row.names=FALSE)
  print(tail(read.csv(phrasepath),3))
  setwd(resetwd)
}

add.bill<-function(Corp,
                   Prdt,
                   Chrg,
                   Pmnt,
                   Per.,
                   Due,
                   P.Dt,
                   Cnfm){
  resetwd<-getwd()
  setwd("C:/Users/Josh/Documents/CSV Personal")
  X<-read.csv("liv_exp.csv",colClasses="character")
  Z<-rbind(X,c(Corp,Prdt,Chrg,Pmnt,Per.,Due,P.Dt,Cnfm))
  write.csv(Z,"liv_exp.csv",row.names=FALSE)
  print(tail(read.csv("liv_exp.csv"),3))
  setwd(resetwd)
}

add.link<-function(link){
  resetwd<-getwd()
  setwd("C:/Users/Josh/Documents/CSV")
  X<-read.csv("listoflinks.txt")
  Y<-rbind(as.matrix(X[,2]),c("https://www.youtube.com/watch?v=D25l1SWOF9M&app=desktop"))
  write.csv(Y,"listoflinks.csv",row.names=FALSE)
  print(tail(read.csv("listoflinks.csv"),3))
}

add.article<-function(Author,
                      Title,
                      Organization,
                      Site,
                      Date,
                      From){
  articles<-read.csv("C:/Users/Josh/Documents/CSV/Articles.csv",colClasses="character")
  Y<-data.frame(Author=as.matrix(append(as.vector(articles$Author),Author)),
                Title=as.matrix(append(as.vector(articles$Title),Title)),
                Organization=as.matrix(append(as.vector(articles$Organization),Organization)),
                Site=as.matrix(append(as.vector(articles$Site),Site)),
                Date=as.matrix(append(as.vector(articles$Date),Date)),
                From=as.matrix(append(as.vector(articles$From),From)))
  write.csv(Y,"C:/Users/Josh/Documents/CSV/Articles.csv", row.names=FALSE)
  print(tail(Y,3))
}

getline<-function(m,n){
  setwd("C:/Users/Josh/Documents/CSV")
  readLines(getElement(list.files(),m))[n]
}

readcsv<-function(n){
  setwd("C:/Users/Josh/Documents/CSV")
  if(class(n)=="numeric"){
    read.csv(getElement(list.files(),n))
  }
  else{
    read.csv(n)
  }
}
m<-2
n<-1

pollutantmean<-function(directory, pollutant, id=1:332){
  setwd(directory)
  count.nitrate<-function(n){
    length(subset(read.csv(getElement(Sys.glob("*csv"),n))$nitrate,
                  !is.na(read.csv(getElement(Sys.glob("*csv"),n))$nitrate)))
  }
  count.sulfate<-function(n){
    length(subset(read.csv(getElement(Sys.glob("*csv"),n))$sulfate,
                  !is.na(read.csv(getElement(Sys.glob("*csv"),n))$sulfate)))
  }
  sum.nitrate<-function(n){
    sum(read.csv(getElement(Sys.glob("*csv"),n))$nitrate,na.rm=TRUE)
  }
  sum.sulfate<-function(n){
    sum(read.csv(getElement(Sys.glob("*csv"),n))$sulfate,na.rm=TRUE)
  }
  extraction<-data.frame(count_N=as.matrix(lapply(id, count.nitrate)),
                         count_S=as.matrix(lapply(id, count.sulfate)),
                         sum_N=as.matrix(lapply(id, sum.nitrate)),
                         sum_S=as.matrix(lapply(id, sum.sulfate)))
  mean.nitrate<-(sum(as.numeric(extraction$sum_N))/
                   sum(as.numeric(extraction$count_N)))
  mean.sulfate<-(sum(as.numeric(extraction$sum_S))/
                   sum(as.numeric(extraction$count_S)))
  if (toupper(pollutant)=="NITRATE"){?
    return(mean.nitrate)
    print(mean.nitrate)
  }
  if (toupper(pollutant)=="SULFATE"){
    return(mean.sulfate)
    print(mean.nitrate)
  }
}

sum.sulfate<-function(id){
  sum(read.csv(getElement(Sys.glob("*csv"),id))$sulfate, na.rm=TRUE)
}

sum.nitrate<-function(id){
  sum(read.csv(getElement(Sys.glob("*csv"),id))$nitrate, na.rm=TRUE)
}

count.sulfate<-function(id){
  sulfate<-read.csv(getElement(Sys.glob("*csv"),id))$sulfate
  length(subset(sulfate,
                !is.na(sulfate)))
}

count.nitrate<-function(id){
  nitrate<-read.csv(getElement(Sys.glob("*csv"),id))$nitrate
  length(subset(nitrate,
         !is.na(nitrate)))
}

read.pollutant<-function(n){
  if (pollutant=="sulfate"){
    selection<-subset(read.csv(getElement(Sys.glob("*csv"),n))$sulfate,
                      !is.na(read.csv(getElement(Sys.glob("*csv"),n))$sulfate))
  }
  if (pollutant=="nitrate"){
    selection<-subset(read.csv(getElement(Sys.glob("*csv"),n))$nitrate,
                      !is.na(read.csv(getElement(Sys.glob("*csv"),n))))
  }
  return(selection)
}


list.pollutant<-function(n){
  if (pollutant=="sulfate"){
    selection<-as.numeric(
      as.character(
        read.csv(
          getElement(Sys.glob("*csv"),n))$sulfate)
    subset.pollutant<-subset(selection, !is.na(selection))
  }
}

read.pollutants<-function(id){
  lapply(id, read.pollutant)
}

read.pollutant<-function(n){
  if (pollutant=="sulfate"){
    selection<-read.csv(getElement(Sys.glob("*csv"),n))$sulfate
  }
  if (pollutant=="nitrate"){
    selection<-read.csv(getElement(Sys.glob("*csv"),n))$nitrate
  }
  print(selection)
}

countfrom<-function(n){sum(From==unique(From)[n])}

stateset<-function(State){subset(medgrid,medgrid[,2]==State)}#"2014-10-27 16:53:22 CDT"

medvariables<-function(n){getElement(colnames(read.csv("outcome-of-care-measures.csv")), n)}

alllinks<-function(){
  resetwd<-getwd()
  setwd("C:/Users/Josh/Documents/CSV")
  Author<-as.matrix(read.csv("articles.csv")$Author)
  Date<-as.matrix(read.csv("articles.csv")$Date)
  Organization<-as.matrix(read.csv("articles.csv")$Organization)
  From<-as.matrix(read.csv("articles.csv")$From)
  articlegrid<-data.frame(Author, Date, Organization, From)
  as.matrix(
    lapply(
      unique(
        articlegrid$From), 
      manylinks)
  )
  print()
  setwd(resetwd)
}

manylinksnum<-function(){getElement(manylinks(1),2)}

manylinks<-function(n){
  setwd("C:/Users/Josh/Documents/CSV")
  Author<-as.matrix(read.csv("articles.txt")$Author)
  Date<-as.matrix(read.csv("articles.txt")$Date)
  Organization<-as.matrix(read.csv("articles.txt")$Organization)
  From<-as.matrix(read.csv("articles.txt")$From)
  articlegrid<-data.frame(Author, Date, Organization, From)
  data.frame(From=unique(From)[n],
             Links=sum(
               articlegrid$From==unique(
                 articlegrid$From)[n]
               )
             )
}

splitandframe<-function(m,n){
  setwd("C:/Users/Josh/Documents/CSV")
  Author<-as.matrix(read.csv("articles.txt")$Author)
  Date<-as.matrix(read.csv("articles.txt")$Date)
  Organization<-as.matrix(read.csv("articles.txt")$Organization)
  From<-as.matrix(read.csv("articles.txt")$From)
  data.frame(Au=subset(Author, m==unique(m)[n]), 
             Org=subset(Organization, m==unique(m)[n]), 
             Dt=subset(Date, m==unique(m)[n]), 
             Frm=subset(From, m==unique(m)[n]))}

splitandframe<-function(column,n){
  data.frame(Author=subset(Author, column==unique(column)[n]), 
             Organization=subset(Organization, column==unique(column)[n]), 
             Date=subset(Date, column==unique(column)[n]), 
             From=subset(From, column==unique(column)[n]))}

effectivesplit<-function(n){
  Author<-as.matrix(read.csv("articles.txt")$Author)
  Date<-as.matrix(read.csv("articles.txt")$Date)
  Organization<-as.matrix(read.csv("articles.txt")$Organization)
  From<-as.matrix(read.csv("articles.txt")$From)
  data.frame(Author=subset(Author, From==unique(From)[n]), 
             Organization=subset(Organization, From==unique(From)[n]), 
             Date=subset(Date, From==unique(From)[n]), 
             From=subset(From, From==unique(From)[n]))}

corr<-function(directory, threshold){
  setwd(directory)
  complete<-function(file){nrow(subset(
    read.csv(file),
    is.na(getElement(read.csv(file), 2)) &
    is.na(getElement(read.csv(file), 3))))}
  complete("001.csv")
  corrsingle<-function(n){
    file<-read.csv(getElement(list.files(), n))
    complete<-subset(
      file, 
      !is.na(getElement(file, 2)) & 
        !is.na(getElement(file,3)))
    cor(complete[,2], complete[,3])
  }
  completes<-as.matrix(lapply(list.files(), complete))
  thresh<-as.matrix(subset(data.frame(list.files(), completes), completes>=threshold))
  lapply(thresh, corrsingle)
}
threshold<-1000
setwd("C:\\Users\\Josh\\Documents\\CSV\\Specdata")
## 'threshold' is a numeric vector of length 1 indicating the
## number of completely observed observations (on all
## variables) required to compute the correlation between
## nitrate and sulfate; the default is 0
threshsubset<-function(directory, threshold){
  setwd(directory)
  complete<-function(file){nrow(subset(
    read.csv(file), 
    !is.na(getElement(read.csv(file), 2)) & 
      !is.na(getElement(read.csv(file), 3))))}
  completes<-as.matrix(lapply(list.files(),complete))
  subset(data.frame(list.files(), completes), completes>=threshold)
}
threshold<-1000
threshsubset("specdata", 400)
# Error in object[[name, exact = TRUE]] : subscript out of bounds 
#@"2014-10-23 23:02:18 CDT"

setwd("C:\\Users\\Josh\\Documents\\CSV")
corrsingle<-function(directory, id){  
  setwd(directory)
  file<-read.csv(getElement(list.files(), id))
  complete<-subset(
    file, 
    !is.na(getElement(file, 2)) & 
      !is.na(getElement(file,3)))
  cor(complete[,2], complete[,3])
}
id<-2
corrsingle("C:\\Users\\Josh\\Documents\\CSV\\specdata", 1) # -0.2225526
corrsingle("specdata", 2) # -0.01895754
corrsingle("specdata", 3) # -0.1405125
#@"2014-10-23 22:20:05 CDT"

testquotes<-function(document){
  setwd("C:\\Users\\Josh\\Documents\\CSV")
  tail(read.csv(document, quote="",row.names=NULL, stringsAsFactors=FALSE))
}
testquotes("quotes.txt")

testcsv<-function(document,n){
  setwd("C:\\Users\\Josh\\Documents\\CSV")
  tail(read.csv(document, row.names=NULL), n)
}
testcsv("subset.txt")
testcsv("subseterrors.txt")
testcsv("articles.txt", 20)
testcsv("coursera tasks.txt", 34)

#@"2014-10-20 12:16:20 CDT"
complete<-function(directory, id){
  setwd("C:\\Users\\Josh\\Documents\\CSV")
  setwd(directory)
  read<-function(id){getElement(list.files(), id)} 
  files<-lapply(id, read)
  nob<-function(id){
    nrow(subset(
      read.csv(getElement(list.files(), id)), 
      !is.na(read.csv(getElement(list.files(), id))$sulfate) & 
        !is.na(read.csv(getElement(list.files(), id))$nitrate)))
  }
  data.frame(id, nobs=as.matrix(lapply(id, nob)))
}

#@"2014-10-19 18:48:15 CDT"
complete<-function(directory, id){
  setwd("C:\\Users\\Josh\\Documents\\CSV")
  setwd(directory)
  read<-function(id){getElement(list.files(), id)}
  files<-lapply(id, read)
  nob<-function(id){
    nrow(subset(
      read.csv(getElement(list.files(), id)), 
      !is.na(read.csv(getElement(list.files(), id))$sulfate) & 
        !is.na(read.csv(getElement(list.files(), id))$nitrate)))
  }
  lapply(files, nob)
}
complete("specdata", 2)
# Err subscript out of bounds

#@"2014-10-19 17:57:50 CDT"
read<-function(id){read.csv(getElement(list.files(), id))}

#@"2014-10-19 17:38:08 CDT"
complete<-function(directory, id){
  setwd("C:\\Users\\Josh\\Documents\\CSV")
  setwd(directory)
  nobs<-function(directory, id){
    nrow(subset(
      read.csv(getElement(list.files(), id)),
      !is.na(read.csv(getElement(list.files(), id))$sulfate) &
         !is.na(read.csv(getElement(list.files(), id))$nitrate))) 
  }
  for (n in id) {
    rslt <-  nob(directory, n)
    print(nob (directory, n))
  }
  data.frame(id, nobs=as.matrix(lapply(id, nobs)))
}
complete("specdata", 1) # [1] 117 WARNING
complete("specdata", 1:2) # Err 
complete("specdata", c(1,2))

#@"2014-10-19 17:12:18 CDT"
complete<-function(directory, id){
  setwd("C:\\Users\\Josh\\Documents\\CSV")
  setwd(directory)
  nobs<-function(directory, id){
    nrow(subset(
      read.csv(getElement(list.files(), id)), 
      !is.na(read.csv(getElement(list.files(), id))$sulfate) & 
        !is.na(read.csv(getElement(list.files(), id))$nitrate)))
  }
  for (n in id) {
    rslt <-  nob(directory, n)
    print(nob (directory, n))
  }
  #  data.frame(id = as.vector(id), nobs = as.vector(nob(directory, id)))
}
complete("specdata", c(1,2))

  cbind(id, nobs)
}
nobs(2)
complete(2)
id<-2

complete<-function(directory, id){
  setwd("C:\\Users\\Josh\\Documents\\CSV")
  setwd(directory)
  nob<-function(directory, id){
    nrow(subset(
      read.csv(getElement(list.files(), id)), 
      !is.na(read.csv(getElement(list.files(), id))$sulfate) & 
        !is.na(read.csv(getElement(list.files(), id))$nitrate)))
  }
  for (n in id) {
    rslt <-  nob(directory, n)
    print(nob (directory, n))
  }
  #  data.frame(id = as.vector(id), nobs = as.vector(nob(directory, id)))
}
complete("specdata", c(1,2))

#@"2014-10-18 23:56:04 CDT"
multiples<-function(id, n){
  data.frame(id,n)
}
multiples(c(1,3,5), c(2,4,6))
## successful

#@"2014-10-18 23:44:52 CDT"
complete<-function(directory, id){
  setwd("C:\\Users\\Josh\\Documents\\CSV")
  setwd(directory)
  nob<-function(directory, id){
    nrow(subset(
      read.csv(getElement(list.files(), id)), 
      !is.na(read.csv(getElement(list.files(), id))$sulfate) & 
        !is.na(read.csv(getElement(list.files(), id))$nitrate)))
  }
  for (n in id) {
    nobs <-  nob(directory, n)
    print(c(id,nobs (directory, n)))
  }
  #  data.frame(id = as.vector(id), nobs = as.vector(nob(directory, id)))
}
complete("specdata", c(1,2))
# Err subscript out of bounds

#@"2014-10-18 23:23:15 CDT"
complete<-function(id){
  nobs<-nrow(subset(read.csv(getElement(list.files(),id)),
              !is.na(read.csv(getElement(list.files(),id))$sulfate) &
                !is.na(read.csv(getElement(list.files(), id))$nitrate)))
  frame<-data.frame(id,nobs)
  for (n in id) {
    rslt <- nrow(subset(read.csv(getElement(list.files(),n)),
                        !is.na(read.csv(getElement(list.files(),n))$sulfate) &
                          !is.na(read.csv(getElement(list.files(),n))$nitrate)))
    frame<-data.frame(n,rslt)
  }
  print(frame)
}
## complete(integer) works, complete(vector) doesn't


#@"2014-10-18 23:15:51 CDT"
complete<-function(directory, id){
  setwd("C:\\Users\\Josh\\Documents\\CSV")
  setwd(directory)
  for (n in id) {
    rslt <- nrow(subset(read.csv(getElement(list.files(),n)),
                        !is.na(read.csv(getElement(list.files(),n))$sulfate) & 
                          !is.na(read.csv(getElement(list.files(), n))$nitrate)))
    
  }
  data.frame(id,rslt)
}
complete("specdata", c(1,2))
#  1 1041
#  2 1041
## unsuccessful

#@"2014-10-18 23:07:37 CDT"
complete<-function(directory, id){
  setwd("C:\\Users\\Josh\\Documents\\CSV")
  setwd(directory)
  nob<-function(id){
    nrow(subset(
      read.csv(getElement(list.files(), id)), 
      !is.na(read.csv(getElement(list.files(), id))$sulfate) & 
        !is.na(read.csv(getElement(list.files(), id))$nitrate)))
  }
  for (n in id) {
    rslt <-  nob(n)
    
#     print(nob (directory, n))
    data.frame(nob,id)
  }
  #  data.frame(id = as.vector(id), nobs = as.vector(nob(directory, id)))
}
complete("specdata", c(1,2))
# Err cannot coerce class function to data frame

#@"2014-10-15 22:15:09 CDT"
complete<-function(directory, id){
  setwd("C:\\Users\\Josh\\Documents\\CSV")
  setwd(directory)
  nob<-function(directory, id){
    nrow(subset(
      read.csv(getElement(list.files(), id)), 
      !is.na(read.csv(getElement(list.files(), id))$sulfate) & 
      !is.na(read.csv(getElement(list.files(), id))$nitrate)))
  }
  for (n in id) {
   rslt <-  nob(directory, n)
   print(nob (directory, n))
  }
#  data.frame(id = as.vector(id), nobs = as.vector(nob(directory, id)))
}
complete("specdata", c(1,2))

#@"2014-10-15 21:11:03 CDT"
complete<-function(directory, id){
  setwd("C:\\Users\\Josh\\Documents\\CSV")
  setwd(directory)
  nobs<-nrow(subset(
    read.csv(getElement(list.files(), id)), 
    !is.na(read.csv(getElement(list.files(), id))$sulfate) & 
      !is.na(read.csv(getElement(list.files(), id))$nitrate)))
  data.frame(id, nobs)
}
complete("specdata", 1)
## correct
complete("specdata", c(2, 4, 8, 10, 12))
## Err selects more than 1 element

#@"2014-10-15 20:52:33 CDT"
nobs<-function(directory, id){
  setwd("C:\\Users\\Josh\\Documents\\CSV")
  setwd(directory)
  nrow(subset(
    read.csv(getElement(list.files(), id)), 
    !is.na(read.csv(getElement(list.files(), id))$sulfate) & 
      !is.na(read.csv(getElement(list.files(), id))$nitrate)))
}
# passes id = 1, 2, 4, 8, 10, 12, 30, 29, 28, 27, 26, 25, 3
# still needs to print data frame

#@"2014-10-15 18:36:41 CDT"
complete<-function(directory, id){
  setwd("C:\\Users\\Josh\\Documents\\CSV")
  setwd(directory)
  nrow(
    subset(
      read.csv(getElement(list.files(), id)), 
      !is.na(read.csv(getElement(list.files(), id))$sulfate)
    )
  )
}
complete("specdata", 1)
# [1] 15747
# should be 117

#@"2014-10-15 18:09:35 CDT"
complete<-function(directory, id){
  setwd("C:\\Users\\Josh\\Documents\\CSV")
  setwd(directory)
  nrow(
    subset(
      read.csv(getElement(list.files(), id)), 
      is.na(read.csv(getElement(list.files(), id))$sulfate)
      )
    )
}
complete("specdata", 1)
# [1] 40509
# should be 117

#@"2014-10-15 08:48:45 CDT"
complete<-function(directory, id){
  setwd("C:\\Users\\Josh\\Documents")
  setwd(directory)
  nrow(subset(read.csv(getElement(list.files(), id)), sulfate !="NA"))
}
complete("specdata", 1)
#   [1] 15747
## should be 117

#@"2014-10-15 08:38:07 CDT"
complete<-function(directory, id){
  setwd("C:\\Users\\Josh\\Documents")
  setwd(directory)
  nrow(subset(read.csv(getElement(list.files(), id))), sulfate!="NA")
}
complete("specdata", 1)
#   Err unused argument (sulfate!="NA")

#@"2014-10-15 08:34:33 CDT"
nobs<-function(id){nrow(subset(read.csv(getElement(list.files(), id)), sulfate!="NA"))}
nobs(1)
#   [1] 15747
## incorrect
# [1] 117 after correcting CSV, thus correct
nobs(2)
#   [1] 1041
## correct

#@"2014-10-15 08:26:50 CDT"
nobs<-function(id){
  nrow(
    subset(
      data.frame(
        read.csv(
          getElement(
            list.files(), id
          )
        )
      ), 
      sulfate != "NA"))}
nobs(2)
#   [1] 1041


#@"2014-10-15 07:58:19 CDT"
pollutantmean<-function(directory, pollutant, id){
  setwd("C:\\Users\\Josh\\Documents")
  setwd(directory)
  doc<-read.csv(getElement(list.files(), id))
  getElement(doc, pollutant)
}
pollutantmean("specdata", "sulfate", 5)
## successful

#@"2014-10-15 07:55:54 CDT"
pollutantmean<-function(directory, pollutant, id){
  setwd("C:\\Users\\Josh\\Documents")
  setwd(directory)
  doc<-read.csv(getElement(list.files(), id))
  pol<-getElement(doc, pollutant)
}
