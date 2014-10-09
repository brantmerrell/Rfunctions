hist(rpois(5,10))
#   generates a histogram from 5 random outputs of the Poisson distribution

hist(replicate(100, rpois(5,10)))
#   groups 500 numbers into spans of 1.0 and generates a resulting histogram

hist(colMeans(replicate(100, rpois(5,10))))
#   groups 100 numbers into spans of 1.0 and generates a resulting histogram

hist_11<-hist(care_outcome[,11])
#X=care_outcome[,11]


hist(x, ...)

## Default S3 method:
hist(x, breaks = "Sturges",
     freq = NULL, probability = !freq,
     include.lowest = TRUE, right = TRUE,
     density = NULL, angle = 45, col = NULL, border = NULL,
     main = paste("Histogram of" , xname),
     xlim = range(breaks), ylim = NULL,
     xlab = xname, ylab,
     axes = TRUE, plot = TRUE, labels = FALSE,
     nclass = NULL, warn.unused = TRUE, ...)
