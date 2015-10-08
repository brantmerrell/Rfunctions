levRandom<-function(DF,Fac=facRandom){
  L<-length(levels(DF[,Fac]))
  n<-abs(rnorm(1,L/2,L/2))
  while(L<n | n<0.5){n<-rnorm(1,L/2,L/2)}
  levels(DF[,Fac])[round(n)]
}

colRandom<-function(DF,targetClass=c("numeric","integer")){
  for(n in 1:ncol(DF)){
    ifelse(n==1,dfClasses<-class(DF[,n]),dfClasses<-c(dfClasses,class(DF[,n])))
  }
  L<-(sum(dfClasses %in% targetClass))
  n<-abs(rnorm(1,L/2,L/2))
  while(round(n)==0 | L<n){n<-abs(rnorm(1,L/2,L/2))}
  n<-which(dfClasses %in% targetClass)[round(n)]
  colnames(DF)[n]
}

aptDetails<-function(link=as.character(complexes[1,2])){
  if(grepl("^/",link)){link<-paste("www.apartmentfinder.com",link,sep="")}
  text.vector<-htmlToText(link)[[1]] # chr [1:1111]
  #   html.vector<-readLines(link) # error: cannot open con . . . 
  text.vector2<-text.vector[grep("[[:alnum:]]",text.vector)]
  costPattern<-"\\$"; roomPattern<-"\\d BR"; bathPattern<-"\\d BA"; 
  SqFtPattern<-"\n +\\d+\n"; breakPattern<-"Deposit/Fees"
  startPattern<-" +\\d Beds"
  breaks<-grep(breakPattern,text.vector2)
  dist<-breaks[2:length(breaks)]-breaks[(1:length(breaks))-1]
  Start<-max(grep(startPattern,text.vector2))
  text.vector2[start+3]
  SqFt<-grep(SqFtPattern,text.vector2); Cost<-grep(costPattern,text.vector2)
  SqFt<-SqFt[Start<=SqFt]; Cost<-Cost[Start<=Cost]; 
  data.frame(Square.Feet=text.vector2[SqFt], Cost=text.vector2[Cost])
}

aptLinks<-function(Page,State="Texas",City="Dallas"){
  URL<-paste("http://www.apartmentfinder.com/",State,"/",City,"-Apartments/Page",Page,sep="")
  html.vector<-readLines(URL)
  links<-grep("href=\"/Texas/Dallas-Apartments/(\\w+-){2,}",html.vector) # int [1:18]
  apts<-unlist(strsplit(html.vector[links],"</?|>"),length)
  apts<-apts[grepl("[[:alpha:]]",apts)]
  links<-apts[grep("href=.+Texas",apts)]
  apts<-unlist(strsplit(links,"/"))
  apts<-apts[grepl("\\w+-",apts) & apts!="Dallas-Apartments"]
  apts<-gsub("-"," ",apts)
  apts<-gsub("[/\"]","",apts)
  links<-gsub("(a href=\")|\"","",links)
  TEST<-!grepl("=",apts) & !grepl("=",links)
  unique(data.frame(apartment=apts[TEST],link=links[TEST]))
}


indeedSearch<-function(Page=10,What="data science",Where="Washington, DC"){
  What<-gsub(" ","+",What)
  Where<-gsub(",","%2C",Where)
  Where<-gsub(" ","+",Where)
  Start<-(Page-1)*10
  URL<-paste("http://www.indeed.com/jobs?q=",What,"&l=",Where,"&start=",Start,sep="")
  webPage<-htmlToText(URL)[[1]] # chr [1:933]
  webPage<-webPage[grepl("[[:alpha:]]",webPage)] # chr [1:347]
  grep("Jobs \\d+ to \\d+ of \\d+(,\\d+)?$",webPage)
  grep("Upload your resume",webPage)[2]
  Start<-grep("Let employers find you",webPage) # 21L
  Stop<-grep("Get email updates",webPage) # 323L
  webPage<-webPage[Start:Stop] # chr [1:303]
  locations<-grep("^[[:alpha:]]+, (MD|VA|DC)",webPage) # int [1:13]
  reviews<-grep("\\d reviews",webPage) # int [1:9]
  companies<-grep("\n +\\w",webPage) # int [1:16]
  cities<-reviews+1 # int [1:9]
  webPage[reviews+8]
  #   descriptions<-which(50<nchar(webPage)) # int [1:23]
  titles<-cities-3
  titlesText<-webPage[titles]
  while(0<sum(grepl("^ ",webPage[titles]))){
    incompletes<-grep("^ ",webPage[titles])
    titlesText[incompletes]=paste(webPage[titles[incompletes]-1],titlesText[incompletes])
    titles[incompletes]<-titles[incompletes]-1
  }
  data.frame(title=titlesText,company=webPage[reviews-1],city=webPage[reviews+1])
}


coursesCompile<-function(compilePattern=Extensions[9]){
  FROM<-list.files("courses",pattern=compilePattern,full.names=T,recursive=T)
  TO<-gsub("/","_",FROM)
  TO<-gsub("courses_courses_","",TO)
  if(!file.exists("courseraFiles")){dir.create("courseraFiles")}
  DIR<-file.path("courseraFiles",gsub("\\$","",compilePattern))
  if(!file.exists(DIR)){dir.create(DIR)}
  TO<-file.path(DIR,TO)
  file.copy(FROM,TO)
  print(summary(TO))
}

linkPGN<-function(id=5002,type="echess",
                  testPattern="PopExplorerBoard"){
  if(type=="echess"){
    Url<-"http://www.chess.com/echess/game?id="
    Url<-paste(Url,id,sep="")
    workVec<-readLines(Url)
    if(length(workVec)==798){stop("game aborted")}
    workVec<-workVec[grep(testPattern,workVec)]
    if(length(workVec)!=0){
      workPattern<-'\\d\\.[KQRNB]?[[:lower:]]\\d+'
      workVec<-workVec[grep(workPattern,workVec)]
      workVec<-strsplit(workVec,"\\(|\\)|;")[[1]]
      workVec<-workVec[grep(workPattern,workVec)]
      workVec<-strsplit(workVec,"\\+")[[1]]
      blkMoves<-seq(2,length(workVec),2)
      workVec[blkMoves]<-paste(seq(along=blkMoves),
                               workVec[blkMoves],sep="...")
      return(workVec)
    }
  }
  if(type=="livechess"){
    stop("I can't extract this")
    Url<-paste("http://www.chess.com/echess/download_pgn?lid=",id,sep="")
    download.file(Url,"temp.pgn")
    workVec<-readLines("temp.pgn")
  }
}

