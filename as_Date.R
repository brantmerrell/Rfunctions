as.Date("2014-10-06", format = "%d-%m-%Y")
#   [1] NA
#   Format doesn't determine the output format, 
#   it enables as.Date to read the input.

as.Date("2014-10-06")
#   [1] "2014-10-06"

as.Date(Sys.time())

as.Date("1969-01-01")
#   [1] "1969-01-01"