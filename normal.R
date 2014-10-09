dnorm(1, mean = 0, sd = 1, log = FALSE)
# [1] 0.2419707

dnorm(C(0.3,0.7), mean = 0, sd = 1, log = FALSE)
# Error in C(0.3, 0.7) : object not interpretable as a factor

pnorm(c(0.3,0.7), mean = 0, sd = 1, lower.tail = TRUE, log.p = FALSE)
# [1] 0.6179114 0.7580363

qnorm(c(0.3,0.7), mean = 0, sd = 1, lower.tail = TRUE, log.p = FALSE)
# [1] -0.5244005  0.5244005

rnorm(10, mean = 0, sd = 1)
# [1]  0.3038440  0.8730555  0.9063358  0.8134060 -0.8495061  1.1803215  0.3319214
# [8]  0.6667439 -0.1663060  1.3958133

rnorm(10, mean = 100, sd = 25)
# [1]  56.50057  76.47550  59.53272 114.84957 105.61659 102.66641 130.01673 106.34069
# [9]  74.93502  95.83656