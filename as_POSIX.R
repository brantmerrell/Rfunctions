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