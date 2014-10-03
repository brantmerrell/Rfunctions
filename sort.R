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
