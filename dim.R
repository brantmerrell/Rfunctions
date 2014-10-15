

#@"2014-10-15 10:24:19 CDT"
## response to nrow.R"2014-10-15 10:10:28 CDT"
dim(subset(data.frame(read.csv("002.csv")), sulfate != "NA"))
# [1] 1041  4
dim(subset(data.frame(read.csv("002.csv")), sulfate == "NA"))
# [1] 0   4
# There are NAs in 002, why are they not subsetted? See subset.R"2014-10-15 10:49:01 CDT"

#@"2014-10-15 08:06:31 CDT"
dim("002.csv")
#   NULL

#@"2014-10-14 14:35:33 CDT"
## swirl, Getting and Cleaning Data, Manipulating Data with dplyr
dim(mydf)
#   [1] 225468     11
## successful

#@"2014-10-11 15:32:35 CDT"
dim("2014-10-11 15:31:51 CDT")
#   NULL

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



