

mapply(mean,as.numeric(care_outcome[,11]), na.rm=TRUE)
##returns one number or NaN for each row

mapply(mean, care_outcome, na.rm=TRUE)
##returns one NA for each column

mapply(FUN, ..., MoreArgs = NULL, SIMPLIFY = TRUE, USE.NAMES = TRUE)