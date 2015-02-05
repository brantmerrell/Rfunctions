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
