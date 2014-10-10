## experiment with tapply, FUN length.
tapply(schedule$activity, schedule$end, length)
#   returns endtimes paired with 1s.

## experiment with tapply, FUN mean.
tapply(schedule$activity, unclass(as.POSIXlt(schedule$end))$sec, mean)
#   returns 32 numbers paired with 32 warnings

## experiment with tapply, FUN mean.
tapply(schedule$activity, schedule$end, mean)
#   returns NA's.
#   I need to stop treating times as numbers.

## experiment with tapply, FUN mean.
tapply(schedule$end, schedule$activity, mean)
#   returns activity vector paired with NA's. Class: array.

## experiment with summary for schedule.R
tapply(schedule$end, schedule$start, summary)
# returns 30 grids labelled by time
# each with 30 times paired with 0's.

## experiment with summary for schedule.R
tapply(schedule$activity, INDEX=NULL, summary)
# Err arguments must have the same length

## experiment with summary for schedule.R
tapply(schedule$activity, schedule$start, summary)
# returns 30 grids labelled by time
# each with 16 activities paired with 16 0's.

## experiment with summary for schedule.R
tapply(schedule$start, schedule$activity, summary)
# returns 16 grids labelled by activity, 
# each with 30 times paired with 30 0's.

## experiment with mean for schedule.R
tapply(schedule$start, schedule$activity, mean)
# returns 16 activities with 16 warnings

## experiment with mean for schedule.R
tapply(schedule$start, schedule$end, mean)
# returns 30 times paired with 30 warnings

## experiment with mean for schedule.R
tapply(schedule$activity, schedule$start, mean)
# returns 30 dates paired with 30 warnings

## swirl assignment
tapply(flags$animate, flags$landmass, mean)
# returns an array split into 6-columns by landmass
# with only one row - a mean for each landmass.

## swirl assignment
tapply(flags$population, flags$red, summary)
# returns array divided into 2 grids by red=FALSE and red=TRUE 
# and 6 columns by numeric summary

## swirl assignment
tapply(flags$population, flags$landmass, summary)
# returns array divided into 6 grids by landmass 
# and into 6 columns by numeric summary