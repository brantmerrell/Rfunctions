#@"2014-10-19 16:58:37 CDT"
sort(sulfate1) ## sulfate1<-read.csv("001.csv")$sulfate

sort(coltouse)
##see coltouse in control.R
##see care_outcome in data_input.R
##returns coltouse numbers in rank order, but not ranked.


sort(care_outcome$State)
##rearranges states in alphabetical order

sort(care_outcome[,11])
##rearranges care_outcome[,11] into ascending order

## Return the subset of hospitals sorted in alphabetical order
sort(besthospitals[,2])


sort(x, decreasing = FALSE, ...)

## Default S3 method:
sort(x, decreasing = FALSE, na.last = NA, ...)

sort.int(x, partial = NULL, na.last = NA, decreasing = FALSE,
         method = c("shell", "quick"), index.return = FALSE)
