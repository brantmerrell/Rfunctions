<<<<<<< HEAD
linkgrid<-function(link1,link2="",link3="",link4="",link5="",Year=2015,Month="April",comment="",workdir="C:/Users/Josh/Documents"){
  filepath<-file.path(workdir,"CSV Personal/linkgrid.csv")
  df<-read.csv(filepath,colClasses="character")
  newrow<-data.frame(link1,link2,link3,link4,link5,Year,Month,comment)
#   newrow<-data.frame(link1="https://www.facebook.com/tennis.lilly/posts/10206463047873954",link2="https://www.facebook.com/tennis.lilly",link3="",link4="",link5="",Year=2015,Month="April",comment="")
  df<-unique(rbind(df,newrow))
  write.csv(df,filepath,row.names=FALSE)
  print(tail(read.csv(filepath)))
}

review.note<-function(reviewnote,row,Time=Sys.time(),filepath="CSV/gulp.js.csv",
                        command="find",workdir="C:/Users/Josh/Documents"){
  if(!grepl("Documents",filepath)){
    filepath<-file.path(workdir,filepath)
  }
  content<-read.csv(filepath,colClasses="character")
  if(command=="modify"){
    content[row,]<-c(content[row,1:2],reviewnote,paste(Time))
  }
  View(content[(row-1):(row+9),c(3,4,1,2)])
  print(content[(row-1):(row+1),])
  write.csv(content,filepath,row.names=FALSE)
}
#   if(class(key) %in% c("numeric","integer")){
#     print(lectures[key,])
#     if(command=="modify"){
#       lectures[key,3]<-summary
#       lectures[key,4]<-paste(Time)
#       print(lectures[(key-1):(key+1),])
#       write.csv(lectures,filepath,row.names=FALSE)
#     }
#   }
}


getnote<-function(pattern,notepath="C:/Users/Josh/Documents/CSV Personal/notes.csv"){
  notes<-read.csv(notepath, colClasses="character")
  workframe<-(subset(notes,grepl(pattern,notes$note)))
  View(workframe)
}

scholarmetric<-function(link="https://scholar.google.com/citations?view_op=top_venues&hl=en",
                        first_journal="Nature",
                        last_journal="The Journal of Immunology"){
  metrics<-unlist(strsplit(readLines(link,warn=FALSE),"<|>"))
  metrics<-metrics[(!(grepl("(http)|/|@|=|\\[|\\{|(Sorry)|(Please)|(best)|(div)",
                            metrics))
                    & !(metrics %in% c("","!doctype html","html","head","title","style","script",
                                       "body","Web","Images","Sign in","","Google Chrome",
                                       " or ","Mozilla Firefox","Scholar","Search Scholar",
                                       "Categories","English","li","tr","hide")))]
  n<-1
  while(metrics[n]!=first_journal){
    n<-n+1
  }
  metrics<-metrics[-(1:(n-2))]
  n<-length(metrics)
  while(metrics[n]!=last_journal){
    n<-n-1
  }
  metrics<-metrics[-((n+3):(length(metrics)))]
  df<-data.frame(categoryrank=metrics[(1:(length(metrics)/4))*4-3],
                 journal=metrics[(1:(length(metrics)/4))*4-2],
                 h5_index=metrics[(1:(length(metrics)/4))*4-1],
                 h5_median=metrics[(1:(length(metrics)/4))*4])
  return(df[,-1])
}

getFB<-function(info="Friends",Range=c(500,5000)){
  if(tolower(info)=="friends"){
    lines<-
      strsplit(
        readLines(
          file.path("C:/Users/Josh/Documents/Data/Facebook/html",
                    list.files("C:/Users/Josh/Documents/Data/Facebook/html")[4]
          ),
          warn=FALSE
        ),
        "(<li>)|(</li>)"
      )[[1]]
    lines<-subset(as.vector(lines),grepl(" ",lines) & !grepl("(htm)|(<)",lines))
  }
  if(tolower(info)=="message"){
    lines<-
      unlist(strsplit(
        readLines(
          file.path("C:/Users/Josh/Documents/Data/Facebook/html",
                    list.files("C:/Users/Josh/Documents/Data/Facebook/html")[5]
          ),
          warn=FALSE
        ),
        "(<)|(>)"
      ))
    lines<-subset(lines,!grepl("(/p)|(/li)|(/h1)|(class=)|(/a)|(/div)|(/ul)|(/span)",lines) 
           & !(lines %in% c("li","p","")))
    lines[as.integer(1000/(20:1)+1)]
    lines<-unlist(lines)
    lines<-subset(lines,min(Range)<nchar(lines) 
                  & nchar(lines)<max(Range))
  }
  if(info="wall"){
    lines<-
      readLines(
        file.path("C:/Users/Josh/Documents/Data/Facebook/html",
                  list.files("C:/Users/Josh/Documents/Data/Facebook/html")[17]
        )
        #,header=TRUE
        ,warn=FALSE
      )#)
    )
  }
  lines
}
?range