# test chess.com game ID
testId<-function(id=1000,type="correspondence"){
  if(type=="correspondence"){
    Url<-"http://www.chess.com/echess/game?id="
    Url<-paste(Url,id,sep="")
    L<-length(readLines(Url))
    if(L==1059){return(T)}
    if(L==798){return(F)}
    if(!(L %in% c(798,1059))){return(NA)}
  }
  if(type=="live"){
    Url<-"http://www.chess.com/livechess/game?id="
    Url<-paste(Url,id,sep="")
    L<-length(readLines(Url))
    if(L==1008){return(T)}
    if(L==798){return(F)}
    if(!(L %in% c(798,1008))){return(NA)}
  }
}

# induced from: dboLeaders.R
debatePage<-function(Page){
  Url<-paste("http://www.debate.org/debates/?page=",floor(Page),",&order=2&sort=1",sep="")
  workVec<-htmlToText(Url)[[1]]
  workVec<-workVec[grep("[[:alpha:]]",workVec)]
  charLarge<-which(100<nchar(workVec))
  data.frame(Debate=workVec[charLarge-1],Status=workVec[charLarge+1],Comments=workVec[charLarge+2],
             Updated=workVec[charLarge+3],Description=workVec[charLarge])
}

# induced from: dboLeaders.R
dboFilter<-function(DF=dboLeaders,filterColumn="Ideology",filterPattern=""){
  print(filterPattern)
  DF<-DF[grep(filterPattern,DF[,filterColumn]),]
  DF[seq(1,nrow(DF),length.out=101),]
  percents<-cbind(quantile(DF$Debates,probs=seq(0,1,.01)),
                  quantile(DF$Won,probs=seq(0,1,.01)),
                  quantile(DF$Lost,probs=seq(0,1,.01)),
                  quantile(DF$Tied,probs=seq(0,1,.01)),
                  quantile(DF$Win.Ratio,probs=seq(0,1,.01)),
                  quantile(DF$Percentile1,probs=seq(0,1,.01)),
                  quantile(DF$Elo1,probs=seq(0,1,.01)))
  percents<-data.frame(percents)
  colnames(percents)<-c("Debates","Won","Lost","Tied","Win.Ratio","Percentile","Elo")
  DF
}

# induced from: dboLeaders.R
leaderPage<-function(Page){
  Url<-paste("http://www.debate.org/people/leaders/?page=",Page,"&order=21&sort=1",sep="")
  workVec<-htmlToText(Url)[[1]]
  n<-grep("Debates:",workVec)
  DF<-data.frame(Debates=workVec[n+1], Percentile2=workVec[n+5], Elo2=workVec[n+7], Ideology=workVec[n+9],
                 Party=workVec[n+11], Online=workVec[n+13], Member=workVec[n+14],Won=workVec[n+18],
                 Lost=workVec[n+20], Tied=workVec[n+22], Win.Ratio=workVec[n+24],Percentile1=workVec[n+26],
                 Elo1=workVec[n+28])
  DF
}


readAny<-function(File){
  FALSES<-0
  if(grepl("(\\.txt$)|(\\.csv$)",File)){
    Sample<-readLines(File)[1:2]
    readMethod<-function(S){
      writeLines(S,"temp.txt")
      samples<-list(table=read.table("temp.txt"),
                    csv=read.csv("temp.txt"),
                    csv2=read.csv2("temp.txt"),
                    delim=read.delim("temp.txt"),
                    delim2=read.delim2("temp.txt"))
      samples<-lapply(samples,ncol)
      method<-names(which(samples==max(unlist(samples))))
      if(1<length(method)){message("inconclusive")}
      else(return(method))
    }
    method<-readMethod(Sample)
    if(method=="table"){Sample<-read.table(File)}
    if(method=="csv"){Sample<-read.csv(File)}
    if(method=="csv2"){Sample<-read.csv2(File)}
    if(method=="delim"){Sample<-read.delim(File)}
    if(method=="delim2"){Sample<-read.delim2(File)}
  }else(FALSES<-FALSES+1)
  ifelse(grepl("\\.xlsx?$",File),
         Sample<-read.xlsx(File,1),
         FALSES<-FALSES+1)
  if(FALSES==2){
    Sample<-readLines(File)
  }
  Sample
}

Trees<-function(training=TRAIN[sample(nrow(TRAIN),size=100),],
                testing=TRAIN[sample(nrow(TRAIN),size=20),],
                p=0.75,predCol="classe",threshold=0.9,pcaComp=5){
  modFit<-train(predCol~.,method="rpart",data=training)
  predict(modFit,newdata=testing)
}

Impute<-function(training=TRAIN[sample(nrow(TRAIN),size=100),],
                         testing=TRAIN[sample(nrow(TRAIN),size=20),],
                         p=0.75,predCol="classe",threshold=0.9,pcaComp=5){
  colClasses<-class(training[,1]) # "integer"
  for(n in 2:160){colClasses<-c(colClasses,class(training[,n]))} # chr [1:160]
  Inputs<-which(colClasses %in% c("numeric","integer")) # int [1:123]
  M<-abs(cor(training[,Inputs]))
  diag(M)<-0
  Inputs<-dimnames(which(M>threshold,arr.ind=T))[[1]]
  prComp<-prcomp(training[,Inputs])
  MVCol<-function(COL,DF=training){
    preObj<-preProcess(DF[,Inputs],method="knnImpute")
    predCol<-predict(preObj,DF[,Inputs])[,COL]
    predCol
  }
  Impute<-MVCol(Inputs[1])
  for(II in Inputs[-1]){
    Impute<-cbind(Impute,MVCol(II))
  }
  Impute<-data.frame(Impute)
  names(Impute)<-Inputs
  Impute
}

