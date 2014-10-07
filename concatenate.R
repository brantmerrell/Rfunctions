## Oct 7 - what is a good way to represent chessboard pgn?
rows<-c("1","2","3","4","5","6","7","8")
columns<-c("a","b","c","d","e","f","g","h")

pieces<-c("King","Queen","Rook","Bishop","Knight","Pawn")
pcs<-c("K","Q","R","B","N","P")
## see vector.R and concatenate.R

## what is a good way to represent chessboard pgn?
rows<-c("1","2","3","4","5","6","7","8")
columns<-c("a","b","c","d","e","f","g","h")
pieces<-c("King","Queen","Rook","Bishop","Knight","Pawn")
pcs<-c("K","Q","R","B","N","P")
## see vector.R and PGN_97721646

statnum_matrix <- c("as.matrix(orderedsplit$","n", ")")
  ##orderedsplit <- split (testsorter$Hospital.Name, testsorter$State)
    ##alphebatized this time, not in care_outcome order
  ##testsorter<-dataframetest[order(dataframetest[,47]),]
  ##dataframetest<-data.frame(care_outcome,rankcoltouse)
  ##rankcoltouse<-rank(coltouse,na.last=TRUE,ties.method=c("first"))
    ##see coltouse in control.R
    ##see care_outcome in data_input.R
##returns "as.matrix(orderedsplit$" "n" ")"

see ?c