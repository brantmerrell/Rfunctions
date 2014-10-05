order(coltouse,)

order(z, -b)
## z<-c(1,1,1,2)
## b<-c("Hi","Med","Hi","Low")
##see   http://stackoverflow.com/questions/
##      1296646/how-to-sort-a-dataframe-by-columns-in-r
## returns error: invalid argument to unary operator
##    z returns 1 1 1 2
##    -z returns -1 -1 -1 -2

order(z, b)
## z<-c(1,1,1,2)
## b<-c("Hi","Med","Hi","Low")
##see   http://stackoverflow.com/questions/
##      1296646/how-to-sort-a-dataframe-by-columns-in-r
## returns 1 3 2 4 . . . so Hi=1, Hi=2, Med=3, Low=4

order(-z, b)
## z<-c(1,1,1,2)
## b<-c("Hi","Med","Hi","Low")
##see   http://stackoverflow.com/questions/
##      1296646/how-to-sort-a-dataframe-by-columns-in-r
## returns 4 1 3 2 . . . so Hi=-1 & 4th, Med=-1 & , Hi=-1, Low=-2?

##  

testsorter<-dataframetest[order(dataframetest[,47]),]
  ##dataframetest<-data.frame(care_outcome,rankcoltouse)
  ##rankcoltouse<-rank(coltouse,na.last=TRUE,ties.method=c("first"))
    ##see coltouse in control.R
    ##see care_outcome in data_input.R

sort(dataframetest, partial = NULL, dataframetest[,47])
##error: decreasing must be length-1 logical vector

ccc[order(ccc[,2])]
##ccc<-data.frame(a,b)
##undefinded columns selected

c<-order(data.frame(a,b)[,2], na.last=TRUE, decreasing=FALSE)
##b<-as.matrix(split(care_outcome[,11], care_outcome$State))[1]
##a<-as.matrix(split(care_outcome$Hospital.Name, care_outcome$State))[1]
##assigns a "rank number" to each Alaskan hospital 
##based on the H.A. mortality rate
##undefined columns selected

sort.list(dataframestate$coltouse)
##dataframestate<-data.frame(care_outcome[,7],rankcoltouse)
##coltouse<-care_outcome[,11]
##returns one numeric rank for each row

##sort data frame
testsorter<-dataframetest[order(dataframetest[,47]),]
##returns 4706x47 data frame arranged by coltouse
##testsorter$Hospital.Name returns ordered hospital names
  ##dataframetest<-data.frame(care_outcome,rankcoltouse)
  ##rankcoltouse<-rank(coltouse,na.last=TRUE,ties.method=c("first"))
  ##see coltouse in control.R

order(..., na.last = TRUE, decreasing = FALSE)
