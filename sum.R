
sum(flags$orange) #@"2014-10-21 23:12:30 CDT"


#@"2014-10-11 22:15:51 CDT"
## input from function.R
sum(RStudio$hours)
#   25.61306
sum(CSV$hours)
#   3.454167

# from schedule.R @"2014-10-11 12:28:23 CDT"
sum(Rschedule$hours)
# 19.87972

# How does R express a negative sign?
sum(5.00,-6.00)
#   [1] -1
## minus sign

# Does R recognize parenthesis as equivalents to negative signs in finance?
sum($5.00,$6.00)
#   Error: unexpected '$' in "sum($"
sum(5.00,6.00)
#   [1] 11
sum((5.00),(6.00))
#   [1] 11
## parentheses are not recognized as negatives
## dollar signs render numbers non-numeric

sum(workschedule2$minutes)
#   Time difference of 910.9333 mins

sum(workschedule2)
# Err

# find out whether the 6 means returned by this tapply add up to 1.
sum(tapply(flags$animate, flags$landmass, mean))
# [1] 1.298573
# Successful, they do not. There was no reason they should,
# but it still looked like they might. Good to make sure.

## objective: tabulate the 1's in a binary sample
sum(sample(c(0,1), 100, replace = TRUE, prob = c(0.3, 0.7)))
#   [1] 71
