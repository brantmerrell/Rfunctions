# #@Sys.time()
# line of code
# #output

#@"2014-10-17 11:36:18 CDT"
getElement(list.files(), 3)
# [1] "The_Library_of_Babel.htm"

#@"2014-10-15 07:46:02 CDT"
getElement(list.files(), 1)
#   [1] "001.csv"

#@"2014-10-15 06:55:58 CDT"
getElement(file.append("001.csv","002.csv"), "sulfate")
#   Err subscript out of bounds

#@"2014-10-15 06:54:19 CDT"
getElement(file.append("001.csv","002.csv"), 2)
#   Err subscript out of bounds

#@"2014-10-15 06:51:55 CDT"
getElement(file.append("001.csv","002.csv"), 1)
#   [1] TRUE

#@"2014-10-15 06:46:41 CDT"
file.append("001.csv", "002.csv")[1]
#   [1] TRUE

#@"2014-10-15 06:37:25 CDT"
file.append("001.csv", "002.csv")$sulfate
#   Err operator is invalid for atomic vectors

#@"2014-10-15 06:36:19 CDT"
file.append("001.csv", "002.csv")[5]
#   [1] NA

#@"2014-10-14 23:54:46 CDT"
getElement(read.csv("001.csv"), pollutant)

#@"2014-10-14 23:53:03 CDT"
getElement(read.csv("001.csv"), 2)
#   returns second column

#@"2014-10-14 23:51:09 CDT"
getElement(read.csv("001.csv"), "sulfate")
#   returns sulfate column

#@"2014-10-14 23:46:18 CDT"
read.csv("001.csv")[2,3, drop = FALSE]
#   returns row 2 column 3

#@"2014-10-14 23:43:33 CDT"
read.csv("001.csv")[1]
## returns date column