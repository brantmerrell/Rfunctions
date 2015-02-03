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