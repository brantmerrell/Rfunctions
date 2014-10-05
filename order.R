

trimmed_outcome[order(trimmed_outcome[,3],-trimmed_outcome[,1]),]
##trimmed_outcome<-data.frame(Hospital.Name=care_outcome[,2],State=care_outcome[,7],Outcome=coltouse)
##see coltouse in control.R
##see care_outcome in data_input.R
## returns outcome first by outcome then by alphabet

order(coltouse)
##see coltouse in control.R
##see care_outcome in data_input.R
##returns numbers corresponding to coltouse, but not in rank order

trimmed_outcome[order(trimmed_outcome[,3]),]
##trimmed_outcome<-data.frame(Hospital.Name=care_outcome[,2],State=care_outcome[,7],Outcome=coltouse)
##see coltouse in control.R
##see care_outcome in data_input.R
## returns listing by Outcome rate

trimmed_outcome[order(trimmed_outcome[,2]),]
##trimmed_outcome<-data.frame(Hospital.Name=care_outcome[,2],State=care_outcome[,7],Outcome=coltouse)
##see coltouse in control.R
##see care_outcome in data_input.R
## returns alphabetic listing by state

trimmed_outcome[order(trimmed_outcome[,1]),]
##trimmed_outcome<-data.frame(Hospital.Name=care_outcome[,2],State=care_outcome[,7],Outcome=coltouse)
##see coltouse in control.R
##see care_outcome in data_input.R
## returns alphabetic listing by hospital name

trimmed_outcome[order(trimmed_outcome$outcome),]
##trimmed_outcome<-data.frame(Hospital.Name=care_outcome[,2],State=care_outcome[,7],Outcome=coltouse)
##see coltouse in control.R
##see care_outcome in data_input.R
##returns error: outcome not a vector

trimmed_outcome[order(Outcome)]
##trimmed_outcome<-data.frame(Hospital.Name=care_outcome[,2],State=care_outcome[,7],Outcome=coltouse)
##see coltouse in control.R
##see care_outcome in data_input.R
##returns err outcome not found

order(-z)
## z<-c(1,5,3,9)
## returns 4 2 3 1
## same as order(-z, b)
## -1 is 4th, -5 is 2nd, -3 is 3rd, -9 is 1st

order(-z, b)
## z<-c(1,5,3,9)
##  returns 
## b<-c("Hi","Med","Hi","Low")
## returns 4 2 3 1
## so [Hi, -1, 4th] [Med, -5, 2nd] [Hi, -3, 3rd] [Low, -9, 1st]
## is b even an active argument to order?

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
## returns 4 1 3 2 . . . so Hi=-1 & 4th, Med=-1 & 3rd, Hi=-1 2nd, Low=-2 & 1st?

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
