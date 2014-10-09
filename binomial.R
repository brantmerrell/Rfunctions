qbinom(1, size = 100, prob = 0.7, lower.tail = TRUE, log.p = TRUE)
# [1] NaN

qbinom(1, size = 100, prob = 0.7, lower.tail = TRUE, log.p = FALSE)
# [1] 100

pbinom(1, size = 100, prob = 0.7, lower.tail = TRUE, log.p = TRUE)
# [1] -114.9405

pbinom(1, size = 100, prob = 0.7, lower.tail = TRUE, log.p = FALSE)
# [1] 1.207701e-50

dbinom(1, size = 100, prob = 0.7, log = TRUE)
# [1] -114.9448

dbinom(1, size = 100, prob = 0.7, log = FALSE)
# [1] 1.202548e-50

rbinom(1, size = 100, prob = 0.7)
# [1] 70
# [1] 70
# [1] 72
# [1] 80
# [1] 65