getMeditate<-function(To=Sys.time(),
                      span=86400){
  From<-as.POSIXlt(To)-span
  filePath<-list.files("CSV Personal","allNotes.csv",full.names=T)
  DF<-read.csv(filePath);rm(filePath)
  DF<-DF[grep("meditate",DF[,"note"]),]
  DF<-DF[From<=as.vector(DF[,"Time"]) & as.vector(DF[,"Time"])<To,]
  INT<-grep("^[Ii]nterrupt",DF[,"note"])
  if(0<length(INT)){DF<-DF[-c(INT,INT-1),]}
  STR<-grep("^[Ss]tart",DF[,"note"])
  STP<-grep("^[Ss]top",DF[,"note"])
  if(length(STR)<length(STP)){STP<-STP[-1]}
  if(length(STP)<length(STR)){STR<-STR[-length(STR)]}
  DF<-data.frame(Start=DF[STR,"Time"],Stop=DF[STP,"Time"],
                 RESP=as.numeric(gsub("[[:alpha:]]| |[[:punct:]]","",as.vector(DF[STP,"note"]))))
  DF<-cbind(DF,floor(as.numeric(difftime(DF[,"Stop"],DF[,"Start"],units="secs"))))
  names(DF)<-c("start","stop","resp","secs")
  DF
}

search<-function(searchPat,DF,Col,Split="(\\.)|(\n)"){
  DF<-DF[grep(searchPat,DF[,Col]),]
  for(n in 1:nrow(DF)){
    Vec<-unlist(strsplit(DF[n,Col],Split))
    Vec<-Vec[grepl(searchPat,Vec)]
    class(DF[,Col])<-"character"
    DF[n,Col]<-paste(Vec,collapse=" \n ")
  }
  DF
}

frequency<-function(vec){
  wl<-replicate(length(unique(vec)),NA)
  for(n in 1:length(wl)){wl[n]<-sum(vec==sort(unique(vec)[n]))}; names(wl)<-sort(unique(vec))
  add.note("frequency(vec) #logFunction"); return(wl)
}

gdpPlot<-function(Dates=seq(1980,2014,1),
                  topCount=6,
                  justNations=T,
                  Colors=Colors<-c("darkgreen","black","deepskyblue","seagreen","red","midnightblue"),
                  Pch=list(6,5,7,3,2,"*"),
                  JPEG="data/ny.gdp.mktp.cd_Indicator_en_csv_v2/temp.jpg"){
  jpeg(JPEG)
  plot(x=GDP(Dates,"World")$year,
       y=as.numeric(gsub("%","",GDP(Dates,"World")$percent)),
       type="l", main="Wealth of Nations", sub="National GDP / World GDP",
       xlab="year", ylab="percentage", col="white", ylim=c(0,50))
  DF<-GDP(Dates,"")
  nationMelt<-function(nation){
    data.frame(nation,
               mean=mean(as.numeric(gsub("\\$","",DF[DF$nation==nation,"National GDP"]))))
  }
  dfMelt<-nationMelt(levels(DF$nation)[1])
  for(n in 2:length(levels(DF$nation))){
    dfMelt<-rbind(dfMelt,nationMelt(levels(DF$nation)[n]))
  }
  dfMelt<-dfMelt[order(dfMelt$mean,na.last=FALSE),]
  if(justNations){
    dfMelt<-dfMelt[!grepl("World| income|members|America|Asia|Euro",dfMelt$nation),]
  }
  Nations<-as.character(tail(dfMelt$nation,topCount))
  for(n in 1:length(Nations)){
    DF<-GDP(Dates,Nations[n])
    lines(x=DF$year,y=as.numeric(gsub("%","",DF$percent)),type="l",col=Colors[n],pch=Pch[[n]])
  }
  DF<-GDP(Dates,Nations[n])
  lines(x=DF$year,y=as.numeric(gsub("%","",DF$percent)),type="p",col=Colors[n],pch=Pch[[n]])
  legend("topleft",legend=Nations[1:2],fill=Colors[1:2],col=Colors[1:2],plot=T)
  legend("top",legend=Nations[3:4],fill=Colors[3:4],col=Colors[3:4],plot=T)
  legend("topright",legend=Nations[5:6],fill=Colors[5:6],col=Colors[5:6],plot=T)
  dev.off()
}

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

