gamesize<-function(id){
  filepath<-"C:/Users/Josh/Documents/chess/chesspgn.csv"
  chesspgn<-read.csv(filepath,colClasses="character")
  game<-subset(chesspgn,chesspgn$ID==id)
  black<-max(as.numeric(subset(game$move,game$color=="black")))
  white<-max(as.numeric(subset(game$move,game$color=="white")))
  return(mean(c(black,white)))
}
