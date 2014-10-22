## Swirl R Programming lapply and sapply
sapply(flags, unique) #@"2014-10-21 23:52:24 CDT"
sapply(unique_vals, length) #@"2014-10-21 23:51:52 CDT"
shape_mat<-sapply(flag_shapes, range) #@"2014-10-21 23:39:46 CDT"
sapply(flag_colors, mean)#@"2014-10-21 23:34:36 CDT"
sapply(flag_colors, sum) #@"2014-10-21 23:33:08 CDT"

cls_vect<-sapply(flags, class) #@"2014-10-21 20:09:59 CDT"

sapply(care_outcome[,11], mean, na.rm=TRUE, simplify = TRUE, USE.NAMES = TRUE)
#returns one number or "Not Available" for each row

sapply(care_outcome, mean, na.rm=TRUE, simplify = TRUE, USE.NAMES = TRUE)
##returns one NA for every column

sapply(care_outcome, mean, simplify = TRUE, USE.NAMES = TRUE)
##returns one NA for every column

sapply(X, FUN, ..., simplify = TRUE, USE.NAMES = TRUE)