gdelt.temp<-function(DATE="2015-06-01",PROJECT="gkg"){
  datestamp<-gsub("-","",DATE)
  if(grepl("event",tolower(PROJECT))){
    project<-"events"
    url<-paste("http://data.gdeltproject.org/events/",datestamp,".export.CSV.zip",sep="")
    if("2013-04-01"<DATE){
      columns<-colnames(
        read.delim(
          textConnection(
            readLines("http://gdeltproject.org/data/lookups/CSV.header.dailyupdates.txt"))))
    }
    if(DATE<"2013-04-01"){
      names(df)<-colnames(
        read.delim(
          textConnection(
            readLines("http://gdeltproject.org/data/lookups/CSV.header.historical.txt"))))
    }
    Header<-FALSE
  }
  if(grepl("count",tolower(PROJECT))){
    project<-"gkgcounts"
    url<-paste("http://data.gdeltproject.org/gkg/",datestamp,".gkgcounts.csv.zip",sep="")
    Header<-TRUE
  }
  if(grepl("gkg",tolower(PROJECT)) & !grepl("count",tolower(PROJECT))){
    project<-"gkg"
    url<-paste("http://data.gdeltproject.org/gkg/",datestamp,".gkg.csv.zip",sep="")
    Header<-TRUE
  }
  download.file(url,destfile=("temp.zip"))
  dir.create("temp",showWarnings=FALSE)
  unzip("temp.zip",exdir="temp")
  df<-read.delim(paste("temp/",datestamp,".gkg.csv",sep=""),header=Header)
  file.remove(list.files("temp",full.names=TRUE))
  if(project=="events"){names(df)<-columns}
  return(df)
  print(summary(df))
}
# Author: Tony Breyal
# Date: 2011-11-18
# Modified: 2011-11-18
# Description: Extracts all text from a webpage (aims to extract only the text you would see in a web browser)
# Packages Used: RCurl, XML   
# Blog Reference: Not published
# Copyright (c) 2011, under the Creative Commons Attribution-NonCommercial 3.0 Unported (CC BY-NC 3.0) License
# For more information see: https://creativecommons.org/licenses/by-nc/3.0/
# All rights reserved.
###--- LOCAL FUNCTIONS ---###
# Determine how to grab html for a single input element
evaluate_input <- function(input) {    
  # if input is a .html file
  if(file.exists(input)) {
    char.vec <- readLines(input, warn = FALSE)
    return(paste(char.vec, collapse = ""))
  }  
  # if input is html text
  if(grepl("</html>", input, fixed = TRUE)) return(input)
  
  # if input is a URL, probably should use a regex here instead?
  if(!grepl(" ", input)) {
    # downolad SSL certificate in case of https problem
    if(!file.exists("cacert.perm")) download.file(url="http://curl.haxx.se/ca/cacert.pem", destfile="cacert.perm")
    return(getURL(input, followlocation = TRUE, cainfo = "cacert.perm"))
  }
  # return NULL if none of the conditions above apply
  return(NULL)
}
# convert HTML to plain text
convert_html_to_text <- function(html) {
  doc <- htmlParse(html, asText = TRUE)
  text <- xpathSApply(doc, "//text()[not(ancestor::script)][not(ancestor::style)][not(ancestor::noscript)][not(ancestor::form)]", xmlValue)
  return(text)
}
# format text vector into one character string
# collapse_text <- function(txt) {
#   return(paste(txt, collapse = " "))
# }
htmlToText <- function(input, ...) {
  ###---PACKAGES ---###
  require(RCurl)
  require(XML)
  ###--- MAIN ---###
  # STEP 1: Evaluate input
  html.list <- lapply(input, evaluate_input)
  # STEP 2: Extract text from HTML
  text.list <- lapply(html.list, convert_html_to_text)
  # STEP 3: Return text
  text.vector <- sapply(text.list, collapse_text)
  return(text.list)#(text.vector)
}

xmlNames<-function(rootNode){
  length(rootNode)
}

urlFrame<-function(url,date=Sys.Date(),comment="",sep="\n",charMin=3){
  text<-htmlToText(url)
#   https://github.com/tonybreyal/Blog-Reference-Functions/blob/master/R/htmlToText/htmlToText.R
  text<-unlist(strsplit(text,sep))
  text<-gsub("[[:space:]]+"," ",text)
  text<-gsub("^ | $","",text)
  text<-text[!text==""]
  text<-text[charMin<=nchar(text)]
  data.frame(date=date,text=text,url=url,textId=1:length(text),comment=comment)
}

add.resumeData<-function(data.type,content,comment=""){
  resumePath<-"./csv/resume.csv"
  resume<-read.csv(resumePath,colClasses="character")
  newFrame<-data.frame(data.type=data.type,
                       content=content,
                       comment=comment)
  resume<-rbind(resume,newFrame)
  write.csv(resume,resumePath,row.names=FALSE)
  print(tail(read.csv(resumePath)))
}

personFrame<-function(gkg,samplemax=1000){
  date<-unique(gkg$DATE)
  persons<-levels(gkg$PERSONS)
  persons<-persons[!persons==""]
  freq<-vector(mode="numeric",length=length(persons))
  for(n in 1:length(persons)){
    freq[n]<-sum(persons[n]==gkg$PERSONS)
  }
  persons<-data.frame(persons=persons,freq=freq)
  write.csv(persons,"./csv/persons.csv",row.names=FALSE)
  n<-1
  while(samplemax<=sum(n<=persons$freq)){
    n<-n+1
  }
  samplePersons<-persons[n<=persons$freq,]
  gkgSample<-subset(gkg,gkg$PERSONS %in% samplePersons$persons)
}

gdeltSummary.day<-function(counts,gkg,events,charLimit=130){
  countSummary<-cbind(file="gkg counts",dfSummary(counts,charLimit))
  gkgSummary<-cbind(file="global knowledge graph",dfSummary(gkg,charLimit))
  eventSummary<-cbind(file="events",dfSummary(events,charLimit))
  gdeltSummary<-rbind(countSummary,gkgSummary,eventSummary)
  gdeltSummary
}

dfSummary<-function(DF,charLimit="none"){
  workframe<-colSummary(1,DF,charLimit)
  for(row in 2:ncol(DF)){
    workframe<-rbind(workframe,colSummary(row,DF,charLimit))
  }
  workframe
}

colSummary<-function(col=1,DF=counts,charLimit="tweet"){
  if(grepl("tweet",tolower(charLimit))){charLimit=130}
  if(class(col) %in% c("numeric","integer")){col=colnames(DF)[col]}
  if(class(DF[,col])=="factor"){
    OBJECTS<-levels(DF[,col])
  }
  if(class(DF[,col]) %in% c("integer","numeric","character")){
    OBJECTS<-(unique(DF[,col]))
    OBJECTS<-OBJECTS[order(nchar(OBJECTS),OBJECTS)]
  }
  OBJECTS<-OBJECTS[!(OBJECTS==""|is.na(OBJECTS))]
  if(class(charLimit) %in% c("numeric","integer")){
    OBJECTS<-OBJECTS[nchar(OBJECTS)<=charLimit]
  }
  data.frame(variable=col,class=class(DF[,col]),count=length(OBJECTS),
             bottom=OBJECTS[1],lower=OBJECTS[ceiling(length(OBJECTS)*0.25)],
             center=OBJECTS[ceiling(length(OBJECTS)*0.5)],
             upper=OBJECTS[ceiling(length(OBJECTS)*0.75)],
             top=OBJECTS[length(OBJECTS)])
}

