## http://en.wikipedia.org/wiki/Poisson_distribution
## probability of a given number of events occuring
## in fixed interval of time or space
## if at a known average rate
## and independently of the time since the last event

dpois(5, 10, log = FALSE)
# [1] 0.03783327

ppois(5, 10, lower.tail = TRUE, log.p = FALSE)
# [1] 0.06708596

qpois(5, 10, lower.tail = TRUE, log.p = FALSE)
# [1] NaN

#objective: manipulate inputs of Poisson distribution 
rpois(5, 10)
# [1] 12 15 10  7 14
# [1] 7 10 10  7  7
# [1] 12  7  7 12  7
# [1]  9 13 15 15  9
# [1] 11  9 13 10  4
rpois(4, 10)
# [1] 6 12 12 11
# [1] 10 13 9 8
# [1] 6 11 11 7
# [1] 7 10 10 16
# [1] 3 13 11 7
