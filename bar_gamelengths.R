bar_gamelengths<-function(chessgrid,filepath,note=NULL){
  n<-length(unique(chessgrid$ID))
  col<-colors()[24:(24+n)]
  jpeg(filepath)
  hist(as.numeric(chessgrid$move),col=c("grey10","grey20","grey30","grey40","grey50"),density=c(50,90,70),
       angle=c(0,45),main=paste("Histogram of move numbers in",n,"games"),sub=note,xlab="movenumbers")
  dev.off()
}
