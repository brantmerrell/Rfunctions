## objective: reformat a time listed in schedule.R to "%Y-%m-%d %H:%M"
format("2014-10-08 13:52:47 CDT", format = "%Y-%m-%d %H:%M")
#   Still returns %S
## unsuccessful @"2014-10-08 14:54:18 CDT"

## objective: reformat a time listed in schedule.R to "%H:%M
strptime("2014-10-08 13:52:47 CDT", format = "%Y %H:%M:%S")
#   [1] NA
## unsuccessful


## objective: reformat a time listed in schedule.R to "%H:%M
strptime("2014-10-08 13:52:47 CDT", format = "%H:%M", usetz = TRUE)
#   Err unused argument usetz @"2014-10-08 14:46:06 CDT"
strptime("2014-10-08 13:52:47 CDT", format = "%H:%M")
#   [1] NA
## unsuccessful. Possibly due to absence of date in "%H:%M" format

strptime("2014-10-08 08:01:51 CDT", "%Y-%B-%d %H:%M:%S")
#   [1] NA

strptime(Sys.time(), "%B %d, %Y %H:%M")
#   [1] NA

strptime(Sys.time(), "%B %d")
#   [1] NA

strptime(Sys.time(), %B)
#   Err unexpected input

strptime("October 17, 1986 08:24", "%B %d, %Y %H:%M")
#   [1] "1986-10-17 08:24:00 CDT"
