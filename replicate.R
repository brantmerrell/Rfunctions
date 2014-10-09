replicate(100, rpois(5,10))
#   returns 5*100 matrix of integers, each column of which has the approximate mean of 10

replicate(n, expr, simplify = "array")