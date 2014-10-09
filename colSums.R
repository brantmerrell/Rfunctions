colMeans(replicate(100, rpois(5,10)))
#   returns list of 100 numbers near the number 10

colMeans(numeric13_14, na.rm = TRUE, dims = 1)
##returns means of both columns of numeric13_14
##numeric13_14<-data.frame(numeric13,numeric14)
##numeric[n]<care_outcome[,[n]]

colMeans(numeric13_14, 2, 2, na.rm = TRUE)
##returns error: dims = 2
##numeric13_14<-data.frame(numeric13,numeric14)
##numeric[n]<care_outcome[,[n]]

colMeans(numeric13_14, 2, 2, na.rm = TRUE)
##returns error: unused argument (2)
##numeric13_14<-data.frame(numeric13,numeric14)
##numeric[n]<care_outcome[,[n]]

colSums(numeric13_14, na.rm = FALSE, dims = 1)
##numeric13_14<-data.frame(numeric13,numeric14)
##numeric[n]<care_outcome[,[n]]
##returns two results, both NAs.

colSums (numeric13_14, na.rm = TRUE, dims = 1)
##numeric13_14<-data.frame(numeric13,numeric14)
##numeric[n]<care_outcome[,[n]]
##returns two sums: one for numeric13, one for numeric14

colSums (numeric13, na.rm = TRUE, dims = 1)
##numeric13<-as.numeric(care_outcome[,13])
##returns error: 'x' must be an array of at least two dimensions

colSums (care_outcome[,11:12], na.rm = TRUE, dims = 1)
##returns error: 'X' must be numeric

colSums (care_outcome[,11], na.rm = TRUE, dims = 1)
##returns error: 'x' must be an array of at least two dimensions

colSums (care_outcome, na.rm = TRUE, dims = 1)
##returns error: 'X' must be numeric

colSums (x, na.rm = FALSE, dims = 1)
rowSums (x, na.rm = FALSE, dims = 1)
colMeans(x, na.rm = FALSE, dims = 1)
rowMeans(x, na.rm = FALSE, dims = 1)