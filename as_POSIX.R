as.POSIXct(schedule$start)

as.POSIXct("2014-10-08 21:11:33 CDT")

## objective: generate a *minute of day* vector from the start vector in schedule.R
#   input from concatenate.R
as.POSIXlt(start)$min
## successful @"2014-10-08 15:16:15 CDT"

## objective: generate an *hour of day* vector from the start vector in schedule.R
#   input from concatenate.R
as.POSIXlt(start)$hour
#   [1] 13 11 11 10  9  9  7  7  6  0 23 22 22 21 21
## successful

## objective: generate an *hour of day* vector from the start vector in schedule.R
#   input from concatenate.R
as.POSIXct(start)$hour
#   err '$' invalid for 'atomic vectors'
## unsuccessful @"2014-10-08 15:14:01 CDT", try POSIXlt?

## objective: create function of a time which can be unclassed into sec, min, hour,
## mday, mon, year, wday, yday, isdst, zone, and gmtoff.
as.POSIXlt("2014-10-08 14:58:29 CDT")
## successful. Continued in class.R


as.POSIXct(2014-10-08)
#   Err 'origin' must be supplied

as.POSIXct("2014-10-08")
#   [1] "2014-10-08 CDT"

as.POSIXct("2014-10-08 07:45:43")
#   [1] "2014-10-08 07:45:43 CDT"

as.POSIXct(Sys.time())
#   [1] "2014-10-08 08:35:58 CDT"

as.POSIXlt("2014-10-08 07:45:43")
#   [1] "2014-10-08 07:45:43 CDT"

as.POSIXlt("2014-10-08 07:45:43")$min
#   [1] 45

as.POSIXlt(Sys.time())$min
#   [1] 10

as.POSIXlt(Sys.time())$hour&&min
#   invalid 'y' in 'x && y'

as.POSIXlt(Sys.time())$hour&&$min
#   Err unexpected '$'

as.POSIXlt(Sys.time())
#   [1] "2014-10-08 00:00:58 CDT"