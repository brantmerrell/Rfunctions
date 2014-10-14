#@"2014-10-14 16:15:21 CDT"
## swirl, Getting and Cleaning Data, Manipulating Data with dplyr
arrange(cran2, country, desc(r_version), ip_id)
## successful: arranges cran2 according to country(ascending),
## r_version (descending), and ip_id (ascending)

#@"2014-10-14 16:14:39 CDT"
## swirl, Getting and Cleaning Data, Manipulating Data with dplyr
arrange(cran2, package, ip_id)
## successful: arranges the rows of cran2 first according to package (ascending)
## and then ip_id (ascending)

#@"2014-10-14 16:13:51 CDT"
## swirl, Getting and Cleaning Data, Manipulating Data with dplyr
arrange(cran2, desc(ip_id))
## successful: arranges the rows of cran2 according to column ip_id (descending)

#@"2014-10-14 16:13:03 CDT"
## swirl, Getting and Cleaning Data, Manipulating Data with dplyr
arrange(cran2, ip_id)
## successful: arranges the rows of cran2 according to column ip_id (ascending)