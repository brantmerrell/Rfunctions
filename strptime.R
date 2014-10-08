
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
