
filepath="C:/Users/Josh/Documents/rmongodb.txt"
write.csv(longframe,"C:/Users/Josh/Documents/rmongodb_2.txt")

chapters_manual<-data.frame(row=1:length(chapters),
                            chapter=chapters,
                            arguments="")

n<-subset(chapters_manual$row,chapters_manual$chapter=="mongo.create")
class(chapters_manual[,3])<-"character"
chapters_manual[n,3]<-"host="127.0.0

#n<-2
#View(longframe)
dim(
subset(df[,c(
  #24,
  #23,
  1,2)],
  df$column_1 %in% chapters 
  & !is.na(df$column_2)
  & !grepl("(M|m)ongo",df$column_2) 
  & !grepl("(\\. \\. \\. )|(have)|(1|2|3|4|5|6|7|8|9|0)",df$line)
  )[as.integer(242*(1/20:1)),]
)


dim(
  subset(df[,c(
    #24,
    #23,
    1,2)],
    df$column_1 %in% chapters # eliminates to 668, 448 to eliminate before 180 chapters
    & (is.na(df$column_2) # eliminates to 115, 65 to return before 180 chapters
       | df$column_2=="BSON") # eliminates to 138, 42 to return before 180 chapters
    #& !grepl("(M|m)ongo",df$column_2) 
    #& !grepl("(\\. \\. \\. )|(have)|(1|2|3|4|5|6|7|8|9|0)",df$line))
    )#[as.integer(115*(1/20:1)),]
)
668-180
length(chapters)-115
length(chapters)-138

sections<-c("Description","Usage","Format","Value","See","Examples","Details")
# change testline's default "iterate" argument from 1 to 2

n<-2
while(n<=nrow(longframe)){
  Title<-c(Title,as.character(title[[n]][1]))
  n<-n+1
}
longframe<-cbind(longframe,Title)
(lapply(longframe[30:35,2],testline))
for(n in title){
  Title<-title
}
while(n<=nrow(workframe)){
  if(workframe$line[n] %in% functions){workframe$FUN[n]<-workframe$line[n]}
  else{workframe$FUN[n]<-workframe$FUN[n-1]}
  n<-n+1
}
n<-2
workframe<-cbind(workframe,portion="")
workframe$portion<-as.character(workframe$portion)
portions<-c("Description","Usage","Arguments","Details","See Also","Examples","Value")
while(n<=nrow(workframe)){
  if(workframe$line[n] %in% portions){
    workframe$portion[n]<-workframe$line[n]
  }
  else{workframe$portion[n]<-workframe$portion[n-1]}
  n<-n+1
}
n<-2
while(n<=nrow(workframe)){
  if(workframe$line[n]=="Description"){
    workframe$FUN[n]==workframe$line[n-1]
  }
  else{workframe$FUN[n]==workframe$FUN[n-1]}
  n<-n+1
}
unique(workframe$signal)

write.csv(workframe,"./CSV/rmongodb.csv")
