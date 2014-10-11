# schedule.R @"2014-10-11 12:29:47 CDT"
mean(Rschedule$hours)
#   0.9036237
mean(Rschedule$minutes)
#   54.21742

mean(workschedule$minutes)
#   Time difference of 53.79127 mins

mean(c(1,1,2,3,5,8,13), trim=0, na.rm=TRUE)
##returns 4.714286

mean(numeric13, trim=0, na.rm=TRUE)
##returns NA

mean(care_outcome[,11], trim=0, na.rm=TRUE)
##returns NA

## Default S3 method:
mean(x, trim = 0, na.rm = FALSE, ...)