mySummary<-function(X){
  if(class(X)=="character"){
    if(file.exists(X)){
      X<-readLines(X)
    }
    return(summary(X))
  }
  if(class(X)==list){
    
  }
  
}

firstElement<-function(x){
  x[1]
}; 

secondElement<-function(x){
  x[2]
}; 

thirdElement<-function(x){
  x[3]
}; 

folderLines<-function(path,pattern){
  baseFrame<-fileFrame(path,pattern)
  if(exists("workFrame")){rm(workFrame)}
  for(n in baseFrame$fileId){
    if(exists("workFrame")){
      workFrame<-rbind(workFrame,
                       data.frame(baseFrame[n,],lineFrame(as.character(baseFrame$filepath[n]))))
    }else{
      workFrame<-data.frame(baseFrame[n,],lineFrame(as.character(baseFrame$filepath[n])))
    }
  }
  workFrame
}

lineFrame<-function(filepath){
  data.frame(rowId=1:length(readLines(filepath,warn=FALSE)),
             Line=readLines(filepath,warn=FALSE))
}

fileFrame<-function(path="./duke83.github.io",pattern="(html$)|(js$)|(css$)"){
  data.frame(fileId=1:length(list.files(path=path,pattern=pattern,full.names=TRUE,recursive=TRUE)),
             filepath=list.files(path=path,pattern=pattern,full.names=TRUE,recursive=TRUE))
}

fibonacci<-function(maximum=100,start=1){
  n<-start
  while(max(n)<maximum){
    n<-c(n,sum(sort(n)[length(n)],sort(n)[length(n)-1]))
  }
  n
}

mongo.quarter<-function(Year, Quarter,fileIds="all",online=FALSE,
                        username="TestUser",password="TestPassword",db="acdb",collection="fdicRaw",
                        host="ds051750.mongolab.com:51750",namespace="acdb.fdicRaw"){
  quarters<-data.frame(Q=c(1,2,3,4),
                       month=c("March","June","September","December"),
                       day=c(31,30,30,31),
                       datecode=c("0331","0630","0930","1231"))
  datecode<-paste(Year,
                  as.character(subset(quarters$datecode,quarters$Q==Quarter)),
                  sep="")
  if(length(list.files("./Data",pattern=datecode))==0){
    ifelse(online==TRUE,
           download.FDIC(Year,Quarter,"./Data"),
           stop("need online connection"))}
  if(1<length(list.files("./Data",pattern=datecode))){
    stop("what?")
  }
  if(online==FALSE){host<-"127.0.0.1"}
  folder<-file.path("./Data",list.files("./Data",pattern=datecode)[1])
  fileName<-list.files(folder,pattern="\\.csv")
  fileFrame<-data.frame(year=Year, quarter=Quarter, filePath=file.path(folder,fileName), 
                        fileName=fileName,
                        fileId=1:length(fileName),
                        username=username,password=password,db=db,collection=collection,
                        host=host,namespace=namespace)
  rm(folder,fileName,host,username,Year,Quarter)
  write.csv(fileFrame,"temp.csv",row.names=FALSE)
  fileFrame<-read.csv("temp.csv",colClasses="character")
  library(rmongodb)
  if(tolower(fileIds)=="all"){
    fileIds<-1:nrow(fileFrame)
  }
  for(n in fileIds){
    dataframe<-MongoClean(read.csv(fileFrame$filePath[n],colClasses="character"))
    dataframe<-cbind(fileId=fileFrame$fileId[n],
                     rowId=1:nrow(dataframe),
                     file=fileFrame$fileName[n],
                     year=fileFrame$year[n],
                     quarter=fileFrame$quarter[n],
                     dataframe)
    write.csv(dataframe,"temp.csv",row.names=FALSE)
    dataframe<-read.csv("temp.csv",colClasses="character")
    for(doc in 1:nrow(dataframe)){
      ifelse(online==TRUE,
             mongo <- mongo.create(host=fileFrame$host[n], db=fileFrame$db[n], 
                                   username=fileFrame$username[n], password=fileFrame$password[n]),
             mongo <- mongo.create(db="acdb"))
             b <- dataframe[doc,]
             b <- mongo.bson.from.list(as.list(b))
             ok <- mongo.insert(mongo, fileFrame$namespace[n], b)
             print(b)
    }
  }
}

quarter.remove<-function(year,quarter,destfolder="C:/Users/Administrator/Documents/FDIC"){
  quarters<-data.frame(Q=c(1,2,3,4),
                       month=c("March","June","September","December"),
                       day=c(31,30,30,31),
                       datecode=c("0331","0630","0930","1231"))
  datecode<-paste(year,
                  as.character(subset(quarters$datecode,quarters$Q==quarter)),
                  sep="")
  delFile<-paste(destfolder,"/All_Reports_",datecode,sep="")
  if(!file.exists(delFile)){
    message("file doesn't exist")
  }
  unlink(delFile,force=TRUE,recursive=TRUE) 
}

export.notes<-function(filepath,pattern){
  if(length(strsplit(getwd(),"/")[[1]])!=4
     | !grepl("Documents",getwd())){
    stop("relative filepath works from the 'Documents' workdir only")
  }
  if(grepl("./CSV Personal/notes.csv",filepath)){
    stop("notes cannot export to itself")
  }
  notes<-read.csv("./CSV Personal/notes.csv",colClasses="character")
  expnotes<-subset(notes,
                   grepl(tolower(pattern),tolower(notes$note))
                   | grepl(pattern,notes$time))
  notes<-subset(notes,
                !grepl(tolower(pattern),tolower(notes$note))
                & !grepl(pattern,notes$time))
  if(file.exists(filepath)){
    expnotes<-unique(rbind(read.csv(filepath,colClasses="character"),
                           expnotes))
  }
  write.csv(expnotes,filepath,row.names=FALSE)
  write.csv(notes,"./CSV Personal/notes.csv",row.names=FALSE)
  list(note=list(dim=dim(notes),
                 tail=tail(notes)),
       expnote=list(dim=dim(expnotes),
                    tail=tail(expnotes,3),
                    path=filepath))
}

