class(as.matrix(data.frame(activity,start,end,range,location)))
#   inputs from concatenate.R @"2014-10-08 13:01:16 CDT"
#   [1] "matrix"


class(as.matrix(c(activity,start,end,range,location)))
#   inputs from concatenate.R @"2014-10-08 12:38:31 CDT"
#   [1] "matrix"

class("grid")
#   input from concatenate.R @"2014-10-08 12:34:47 CDT"
#   [1] character

class("activity")
#   input from concatenate.R @"2014-10-08 12:25:17 CDT"

class(end)
#   input from concatenate.R @"2014-10-08 12:06:10 CDT"
#   [1] "character"

class(start)
#   input from concatenate.R @"2014-10-08 12:05:12 CDT"
#   [1] "character"

class(difftime("2014-10-08 07:34:04 CDT","2014-10-08 06:59:22 CDT", units = 'mins'))
#   [1] "difftime"

class(data.frame(date,start_time,end_time,description))
##  inputs from data_frame.R, concatenate.R, and schedule.R
#   [1] "data.frame"

class(as.POSIXct("2014-10-08"))
#   [1] "POSIXct" "POSIXt"

class(as.POSIXlt(Sys.time()))
#   [1] "POSIXlt" "POSIXt"

class(c(Date="2014-10-08"))
#   character

class(c(Date=2014-10-08))
#   numeric

class(strptime("October 17, 1986 08:24", "%B %d, %Y %H:%M"))
#   [1] "POSIXlt" "POSIXt"

class(Sys.Date()) 
#   [1] "Date"

class(Sys.time()) 
#   [1] "POSIXct" "POSIXt"

unclass(as.Date("1969-01-01")) 
#   [1] -365

unclass(Sys.Date()) 
#   [1] 16350
#     = days since 1970

unclass(as.POSIXlt(Sys.time()))
#   $sec
#       [1] 47.64533
#   $min
#       [1] 2
#   $hour
#       [1] 0
#   $mday
#       [1] 8
#   $mon
#       [1] 9
#   $year
#       [1] 114
#   $wday
#       [1] 3
#   $yday
#       [1] 280
#   $isdst
#       [1] 1
#   $zone
#       [1] "CDT"
#   $gmtoff
#       [1] -18000

attr(,"tzone")
[1] ""    "CST" "CDT"

unclass(Sys.time())
#   [1] 1412744093 
#     = seconds since 1970