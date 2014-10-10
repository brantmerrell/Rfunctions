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