Descriptions<-function(DescLine=1,lines_filepath="C:/Users/Josh/Documents/rmongodb.txt",split=TRUE){
  lines<-readLines(lines_filepath)
  lineframe<-data.frame(row=1:length(lines),line=lines)
  Descriptions<-sort(unique(lines[(subset(lineframe$row,lineframe$line=="Description")+DescLine)]))
  if(split==TRUE){
    split(lines,strsplit(lines," "))
  }
  Descriptions
}

segmentframe<-function(lines,extract="Usage"){
  chapters<-chapterlist(lines)
  segments<-unique(unlist(segmentlist(lines,extract)))
  get.length<-function(line){
    length(unlist(strsplit(line,"(\\()|\\)|(,)")))
    #length(unlist(strsplit(lines[303],"(\\()|\\)|(,)")))
  }
  threshold<-20 #max(unlist(lapply(lines[segments],get.length)))+1
  worktrix<-matrix(nrow=1,ncol=threshold)
  ncols<-ncol(matrix)
  for(n in 1:length(chapters)){
    #n<-4
    chapter<-chapters[[n]][[1]]
    if(n<length(chapters)){
      nextchapter<-chapters[[n+1]][[1]]
    }
    else{nextchapter<-length(lines)}
    segment<-subset(segments,chapter<segments & segments<nextchapter)
    segframe<-as.vector(gsub(" ","",unlist(strsplit(lines[segment],"(\\()|\\)|(,)"))))
    chapter<-matrix(c(as.vector(lines[chapters[[n]][[1]]]),as.vector(segframe)),nrow=1)
    while(ncol(chapter)<ncol(worktrix)){
      chapter<-matrix(cbind(chapter,NA),nrow=1)
    }
    if(ncol(worktrix)<ncol(chapter)){
      #matrix<-cbind(worktrix,NA)
      stop(chapter)
    }
    if(is.na(worktrix[1,1])){
      worktrix<-(chapter)
    }
    else{worktrix<-rbind(worktrix,chapter)}
    #ncols<-c(ncols,ncol(worktrix))
  }
  while(!(FALSE %in% is.na(worktrix[,ncol(worktrix)]))){
    worktrix<-worktrix[,-ncol(worktrix)]
  }
  worktrix
  #ncols
}

segmentlist<-function(lines,extract){
  worklines<-gsub("\\. ","",lines)
  df<-data.frame(Row=(1:length(lines)),
                 line=(lines),
                 length=(unlist(lapply(strsplit(worklines," "),length))))
  segments<-as.list(subset(df[,1],df$line==extract))
  singlewords<-as.list(subset(df[,1],df$length==1))
  for(n in 1:length(segments)){
    start<-segments[[n]]
    linerunner<-1
    while(!(df$length[start+linerunner]==1) 
          & linerunner<length(lines)){
      linerunner<-linerunner+1
    }
    end<-start+linerunner-1
    segments[[n]]<-start:end
  }
  segments
}

chapterlist<-function(lines,postkey="Arguments"){
  df<-data.frame(Row=(1:length(lines)),
                 line=(lines))
  chaprows<-postchap(lines,postkey)
  chapters<-as.list(chaprows)
  for(n in 1:length(chapters)){
    #row<-4073
    start<-chapters[[n]]
    ifelse(n<length(chapters),
           end<-chapters[[n+1]]-1,
           end<-length(lines))
    chapters[[n]]<-start:end
  }
  chapters
}

postchap<-function(lines,postkey){
  df<-data.frame(Row=(1:length(lines)),
                 line=(lines))
  postchap<-subset(df[,1],df$line==postkey)
  df[postchap-1,1]
}

dim(df[postchap-1,c(1,2)])


wordtable<-function(lines){
  worklines<-gsub("(\\. \\. \\. \\.)","\\.",lines)
  words<-strsplit(worklines," ")
  df<-data.frame(Row=(1:length(lines)),
                 line=(lines),
                 length=(unlist(lapply(strsplit(worklines," "),length))))
  wordcol<-max(df$length)
  while(0<wordcol){
    workvec<-replicate(length(lines),NA)
    for(wordrow in 1:length(workvec)){
      if(wordcol<=length(words[[wordrow]])){
        workvec[wordrow]<-words[[wordrow]][[wordcol]]
      }
    }
    df_names<-c(colnames(df),paste("word",wordcol,sep="_"))
    df<-cbind(df,workvec)
    names(df)<-df_names
    wordcol<-wordcol-1
  }
  df
}

chapter.overlap<-function(lines){
  words<-strsplit(lines," ")
  line_length<-unlist(lapply(words,length))
  firstwords<-replicate(length(lines),"")
  for(n in 1:length(lines)){
    firstwords[n]<-words[[n]][[1]]
  }
  secondwords<-replicate(length(lines),"")
  for(n in 1:length(lines)){
    if(1<line_length[n]){
      secondwords[n]<-words[[n]][[2]]
    }
  }
  linetable<-data.frame(row=1:length(lines),
                        line=lines,
                        firstword=firstwords,
                        secondword=secondwords)
  chapters<-name.chapters(lines)
  chapstarts_1<-subset(linetable$row,linetable$line %in% chapters)
  chapstarts_2<-subset(linetable$row,linetable$firstword %in% chapters)
  return(subset(linetable$secondword,
                linetable$row %in% chapstarts_2 &
                  !(linetable$row %in% chapstarts_1)))
}

