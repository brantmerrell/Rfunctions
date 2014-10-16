#@"2014-10-15 18:58:59 CDT"
nobs(getElement(list.files(), 1))
# subscript out of bounds

#@"2014-10-15 18:57:02 CDT"
nobs(5)
# [1] 402
nobs(6)
# [1] 228
nobs(2)
# [1] 1041

#@"2014-10-15 18:52:15 CDT"
nobs(read.csv("001.csv")$sulfate)
# Err attempt to select more than one element 

"2014-10-15 18:48:24 CDT"
nobs(read.csv(getElement(list.files(), 1)))
# Err no 'nobs' method available

"2014-10-15 18:46:45 CDT"
nobs(read.csv(getElement(list.files(), 1)))
# Err no 'nobs' method available

"2014-10-15 18:46:30 CDT"
nobs(read.csv(getElement(list.files(), id)))
# Err id not found