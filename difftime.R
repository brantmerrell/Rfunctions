# objective: generate timespans in minutes from s schedule.R for schedule2.R
difftime(end,start,units="mins")
# successful

# objective: generate timespans in hours from s schedule.R for schedule2.R
difftime(end,start,units="hours")
# successful

## objective: neatly & efficiently vector from 2 input vectors
## Sol change most recent "end" element from "null" to current time.
#   input from concatenate.R @"2014-10-08 12:14:30 CDT"
difftime(end,start)
#   [1]  20.51667  22.90000  36.23333  66.01667  28.15000  93.88333  11.65000  34.70000
#   [9] 398.50000  43.56667  50.88333  44.41667  12.00000  12.00000
## successful

##objective: neatly & efficiently vector from 2 input vectors
#   input from concatenate.R @"2014-10-08 12:10:54 CDT"
difftime(end,start)
#   Err ambiguous format


##objective: return hours:minutes format using as.difftime
object<-difftime(end,start)
as.difftime(object, format = "%H:%M")
#   Time differences in mins
#   [1]  25.23333  28.15000  93.88333  11.65000  34.70000 398.50000  43.56667  50.88333
#   [9]  44.41667  12.00000  12.00000
## unsuccessful

##objective: return hours:minutes format using format(x, ...)
format(difftime(end,start), "%H:%M")
#   Error in prettyNum(.Internal(format(x, trim, digits, nsmall, width, 3L,  : invalid 'trim' argument
## prettyNum? 
difftime(end,start,)

## objective: simplify from as.diff(difftime(X,Y))
as.difftime(end,start, format = "%H:%M")
as.difftime((end,start), format = "%H:%M")
as.difftime((end-start), format = "%H:%M")
#   inputs from concatenate.R for schedule.R
## unsuccessful.

## objective: return hours:minutes format using as.difftime(tim, format = "%X", units = "auto")
as.difftime(difftime(end,start), format = "%H:%M")
#   inputs from concatenate.R for schedule.R
#   Time differences in mins
#   [1]  25.23333  28.15000  93.88333  11.65000  34.70000 398.50000  43.56667  50.88333
#   [9]  44.41667  12.00000  12.00000
## unsuccessful.

difftime(end,start, units = "hours")
#   inputs from concatenate.R for schedule.R
#   [1] 0.4205556 0.4691667 1.5647222 0.1941667 0.5783333 6.6416667 0.7261111 0.8480556
#   [9] 0.7402778 0.2000000 0.2000000

difftime(end,start)
#   inputs from concatenate.R for schedule.R
#   [1]  25.23333  28.15000  93.88333  11.65000  34.70000 398.50000  43.56667  50.88333
#   [9]  44.41667  12.00000  12.00000

difftime(end,start)
#   inputs from concatenate.R for schedule.R
#   [1]   25.23333   28.15000   93.88333   11.65000   34.70000  398.50000 -165.30000
#   [8]   50.88333   44.41667   12.00000   12.00000
#   end[7] = "2014-10-07 20:52:00 CDT" should be original time, but date=2014-10-08
#   start[7] "2014-10-07 23:37:18 CDT"
# 

difftime(end,start)
#   inputs from concatenate.R for schedule.R
#   [1]    25.23333    28.15000    93.88333    11.65000    34.70000   398.50000
#   [7] -1396.43333    50.88333    44.41667    12.00000    12.00000
#       end[7] = "2014-10-07 00:20:52 CDT" change to 20:52:00
#       start[7] = "2014-10-07 23:37:18 CDT"

difftime("2014-10-07 21:50:00 CDT","2014-10-07 22:02:00 CDT")
#   inputs from concatenate.R for schedule.R
#   Time difference of-12 mins

difftime(end[10],start[10])
#   inputs from concatenate.R for schedule.R
#   Time difference of -11.8 hours

difftime("2014-10-07 21:50:00 CDT","2014-10-07 10:02:00 CDT")
#   inputs from concatenate.R for schedule.R
#   Time difference of 11.8 hours

difftime("2014-10-07 20:52:00 CDT","2014-10-07 23:37:18 CDT")
#   inputs from concatenate.R for schedule.R
#   Time difference of -2.755 hours

difftime("2014-10-07 00:20:52 CDT","2014-10-07 23:37:18 CDT")
#   inputs from concatenate.R for schedule.R
#   Time difference of -23.27389 hours

difftime(end[7],start[7])
#   inputs from concatenate.R for schedule.R
#   Time difference of -23.27389 hours

difftime(start[7],end[7])
#   inputs from concatenate.R for schedule.R
#   Time difference of 23.27389 hours

difftime(end,start)
#   inputs from concatenate.R for schedule.R
#   [1]    25.23333    28.15000    93.88333    11.65000    34.70000   398.50000
#   [7] -1396.43333    50.88333    44.41667  -708.00000    12.00000

difftime(start,end)
#   inputs from concatenate.R for schedule.R
#   [1]  -25.23333  -28.15000  -93.88333  -11.65000  -34.70000 -398.50000 1396.43333
#   [8]  -50.88333  -44.41667  708.00000  -12.00000

difftime("2014-10-08 07:34:04 CDT","2014-10-08 06:59:22 CDT", units = 'mins')
#   Time difference of 34.7 mins

difftime("07:34:04 CDT","06:59:22 CDT")
## Err format

difftime(Sys.time(), "2014-10-07 22:09:46 CDT", units = 'days')
#   Time difference of 0.08980604 days