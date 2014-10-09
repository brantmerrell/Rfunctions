## objective: tabulate the 1's in a binary sample
sum(sample(c(0,1), 100, replace = TRUE, prob = c(0.3, 0.7)))
#   [1] 71
