dim(schedule)
#   [1] 51 5

dim(data.frame(read.csv("activity.txt")$activity,read.csv("start.txt")$start,read.csv("end.txt")$end,read.csv("location.txt")$location))
#   [1] 51 4

dim(data.frame(read.csv("activity.txt"),read.csv("start.txt"),read.csv("end.txt"),read.csv("location.txt")))
#   [1] 51 8

dim(read.csv("location.txt"))

dim(as.matrix(data.frame(activity,start,end,range,location)))
#   inputs from concatenate.R @"2014-10-08 13:02:22 CDT"
#   [1] 14  5

dim(as.matrix(c(activity,start,end,range,location)))
#   inputs from concatenate.R @"2014-10-08 12:43:00 CDT"
#   [1] 70 1


dim(data.frame(date,start_time,end_time,description))
## inputs from data_frame.R, concatenate.R, and schedule.R
#   [1] 2 4

dim(as.matrix(coltouse))
##see coltouse in control.R
##see care_outcome in data_input.R
## returns 4706    1

dim(as.vector(coltouse))
##see coltouse in control.R
##see care_outcome in data_input.R
##returns NULL

dim(coltouse)
##see coltouse in control.R
##see care_outcome in data_input.R
##returns NULL