name.chapters<-function(lines
  #lines_filepath="C:/Users/Josh/Documents/rmongodb.txt"
  ){
  #lines<-gsub("\"","\\\"",readLines(lines_filepath))
  #lines<-readLines(lines_filepath)
  #lines[as.integer(length(lines)
                   #*c(.5,.1,.15,.2,.25,.3,.35,.4,.45,.50,.55,.6,.65,.7,.75,.8,.85,.9,.95,1))]
  #longframe<-data.frame(x=1:length(lines),line=lines)
  Table_of_Contents<-subset(lines,grepl("\\. \\. \\.",lines))
=======
list.files("C:/Users/Administrator/Documents/CSV")[(1:10)+(10*2)]
vector<-as.character(read.csv("C:/Users/Administrator/Documents/CSV/gkg_PERSONS.csv")$x)
vecsample<-function(vector,samplesize=5,add=0,method="letterparse"){
  L<-length(vector)
  if(class(vector)=="character" &
       method=="letterparse"){
    samplevec<-head(vector,samplesize)
    #rm(l)
    for(l in letters[1:26]){
      lettersample<-vector[l==substr(vector,1,1)]
      lettersample<-lettersample[
        as.integer(length(lettersample)*c(1/(1:samplesize)))+add]
      samplevec<-c(samplevec,lettersample)
    }
    #length(unique(printvec))
    #length(printvec)
    #subset(printvec,duplicated(printvec))
    samplevec<-sort(unique(c(samplevec,tail(vector,samplesize))))
  }
  list(samplevec=samplevec,
       arith=paste(L,"=",length(samplevec),"+",L-length(samplevec)),
       ratio=paste(L,"=",length(samplevec),"*",as.integer(L/length(samplevec)))#,
       #percentage=paste(round((length(samplevec)/L)*100,digits=2),"%",sep="")
       )
}

update.PERSONS<-function(Date=Sys.Date()-1,project="gkg",command="return",
                         workdir="C:/Users/Administrator/Documents"){
  if(project=="gkg"){
    df<-download.gdelt(Date,"gkg")
    filepath<-file.path(workdir,"CSV","gkg_PERSONS.csv")
  }
  PRSNS<-levels(df$PERSONS)
  rm(df)
  PRSNS<-subset(PRSNS,PRSNS!="")
  prsns<-subset(PRSNS,!grepl(";",PRSNS))
  PRSNS<-subset(PRSNS,grepl(";",PRSNS))
  workvec<-prsns
  for(n in length(PRSNS)){
    workvec<-unique(c(workvec,strsplit(PRSNS[n],";")[[1]]))
  }
  if(file.exists(filepath)){
    workvec<-unique(c(workvec,read.csv(filepath,colClasses="character")))
    print(filepath)
  }
  #write.csv(workvec,filepath,row.names=FALSE)
  printvec<-c(head(workvec))
  for(l in letters[1:26]){
    lettersample<-workvec[l==substr(workvec,1,1)]
    if(10<length(lettersample)){
      lettersample<-lettersample[
        as.integer(length(lettersample)*c(.1,.2,.3,.4,.5,.6,.7,.8,.9,1))]
    }
    printvec<-c(printvec,lettersample)
  }
  printvec<-unique(c(printvec,tail(workvec)))
  write.csv(workvec,filepath)
  print(printvec)
}
persons<-PERSONS()

slice.lines<-function(lines){
  lines<-gsub("\"","\\\"",readLines(filepath))
  #lines[as.integer(length(lines)*c(.5,.1,.15,.2,.25,.3,.35,.4,.45,.50,.55,.6,.65,.7,.75,.8,.85,.9,.95,1))]
  longframe<-data.frame(x=1:length(lines),line=lines)
  Table_of_Contents<-subset(df_lines,grepl("\\. \\. \\.",df$line))
>>>>>>> 6d6f5e40b7857c2e2b261c3388a6b822de08e712
  chapters<-gsub(" ","",gsub("(\\. )|9|8|7|6|5|4|3|2|1|0"," ",
                              as.vector(subset(
                                lines,lines %in% Table_of_Contents))))
  return(chapters)
}

diffminutes<-function(row){
  if(row<nrow(Today)){
    return(as.integer((Today$unclass_POSIXct[row+1]-Today$unclass_POSIXct[row])/60))
  }
  else{
    return(NA)
  }
}

seconds<-function(row){unclass(as.POSIXct(Today$time[row]))[1]}

testline<-function(line,iterate,chapters=functions,sec=sections){
  result<-"line"
  line<-as.vector(gsub("(\")|(\')","",line))
  if(!grepl("\\#",line) & !(line=="")){
    if(read.table(textConnection(line),sep=" ")$V1 %in% chapters){
      if(iterate==1){
        result<-"chapter"
      }
      if(iterate==2){
        result<-read.table(textConnection(line),sep=" ")$V1
      }
    }
    if(read.table(textConnection(line),sep=" ")$V1 %in% sec){
      if(iterate==1){
        result<-"section"
      }
      if(iterate==2){
        result<-read.table(textConnection(line),sep=" ")$V1
      }
    }
  }
  result
}

rmongodb.frame<-function(Function,Text,command="automate"){
  if(grepl("Description",Text)){
    column<-2
    colname<-"Description"
  }
  if(grepl("Usage",Text)){
    column<-3
    colname<-"Usage"
  }
  if(grepl("Arguments",Text)){
    column<-4
    colname<-"Arguments"
  }
  if(grepl("Details",Text)){
    column<-5
    colname<-"Details"
  }
  if(grepl("Value",Text)){
    column<-5
    colname<-"Value"
  }
  Text<-sub(colname,"",gsub("(\\n)"," ",Text))
  row<-as.numeric(row.names(df[df$FUN==FUN,]))
  df[,column]<-as.character(df[,column])
  df[row,column]<-Text
  print(df[(row-1):(row+1),])
  return(df)
}

FUN<-function(funline){
  unique(c(rmongodb,gsub("0|1|2|3|4|5|6|7|8|9|(\\. )|( )","",funline)))
}
df<-data.frame(FUN=rmongodb,Desc="",Usage="",args="",Details="")

download.gdelt<-function(date=(Sys.Date()-2),project="counts",
                         workdir="C:/Users/Administrator/Documents"){
  datestamp<-gsub("-","",date)
  if(grepl("event",tolower(project))){
    project<-"events"
    url<-paste("http://data.gdeltproject.org/events/",datestamp,".export.CSV.zip",sep="")
    if("2013-04-01"<date){
      columns<-colnames(
        read.delim(
          textConnection(
            readLines("http://gdeltproject.org/data/lookups/CSV.header.dailyupdates.txt"))))
    }
    if(date<"2013-04-01"){
      names(df)<-colnames(
        read.delim(
          textConnection(
            readLines("http://gdeltproject.org/data/lookups/CSV.header.historical.txt"))))
    }
    Header<-FALSE
  }
  if(grepl("count",tolower(project))){
    project<-"gkgcounts"
    url<-paste("http://data.gdeltproject.org/gkg/",datestamp,".gkgcounts.csv.zip",sep="")
    Header<-TRUE
  }
  if(grepl("gkg",tolower(project)) & !grepl("count",tolower(project))){
    project<-"gkg"
    url<-paste("http://data.gdeltproject.org/gkg/",datestamp,".gkg.csv.zip",sep="")
    Header<-TRUE
  }
  dir.create(file.path(workdir,project),showWarnings=FALSE)  
  folderpath<-file.path(workdir,project,"export.csv")
  filepath<-paste(folderpath, list.files(folderpath,c(datestamp,"*\\.csv")),sep="/")
  if(!grepl(datestamp,filepath)){
    destfile<-file.path(workdir,project,"export.csv.zip",sep="")
    download.file(url,destfile)
    dir.create(folderpath,showWarnings=FALSE)
    unzip(destfile,exdir=folderpath)
    filepath<-paste(folderpath, list.files(folderpath,c(datestamp,"*\\.csv")),sep="/")
  }
  df<-read.delim(filepath,header=Header)
  if(project=="events"){names(df)<-columns}
  View(df)
  return(df)
}

letterparse<-function(l,df=music,col="album"){
  if(tolower(col) %in% tolower(colnames(df))){
    m<-1
    while(m<=ncol(df) & !(tolower(colnames(df)[m])==tolower(col))){
      m<-m+1
    }
  }
  if(class(l)=="character"){
    n<-1
    while(!(tolower(l)==letters[n]) & (n<=27)){
      n<-n+1
    }
    l<-n
  }
  length(levels(df[,m])[letters[l]<=levels(df[,m]) & levels(df[,m])<=letters[l+1]])
}

tolink<-function(ids,command="return"){
  for(id in ids){
    if(nchar(id)==9){
      url<-paste("http://www.chess.com/echess/game?id=",id,sep="")
    }
    if(nchar(id)==10){
      url<-paste("http://www.chess.com/echess/game?lid=",id,sep="")
    }
    if(command=="store"){
      newlink(url)
    }
    if(command=="return"){
      return(url)
    }
  }
}
chesspgn<-read.csv(paste("./chess/",list.files("./chess",".csv")[4],sep=""))

positions<-function(game=chessgame){
  pieces<-c(wR_a="a1",wp_a="a2",bp_a="a7",bR_a="a8",
            wN_b=)
  squares<-data.frame(a1="wR_a",a2="wp_a",a7="bp_a",a8="bR_a",
                      b1="wN_b",b2="wp_b",b7="bp_b",b8="bN_b",
                      c1="wB_c",c2="wp_c",c7="bp_c",c8="bB_c",
                      d1="wQ",d2="wp_d",d7="bp_d",d8="bQ",
                      e1="wK",e2="wp_e",e7="bp_e",e8="bK",
                      f1="wB_f",f2="wp_f",f7="bp_f",f8="bB_f",
                      g1="wN_g",g2="wp_g",g7="bp_g",g8="gN_b",
                      h1="wR_h",h2="wp_h",h7="bp_h",h8="bR_h",
                      a3="",a4="",a5="",a6="",b3="",b3="",b4="",b5="",b6="",
                      c3="",c4="",c5="",c6="",d3="",d4="",d5="",d6=""
                      a3="",a4="",a5="",a6="",b3="",b4="",b5="",b6=""
                      a3="",a4="",a5="",a6="",b3="",b4="",b5="",b6="")
  subset(game$pgn,grepl(square)
}

ratings<-function(metachess="default"){
  if(metachess=="default"){
    metachess<-read.csv("C:/Users/Josh/documents/chess/chesslogs.csv")
  }
  if(metachess$White[1]=="thinkboolean"){
    rateframe<-data.frame(myrating=as.numeric(as.character(metachess$WhiteElo[1])))
  }
  if(metachess$Black[1]=="thinkboolean"){
    rateframe<-data.frame(myrating=as.numeric(as.character(metachess$BlackElo[1])))
  }
  for(row in 2:nrow(metachess)){
    if(metachess$White[row]=="thinkboolean"){
      rateframe<-rbind(rateframe, as.numeric(as.character(metachess$WhiteElo[row])))
    }
    if(metachess$Black[row]=="thinkboolean"){
      rateframe<-rbind(rateframe,as.numeric(as.character(metachess$BlackElo[row])))
    }
  }
  plot(metachess$Date,rateframe[,1],type="n",main="chess ratings: thinkboolean",
       xlab="date",ylab="rating")
}

logchess<-function(command="write"){
  linkpath<-"C:/Users/Josh/Documents/Chess/chesslinks.csv"
  logpath<-"C:/Users/Josh/Documents/chesslogs.csv"
  chesslinks<-unique(read.csv(linkpath,colClasses="character"))
  chesslogs<-data.frame(link=as.vector(chesslinks$link),
                        type=as.vector(read.table(textConnection(as.vector(chesslinks$link)),sep="/")$V4),
                        ID=as.vector(read.table(textConnection(as.vector(chesslinks$link)),sep="=")$V2))
  FUN<-function(id){
    read.meta(id)$Event
  }
  chesslogs<-cbind(chesslogs,Event=as.matrix(unlist(lapply(chesslogs$ID,FUN))))
  FUN<-function(id){
    paste(strptime(read.meta(id)$Date,format="%Y.%m.%d"))
  }
  chesslogs<-cbind(chesslogs,Date=as.matrix(unlist(lapply(chesslogs$ID,FUN))))
  FUN<-function(id){
    read.meta(id)$White
  }
  chesslogs<-cbind(chesslogs,White=as.matrix(unlist(lapply(chesslogs$ID,FUN))))
  FUN<-function(id){
    read.meta(id)$Black
  }
  chesslogs<-cbind(chesslogs,Black=as.matrix(unlist(lapply(chesslogs$ID,FUN))))
  FUN<-function(id){
    read.meta(id)$Result
  }
  chesslogs<-cbind(chesslogs,Result=as.matrix(unlist(lapply(chesslogs$ID,FUN))))
  FUN<-function(id){
    read.meta(id)$WhiteElo
  }
  chesslogs<-cbind(chesslogs,WhiteElo=as.matrix(unlist(lapply(chesslogs$ID,FUN))))
  FUN<-function(id){
    read.meta(id)$BlackElo
  }
  chesslogs<-cbind(chesslogs,BlackElo=as.matrix(unlist(lapply(chesslogs$ID,FUN))))
  FUN<-function(id){
    read.meta(id)$TimeControl
  }
  chesslogs<-cbind(chesslogs,TimeControl=as.matrix(unlist(lapply(chesslogs$ID,FUN))))
  if(command=="write"){
    write.csv(chesslogs,logpath,row.names=FALSE)
    print(tail(read.csv(logpath),3))
  }
  if(command=="return"){
    return(chesslogs)
    print(list(varnames=colnames(chesslogs),
               rows=nrow(chesslogs),
               columns=ncol(chesslogs)))
  }
}
colnames(chesslinks)

linkconvert<-function(ids){
  for(id in ids){
    if(nchar(id)==9){
      url<-paste("http://www.chess.com/echess/game?id=",id,sep="")
    }
    if(nchar(id)==10){
      url<-paste("http://www.chess.com/liveechess/game?id=",id,sep="")
    }
    newlink(url)
  }
}

metanews<-function(date=Sys.Date(),type="gdelt",command="store"){
  if(type=="gdelt"){
    date<-gsub("-","",(date-1))
    download.file(url=paste("http://data.gdeltproject.org/gkg/",date,".gkgcounts.csv.zip",sep=""),
                  destfile="C:/Users/Josh/Documents/Data/gdelt.gkgcounts.csv.zip")
    unzip(zipfile="C:/Users/Josh/Documents/Data/gdelt.gkgcounts.csv.zip",
          exdir="C:/Users/Josh/Documents/Data/gdelt.gkgcounts")
    gdelt<-read.delim(file=paste("C:/Users/Josh/Documents/Data/gdelt.gkgcounts/",
                                 date,
                                 ".gkgcounts.csv",
                                 sep=""),
                      skip=0,header=TRUE,nrows=1000000)
  }
  if(command=="return"){
    return(gdelt)
  }
  if(command=="store"){
    countpath<-"C:/Users/Josh/Documents/CSV/counttype.csv"
    objectpath<-"C:/Users/Josh/Documents/CSV/objecttype.csv"
    geopath<-"C:/Users/Josh/Documents/CSV/geo_fullname.csv"
    geocode<-"C:/Users/Josh/Documents/CSV/geo_code.csv"
    admcode<-"C:/Users/Josh/Documents/CSV/admcode.csv"
    counttype<-read.csv(countpath,colClasses="character")
    counttype<-sort(unique(rbind(matrix(counttype[,1]),
                                 matrix(levels(gdelt$COUNTTYPE)))))
    print(counttype)
    write.csv(counttype,countpath,row.names=FALSE)
  }
}

newlink<-function(links,workdir="C:/Users/Josh/Documents"){
  if(!(TRUE %in% c(grepl("chess.com",links),
                   grepl("pandora.com",links)))){
    filepath<-file.path(workdir,"CSV Personal/unsortedlinks.csv")
  }
  if(grepl("chess.com",links)){
    filepath<-file.path(workdir,"chess/chesslinks.csv")
  }
  if(grepl("pandora.com",links)){
    filepath<-file.path(workdir,"CSV/pandoralinks.csv")
  }
  current<-as.matrix(read.csv(filepath,colClasses="character"))
  write.csv(unique(rbind(current,as.matrix(links))),filepath,row.names=FALSE)
  print(tail(read.csv(filepath),3))
}

chesslink<-function(links){
  if(FALSE %in% grepl("chess.com",links)){
    message("this includes a non-chess.com link")
  }
  filepath<-"C:/Users/Josh/Documents/chess/chesslinks.csv"
  current<-as.matrix(read.csv(filepath,colClasses="character"))
  write.csv(unique(rbind(current,as.matrix(links))),filepath,row.names=FALSE)
  print(tail(read.csv(filepath),3))
}

DS.lecsummary<-function(summary,key,Time=Sys.time(),
                        command="modify",workdir="C:/Users/Josh/Documents"){
  filepath<-file.path(workdir,"CSV/DSLectures.csv")
  lectures<-read.csv(filepath,colClasses="character")
  if(class(key) %in% c("numeric","integer")){
    print(lectures[key,])
    if(command=="modify"){
      lectures[key,3]<-summary
      lectures[key,4]<-paste(Time)
      print(lectures[(key-1):(key+1),])
      View(lectures[(key-1):(key+9),])
      write.csv(lectures,filepath,row.names=FALSE)
    }
  }
}
#lecsummary(summary="",key=55,command="find")

coursemap<-function(workdir="C:/Users/Josh/Documents"){
  coursepath<-file.path(workdir,"Courses/Courses")
  workframe<-data.frame(Course=list.files(coursepath)[7],
                        lecture=list.files(
                          paste(paste(coursepath,list.files(coursepath)[7],sep="/"),
                                "pdfs",
                                sep="/")))
  for(n in c(1:6,8:9)){
    newframe<-data.frame(Course=list.files(path=coursepath)[n],
                         lecture=list.files(path=paste(paste(coursepath,list.files(coursepath)[n],
                                                             sep="/"),
                                                       "lectures",
                                                       sep="/"),
                                            pattern=".pdf"))
    workframe<-rbind(workframe,newframe)
  }
  workframe
}

newsdata<-function(newslinks){
  for(newslink in newslinks){
    if(grepl("www.nytimes.com",newslink)){
      year<-read.table(textConnection(newslink),sep="/")$V4
      month<-read.table(textConnection(newslink),sep="/")$V5
      day<-read.table(textConnection(newslink),sep="/")$V6
      
    }
  }
  
}

newslink<-function(links){}

musiclink<-function(links){
  if(FALSE %in% grepl("pandora.com",links)){
    message("this includes a non-pandora link")
  }
  filepath<-"C:/Users/Josh/Documents/CSV/pandoralinks.csv"
  current<-as.matrix(read.csv(filepath,colClasses="character"))
  write.csv(unique(rbind(current,as.matrix(links))),filepath,row.names=FALSE)
  print(tail(read.csv(filepath),3))
}

pandoradata<-function(pandoralinks="default",
                      workdir="C:/Users/Josh/Documents"){
  if("default" %in% pandoralinks){
    pandoralinks<-read.csv(file.path(workdir,"/CSV/pandoralinks.csv"),
                           colClasses="character")$x
  }
  data<-data.frame(artist=gsub("(\\w)(\\w*)", 
                               "\\U\\1\\L\\2", 
                               gsub("-"," ",
                                    as.character(read.table(textConnection(pandoralinks[1]),
                                                            sep="/")$V4)),
                               perl=TRUE),
                   album=gsub("(\\w)(\\w*)", 
                              "\\U\\1\\L\\2", 
                              gsub("-"," ",
                                   as.character(read.table(textConnection(pandoralinks[1]),
                                                           sep="/")$V5)), 
                              perl=TRUE),
                   track=gsub("(\\w)(\\w*)", 
                              "\\U\\1\\L\\2", 
                              gsub("-"," ",
                                   as.character(
                                     read.table(
                                       textConnection(pandoralinks[1]),sep="/")$V6)), 
                              perl=TRUE),
                   link=as.character(pandoralinks[1]))
  if(length(pandoralinks)!=1){
    for(link in pandoralinks[2:length(pandoralinks)]){
      newrow<-data.frame(artist=gsub("(\\w)(\\w*)", 
                                     "\\U\\1\\L\\2", 
                                     gsub("-"," ",
                                          as.character(read.table(textConnection(link),
                                                                  sep="/")$V4)),
                                     perl=TRUE),
                         album=gsub("(\\w)(\\w*)", 
                                    "\\U\\1\\L\\2", 
                                    gsub("-"," ",
                                         as.character(read.table(textConnection(link),
                                                                 sep="/")$V5)),
                                    perl=TRUE),
                         track=gsub("(\\w)(\\w*)", 
                                    "\\U\\1\\L\\2", 
                                    gsub("-"," ",
                                         as.character(read.table(textConnection(link),
                                                                 sep="/")$V6)),
                                    perl=TRUE),
                         link=as.character(link))
      data<-rbind(data,newrow)
    }
  }
  data
}

meta.loop<-function(ids,Var="Event",workdir="C:/Users/Josh/Documents"){
  if(tolower(Var)=="event"){
    FUN<-function(id){as.vector(read.meta(id,workdir)$Event)}
  }
  if(tolower(Var)=="site"){
    FUN<-function(id){as.vector(read.meta(id,workdir)$Site)}
  }
  if(tolower(Var)=="date"){
    FUN<-function(id){as.vector(read.meta(id,workdir)$Date)}
  }
  if(tolower(Var)=="white"){
    FUN<-function(id){as.vector(read.meta(id,workdir)$White)}
  }
  if(tolower(Var)=="black"){
    FUN<-function(id){as.vector(read.meta(id,workdir)$Black)}
  }
  if(tolower(Var)=="result"){
    FUN<-function(id){as.vector(read.meta(id,workdir)$Result)}
  }
  if(tolower(Var)=="whiteelo"){
    FUN<-function(id){as.vector(read.meta(id,workdir)$WhiteElo)}
  }
  if(tolower(Var)=="blackelo"){
    FUN<-function(id){as.vector(read.meta(id,workdir)$BlackElo)}
  }
  if(tolower(Var)=="timecontrol"){
    FUN<-function(id){as.vector(read.meta(id,workdir)$TimeControl)}
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


add.fitness<-function(activity,unit,measure,count,limit,Time=Sys.time(),comment=NA,
                      workdir="C:/Users/Josh/Documents"){
  fitnesspath<-file.path(workdir,"CSV Personal/fitness.csv")
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

read.definitions<-function(n,SKIP=1,workdir="C:/Users/Josh/Documents"){
  folderpath<-file.path(workdir,"FDIC")
  filename<-list.files(folderpath,"*\\.csv")[n]
  filepath<-file.path(folderpath,filename)
  if(!file.exists(folderpath) | !file.exists(filepath)){
    dir.create(file.path(folderpath),showWarnings=FALSE)
    url<-"https://www2.fdic.gov/sdi/SDIAllDefinitions_CSV.zip"
    destfile<-file.path(workdir,"FDIC","SDIAllDefinitions_CSV.zip")
    download.file(url,destfile)
    unzip(destfile,exdir=file.path(workdir,"FDIC"))
    file.remove(destfile)
    filename<-list.files(folderpath,"*\\.csv")[n]
    filepath<-file.path(folderpath,filename)
  }
  data<-cbind(read.csv(filepath,colClasses="character",skip=SKIP),file=filename)
  names(data)<-c("X","ShortDesciption","Variable","LongDescription","File")
  return(data[,c(1,3,2,4,5)])
}

alldefinitions<-function(workdir="C:Users/Josh/Documents"){
  m<-length(list.files(file.path(workdir,"FDIC/SDIAllDefinitions_CSV")))
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

read.meta<-function(games,Workdir=getwd()){
  meta<-function(game,workdir=Workdir){
    if(nchar(game) %in% c(9:10)){
      id<-game
      if(nchar(id)==9){
        type<-"echess"
      }
      if(nchar(id)==10){
        type<-"livechess"
      }
    }
    if(grepl("chess.com",game)){
      id<-read.table(textConnection(game),sep="=")$V2
      ifelse(grepl("livechess",game),
             type<-"livechess",
             type<-"echess")
    }
    filepath<-paste(workdir,"/Chess/PGN/",type,"_",id,".pgn",sep="")
    if(!(file.exists(filepath))){
      download.pgn(game)
    }
    n<-1
    while(readLines(filepath)[n]!=""){
      n<-n+1
    }
    workframe<-data.frame(matrix(read.table(textConnection(readLines(filepath)[1:(n-1)]))$V2,ncol=(n-1)))
    names(workframe)<-gsub("\\[","",read.table(textConnection(readLines(filepath)[1:(n-1)]))$V1)
    if("ECO" %in% colnames(workframe)){
      message(paste("problem game:",game))
      if(ncol(workframe)==11){workframe<-workframe[,-7]}
    }
    workframe
  }
  n<-1
  workframe<-meta(games[n])
  while(n<length(games)){
    newrow<-meta(games[n+1])
    workframe<-rbind(workframe,newrow)
    n<-n+1
  }
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

download.pgn<-function(
  game,
  inputtype="id",
  workdir="C:/Users/Josh/Documents",
  update=TRUE){
  if(nchar(game)==9){
    id<-game
    type<-"echess"
    URL<-paste("http://www.chess.com/echess/download_pgn?id=",game,sep="")
  }
  if(nchar(game)==10){
    id<-game
    type<-"livechess"
    URL<-paste("http://www.chess.com/echess/download_pgn?lid=",game,sep="")
  }
  if(grepl("chess.com",game)){
    id<-read.table(textConnection(game),sep="=")$V2
    if(grepl("livechess",game)){
      type<-"livechess"
      URL<-paste("http://www.chess.com/echess/download_pgn?lid=",id,sep="")
    }
    if(read.table(textConnection(game),sep="/")$V4=="echess"){
      type<-"echess"
      URL<-paste("http://www.chess.com/echess/download_pgn?id=",id,sep="")
    }
  }
  filepath<-paste(workdir,"/Chess/PGN/",type,"_",id,".pgn",sep="")
  #filepath<-"C:/Users/Josh/Documents/Chess/PGN/temp.pgn"
  if((file.exists(filepath)==FALSE) |
       (update==TRUE)){
    download.file(URL,filepath)
  }
  print(filepath)
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

read.pgn<-function(
  #id,
  link){
  pgnpath<-paste("C:/Users/Josh/Documents/Chess/PGN/",id,".pgn",sep="")
  link<-tolink(id,command="return")
  if(!file.exists(pgnpath)){
    #download.pgn(id)
    download.pgn(link)
  }
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
    if(grepl("\\.\\.\\.",pgn)){
      return("black")
    }
    if(grepl("\\.",pgn)){
      return("white")
    }
    if(!(ncol(read.table(textConnection(pgn),sep=".")) %in% c(2,4))){
      stop("invalid number of dots")
    }
  }
  movenumber<-function(pgn){
    as.numeric(read.table(textConnection(pgn),sep=".")[1,1])
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
    ifelse(!grepl("O",pgn),
           return(as.character(subset(df$x,df$assess==TRUE))),
           ifelse(grepl("O-O-O",pgn),
                  return("Kc & Rd"),
                  return("Kg & Rf")))
  }
  ycoor<-function(pgn){
    ifelse(!grepl("O",pgn),
           return(as.character(subset(df$y,df$assess==TRUE))),
           ifelse(chesscolor(pgn)=="black",
                  return(8),
                  return(1)))
  }
  sqcoor<-function(pgn){
    ifelse(!grepl("O",pgn),
           return(as.character(subset(df$sq,df$assess==TRUE))),
           paste("(",xcoor(pgn),") &",ycoor(pgn)))
  }
  capture<-function(pgn){
    if(grepl("x",pgn)==TRUE){
      return("capture")
    }
    else{
      return("none")
    }
  }
  movetype<-function(pgn){
    Type<-"normal"
    if(grepl("x",pgn)){Type<-paste(Type,"capture",sep=" & ")}
    if(grepl("O-O",pgn) & !grepl("O-O-O",pgn)){Type<-paste(Type,"castle_kingside",sep=" & ")}
    if(grepl("O-O-O",pgn)){Type<-paste(Type,"castle_queenside",sep=" & ")}
    if(grepl("\\+",pgn)){Type<-paste(Type,"check",sep=" & ")}
    if(grepl("#",pgn)){Type<-paste(Type,"checkmate",sep=" & ")}
    if(grepl("=",pgn)){Type<-paste(Type,"promotion",sep=" & ")}
    if(grepl("&",Type)){Type<-gsub("normal & ","",Type)}
    Type
  }
  return(data.frame(pgn=pgn,
                    color=chesscolor(pgn),
                    move=movenumber(pgn),
                    movetype=movetype(pgn),
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