MongoDefinitions<-function(year,quarter=3){
  add.note(paste("begin MongoDefinitions",
                 year,
                 quarter))
  host<-"ds051750.mongolab.com:51750"
  collection<-"DefinitionDocsFDIC"
  db<-"acdb"
  namespace<-"acdb.DefinitionDocsFDIC"
  password<-"TestPassword"
  username<-"TestUser"
  worklist<-as.list(replicate(nrow(workframe),""))
  for(n in 1:nrow(workframe)){
    ifelse(length(workframe$key[n])==1,
           worklist[[n]]<-list(VariableName=as.character(workframe$key[n]),
                               year=year,quarter=quarter,
                               docs=as.list(FDIC.varscan(year,quarter,workframe$key[n]))),
           worklist[[n]]<-list(VariableName=as.character(workframe$key[n]),
                               year=year,quarter=quarter,
                               docs=as.vector(FDIC.varscan(year,quarter,workframe$key[n]))))
  }
  add.note(paste(year,"quarter",quarter,"is processed and in R list form #autonote"))
  library(rmongodb)
  for(row in 1:length(worklist)){
    b<-mongo.bson.from.list(worklist[[row]])
    mongo <- mongo.create(host=host , db=db, username=username, password=password)
    ok <- mongo.insert(mongo, namespace, b)
  }
  quarter.remove(year,quarter)
  add.note(paste("FDIC Definitions for",
                 year,
                 quarter,
                 "in mongo - close MongoDefinitions() function #autonote"))
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

mongo.csv<-function(refRow,workdir=getwd(),readtype=1){
  filepath<-file.path(workdir,"CSV Personal/refFrame.csv")
  refFrame<-(read.csv(filepath,colClasses="character"))
  username<-refFrame$username[refRow]
  password<-refFrame$password[refRow]
  db<-refFrame$database[refRow]
  collection<-refFrame$collection[refRow]
  host<-refFrame$host[refRow]
  namespace <- paste(db, collection, sep=".")
  library(rmongodb)
  if(tolower(readtype)=="csv"){
    dataframe<-MongoClean(read.csv(refFrame$filepath[refRow],colClasses="character"))
    filename<-unlist(strsplit(refFrame$filepath[refRow],"/"))
    filename<-filename[length(filename)]
  }
  if(tolower(readtype)=="delim"){
    dataframe<-MongoClean(read.delim(refFrame$filepath[refRow],colClasses="character"))
    filename<-unlist(strsplit(refFrame$filepath[refRow],"/"))
    filename<-filename[length(filename)]
  }
  if(tolower(readtype) %in% c("link","fdic")){
    download.file(url=refFrame$filepath[refRow],destfile="./data/temp.csv.zip")
    unzip(zipfile="./data/temp.csv.zip",
          exdir="./data/temp.csv")
    dataframe<-MongoClean(read.csv("./data/temp.csv"))
    if(tolower(readtype)=="fdic")
    filename<-unlist(strsplit(refFrame$filepath[refRow],"/"))
  }
  for(doc in 1:nrow(dataframe)){
    mongo <- mongo.create(host=host , db=db, username=username, password=password)
    b <- mongo.bson.from.df(cbind(file=filename,dataframe[doc,]))
    if(!mongo.is.connected(mongo)){
      mongo.reconnect(mongo)
    }
    ok <- mongo.insert(mongo, namespace, b)
    print(dataframe[doc,])
  }
  refFrame$mostRecent<-paste(Sys.Date())
  write.csv(refFrame,filepath,row.names=FALSE)
  print(read.csv(filepath)[refRow,])
}

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

MongoClean<-function(object){
  troublechars<-read.csv("./CSV/troublechars.csv",colClasses="character")
  if(class(object)=="data.frame"){
    for(Trow in 1:nrow(troublechars)){
      names(object)<-gsub(troublechars$symbol[Trow],
                          troublechars$substitute[Trow],
                          names(object))
      for(Tcol in 1:ncol(object)){
        object[,Tcol]<-gsub(troublechars$symbol[Trow],
                            troublechars$substitute[Trow],
                            object[,Tcol])
      }
    }
  }
  if(class(object)=="list"){
    message("haven't gotten around to writing listclean")
  }
  if(class(object) %in% c("character","vector")){
    for(Trow in 1:nrow(troublechars)){
      object<-gsub(troublechars$symbol[Trow],
                   troublechars$substitute[Trow],
                   object)
    }
  }
  object
}

celltrim<-function(String){
  if(100<nchar(String)){
    lineCount<-1
    while(100<(nchar(String)/lineCount)){
      lineCount<-lineCount+1
    }
    divTarget<-nchar(String)/lineCount
    while(length(divTarget)<lineCount){
      divTarget<-c(divTarget,max(divTarget)+min(divTarget))
    }
    findspace<-function(Target){
      while(!strsplit(String,"")[[1]][Target]==" "){
        Target<-Target-1
      }
      Target
    }
    divTarget<-unlist(lapply(divTarget,findspace))
    linePaste<-function(...){
      paste(...,sep="\n")
    }
  }
}

export.notes<-function(filepath,query){
  if(length(strsplit(getwd(),"/")[[1]])!=4
     | !grepl("Documents",getwd())){
    stop("relative filepath works from the 'Documents' workdir only")
  }
  if(grepl("./CSV Personal/notes.csv",filepath)){
    stop("notes cannot export to itself")
  }
  notes<-read.csv("./CSV Personal/notes.csv",colClasses="character")
  expnotes<-subset(notes,
                   grepl(tolower(query),tolower(notes$note))
                   | grepl(query,notes$time))
  notes<-subset(notes,
                !grepl(tolower(query),tolower(notes$note))
                & !grepl(query,notes$time))
  if(file.exists(filepath)){
    expnotes<-unique(rbind(read.csv(filepath,colClasses="character"),
                           expnotes))
  }
  write.csv(expnotes,filepath,row.names=FALSE)
  write.csv(notes,"./CSV Personal/notes.csv",row.names=FALSE)
  list(note=list(dim=dim(notes),
                 tail=tail(notes)),
       expnote=list(dim=dim(expnotes),
                    tail=tail(expnotes,3),
                    path=filepath))
}

FBWords<-function(FBLink,FBProfile,FBComment,Date=paste(Sys.Date())){
  filepath<-file.path(getwd(),"CSV Personal/FBComments.csv")
  newrow<-data.frame(link=FBLink,Source=FBProfile,Text=FBComment,
                     Date=Date)
  DF<-read.csv(filepath)
  DF<-rbind(DF,newrow)
  write.csv(DF,filepath,row.names=FALSE)
  print(tail(read.csv(filepath),3))
}

=======
<<<<<<< HEAD
>>>>>>> d2a3c3a10dc56c8adc5cd1281333de604cc56fbd
linkgrid<-function(link1,
                   link2="",
                   link3="",
                   link4="",
                   link5="",
                   Year=2015,
                   Month="April",
                   comment="",
                   workdir="C:/Users/Josh/Documents"){
  filepath<-file.path(workdir,"CSV Personal/linkgrid.csv")
  df<-read.csv(filepath,colClasses="character")
  newrow<-data.frame(link1,link2,link3,link4,link5,Year,Month,comment)
#   newrow<-data.frame(link1="https://www.facebook.com/tennis.lilly/posts/10206463047873954",
#     link2="https://www.facebook.com/tennis.lilly",link3="",link4="",link5="",Year=2015,Month="April",comment="")
  df<-unique(rbind(df,newrow))
  write.csv(df,filepath,row.names=FALSE)
  print(tail(read.csv(filepath)))
}

review.note<-function(reviewnote,row,Time=Sys.time(),filepath="CSV Personal/regexnotes.csv",
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
  if(info=="wall"){
    lines<-
      readLines(
        file.path("C:/Users/Josh/Documents/Data/Facebook/html",
                  list.files("C:/Users/Josh/Documents/Data/Facebook/html")[17]
        )
        #,header=TRUE
        ,warn=FALSE
      )
  }
  lines
}

Descriptions<-function(DescLine=1,
                       lines_filepath="C:/Users/Josh/Documents/rmongodb.txt",split=TRUE){
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
}

<<<<<<< HEAD
=======
=======

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

slice.lines<-function(lines){
  lines<-gsub("\"","\\\"",readLines(filepath))
  #lines[as.integer(length(lines)*c(.5,.1,.15,.2,.25,.3,.35,.4,.45,.50,.55,.6,.65,.7,.75,.8,.85,.9,.95,1))]
  longframe<-data.frame(x=1:length(lines),line=lines)
  Table_of_Contents<-subset(df_lines,grepl("\\. \\. \\.",df$line))
  chapters<-gsub(" ","",gsub("(\\. )|9|8|7|6|5|4|3|2|1|0"," ",
                             as.vector(subset(
                               lines,lines %in% Table_of_Contents))))
  return(chapters)
}

>>>>>>> 6d6f5e40b7857c2e2b261c3388a6b822de08e712
>>>>>>> d2a3c3a10dc56c8adc5cd1281333de604cc56fbd

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

download.gdelt<-function(date=(Sys.Date()-1),PROJECT="gkg",
                         workdir=getwd()){
  datestamp<-gsub("-","",date)
  if(grepl("event",tolower(PROJECT))){
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
  if(grepl("count",tolower(PROJECT))){
    project<-"gkgcounts"
    url<-paste("http://data.gdeltproject.org/gkg/",datestamp,".gkgcounts.csv.zip",sep="")
    Header<-TRUE
  }
  if(grepl("gkg",tolower(PROJECT)) & !grepl("count",tolower(PROJECT))){
    project<-"gkg"
    url<-paste("http://data.gdeltproject.org/gkg/",datestamp,".gkg.csv.zip",sep="")
    Header<-TRUE
  }
  dir.create(file.path(workdir,project),showWarnings=FALSE)
  folderpath<-file.path(workdir,project,"export.csv")
  destfile<-file.path(workdir,project,"export.csv.zip")
  download.file(url,destfile)
  dir.create(folderpath,showWarnings=FALSE)
  unzip(destfile,exdir=folderpath)
  filepath<-file.path(folderpath, list.files(folderpath,c(datestamp,"*\\.csv")))
  df<-read.delim(filepath,header=Header)
  if(project=="events"){names(df)<-columns}
  print(filepath)
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

DS.lecsummary<-function(Summary,Row,Column,Time=Sys.time(),Command="find"){
  filepath<-finddoc("dslec")$filepath
  lectures<-read.csv(filepath,colClasses="character")
  if(class(Column)=="character"){timeColumn<-paste(Column,"Time",sep="")}
  if(class(Column)=="numeric"){timeColumn<-Column+1}
  if(class(Row) %in% c("numeric","integer")){
    print(lectures[Row,])
    if(Command=="modify"){
      lectures[Row,Column]<-summary
      lectures[Row,timeColumn]<-paste(Time)
      print(lectures[(Row-1):(Row+1),])
      View(lectures[(Row-1):(Row+9),])
      write.csv(lectures,filepath,row.names=FALSE)
    }
  }
}

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

number<-function(row,frame=personnel_total){
  n<-gsub(",","",frame$Amount[row])
  if(grepl(" million",n)==TRUE){
    return(as.numeric(gsub(" million","",n))*1000000)
  }else(return(n))
}

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

<<<<<<< HEAD

=======

>>>>>>> d2a3c3a10dc56c8adc5cd1281333de604cc56fbd
read.definitions<-function(n,SKIP=1,workdir=getwd()){
  folderpath<-file.path(workdir,"FDIC")
  filename<-list.files(folderpath,"*\\.csv")[n]
  filepath<-file.path(folderpath,filename)
  if(!file.exists(folderpath) | !file.exists(filepath)){
    dir.create(file.path(folderpath),showWarnings=FALSE)
    url<-"https://www2.fdic.gov/sdi/SDIAllDefinitions_CSV.zip"
    destfile<-file.path(workdir,"FDIC","SDIAllDefinitions_CSV.zip")
    download.file(url,destfile)
    unzip(destfile,exdir=file.path(workdir,"FDIC","SDIAllDefinitions_CSV"))
    file.remove(destfile)
    filename<-list.files(folderpath,"*\\.csv")[n]
    filepath<-file.path(folderpath,filename)
  }
  data<-cbind(read.csv(filepath,colClasses="character",skip=SKIP),file=filename)
  names(data)<-c("X","ShortDesciption","Variable","LongDescription","File")
  return(data[,c(1,3,2,4,5)])
}

<<<<<<< HEAD
=======
  >>>>>>> d2a3c3a10dc56c8adc5cd1281333de604cc56fbd  
alldefinitions<-function(workdir=getwd()){
  m<-length(list.files(file.path(workdir,"FDIC"),"*\\.csv"))
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
  if(grepl("^[Aa]ll[Nn]ote",keyword)){
    return(list(filepath="C:/Users/Josh/Documents/CSV Personal/allNotes.csv",
                docname="allNotes"))
  }
  if(tolower(keyword) %in% c('sorted notes','note2','notes2','notes2.csv')){
    return(list(filepath="C:/Users/Josh/Documents/CSV Personal/notes2.csv",
                docname="notes2"))
  }
  if(tolower(keyword) %in% c('coursera','coursera.csv','coursera.note','coursera notes','coursera note')){
    return(list(filepath="C:/Users/Josh/Documents/CSV Personal/coursera.csv",
                docname="coursera"))
  }
  if(grepl("^[Dd][Ss]\\.?[Ll]",keyword)){
    return(list(filepath="C:/Users/Josh/Documents/CSV/DSLectures.csv",
                docname="DSLectures"))
  }
  if(tolower(keyword) %in% c("regex")){
    return(list(filepath="C:/Users/Josh/Documents/CSV Personal/regexnotes.csv",
                docname="regexnotes"))
  }
  if(grepl("[Oo][Bb][Jj][Ee][Cc][Tt]",keyword)){
    return(list(filepath="./CSV Personal/paper.csv",
                docname="objects"))
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

add.object<-function(object,location,comment="",time=Sys.time(),material="",utility=""){
  objects<-read.csv("C:/Users/Josh/Documents/CSV Personal/paper.csv",colClasses="character")
  Y<-data.frame(object=object,location=location,time=time,
                comment=comment,material=material,utility=utility)
  objects<-rbind(objects,Y)
  write.csv(objects,"C:/Users/Josh/Documents/CSV Personal/paper.csv",row.names=FALSE)
  print(tail(objects,3))
}

add.note<-function(note,Time=Sys.time()){
  ifelse(grepl("#schedule",note),
         filePath<-"C:/Users/Josh/Documents/CSV Personal/allNotes.csv",
         filePath<-"C:/Users/Josh/Documents/CSV Personal/notes.csv")
  notes<-as.matrix(read.csv(filePath,colClasses="character"))
  obs<-as.matrix(data.frame(note,Time))
  notes<-rbind(notes,obs)
  write.csv(notes,filePath,row.names=FALSE)
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

var.masterlist<-function(directories){
  folder.variables<-function(quarterpath){
    varnames<-function(n){
      as.matrix(colnames(read.csv(list.files(quarterpath)[n],row.names = NULL)))
    }
    return(sort(unique(unlist(lapply(1:length(list.files()),varnames)))))
  }
  return(unique(unlist(lapply(directories,folder.variables))))
}

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
  if(pollutant=="sulfate"){
    selection<-as.numeric(
      as.character(
        read.csv(
          getElement(Sys.glob("*csv"),n))$sulfate))
    subset.pollutant<-subset(selection, !is.na(selection))
  }
}

read.pollutants<-function(id){
  lapply(id, read.pollutant)
}

read.pollutant<-function(n){
  if(pollutant=="sulfate"){
    selection<-read.csv(getElement(Sys.glob("*csv"),n))$sulfate
  }
  if(pollutant=="nitrate"){
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
             Frm=subset(From, m==unique(m)[n]))
}

splitandframe<-function(column,n){
  data.frame(Author=subset(Author, column==unique(column)[n]), 
             Organization=subset(Organization, column==unique(column)[n]), 
             Date=subset(Date, column==unique(column)[n]), 
             From=subset(From, column==unique(column)[n]))
}

effectivesplit<-function(n){
  Author<-as.matrix(read.csv("articles.txt")$Author)
  Date<-as.matrix(read.csv("articles.txt")$Date)
  Organization<-as.matrix(read.csv("articles.txt")$Organization)
  From<-as.matrix(read.csv("articles.txt")$From)
  data.frame(Author=subset(Author, From==unique(From)[n]), 
             Organization=subset(Organization, From==unique(From)[n]), 
             Date=subset(Date, From==unique(From)[n]), 
             From=subset(From, From==unique(From)[n]))
}

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

corrsingle<-function(directory, id){  
  setwd(directory)
  file<-read.csv(getElement(list.files(), id))
  complete<-subset(
    file, 
    !is.na(getElement(file, 2)) & 
      !is.na(getElement(file,3)))
  cor(complete[,2], complete[,3])
}

testquotes<-function(document){
  setwd("C:\\Users\\Josh\\Documents\\CSV")
  tail(read.csv(document, quote="",row.names=NULL, stringsAsFactors=FALSE))
}

testcsv<-function(document,n){
  setwd("C:\\Users\\Josh\\Documents\\CSV")
  tail(read.csv(document, row.names=NULL), n)
}

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

read<-function(id){read.csv(getElement(list.files(), id))}

squareColor<-function(square,game_pgn){
  if(grepl(blackPattern,position[game_pgn,square])){
    squareColor<-blackPattern
  }
  if(grepl(whitePattern,position[game_pgn,square])){
    squareColor<-whitePattern
  }
  if(!(grepl(paste("(",whitePattern,")",
                   "(",blackPattern,")",
                   sep="|"),
             position[game_pgn,square]))){
    squareColor<-NA
  }
  squareColor
}
