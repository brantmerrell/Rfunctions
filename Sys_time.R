
Sys.time() > "2014-10-07 22:09:46 CDT"
#   [1] TRUE

Sys.time() - "2014-10-07 22:09:46 CDT"
#   Error in unclass(e1) - e2 : non-numeric argument to binary operator

Sys.time()
#   [1] "2014-10-07 22:09:46 CDT"

class(Sys.Date()) 
#   [1] "Date"

Sys.Date() 
#   [1] "2014-10-07"


Sys.time()
Sys.Date()