
## remove NA column that was added by read.csv
as.vector(read.csv("location.txt"))
## unsuccessful

## Oct 7 - what is a good way to represent chessboard pgn?
rows<-c("1","2","3","4","5","6","7","8")
columns<-c("a","b","c","d","e","f","g","h")
pieces<-c("King","Queen","Rook","Bishop","Knight","Pawn")
## see PGN_97721646.R and concatenate.R
## algebraically, building a data frame or matrix is innefficient. 
## just use these vectors to generate coordinates and match them with equations.

as.vector(
  AKframe[n,c(1,3)]
  ALframe[n,c(1,3)]
  ARframe[n,c(1,3)]
  AZframe[n,c(1,3)]
  CAframe[n,c(1,3)]
  COframe[n,c(1,3)]
  CTframe[n,c(1,3)]
  DEframe[n,c(1,3)]
  DCframe[n,c(1,3)]
  FLframe[n,c(1,3)]
  GAframe[n,c(1,3)]
  HIframe[n,c(1,3)]
  IDframe[n,c(1,3)]
  ILframe[n,c(1,3)]
  INframe[n,c(1,3)]
  IAframe[n,c(1,3)]
  KSframe[n,c(1,3)]
  KYframe[n,c(1,3)]
  LAframe[n,c(1,3)]
  MEframe[n,c(1,3)]
  MDframe[n,c(1,3)]
  MAframe[n,c(1,3)]
  MIframe[n,c(1,3)]
  MNframe[n,c(1,3)]
  MSframe[n,c(1,3)]
  MOframe[n,c(1,3)]
  MTframe[n,c(1,3)]
  NEframe[n,c(1,3)]
  NVframe[n,c(1,3)]
  NHframe[n,c(1,3)]
  NJframe[n,c(1,3)]
  NMframe[n,c(1,3)]
  NYframe[n,c(1,3)]
  NCframe[n,c(1,3)]
  NDframe[n,c(1,3)]
  OHframe[n,c(1,3)]
  OKframe[n,c(1,3)]
  ORframe[n,c(1,3)]
  PAframe[n,c(1,3)]
  PRframe[n,c(1,3)]
  RIframe[n,c(1,3)]
  SCframe[n,c(1,3)]
  SDframe[n,c(1,3)]
  TNframe[n,c(1,3)]
  TXframe[n,c(1,3)]
  UTframe[n,c(1,3)]
  VTframe[n,c(1,3)]
  VIframe[n,c(1,3)]
  VAframe[n,c(1,3)]
  WAframe[n,c(1,3)]
  WVframe[n,c(1,3)]
  WIframe[n,c(1,3)]
  WYframe[n,c(1,3)]
  GUframe[n,c(1,3)]
)
##returns error: unexpected ')'
as.vector(coltouse)
##see coltouse in control.R
##see care_outcome in data_input.R
##returns 4706 columns of coltouse


statevector<-unique(care_outcome[,7])
##returns all abbreviations for states in order of their care_outcome listing

statenumber<-c(1:54)
##returns numbers 1-54 to correspond with states