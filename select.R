#@"2014-10-14 16:16:47 CDT"
## swirl, Getting and Cleaning Data, Manipulating Data with dplyr
cran3<-select(cran, ip_id, package, size)
## successful: takes subset of cran consisting only of columns ip_id, package, and size.

#@"2014-10-14 16:12:40 CDT"
## swirl, Getting and Cleaning Data, Manipulating Data with dplyr
cran2<-select(cran, size:ip_id)
## successful: selects columns size, r_version, r_arch, r_os, package, version,
## country, and ip_id from cran.

#@"2014-10-14 16:03:10 CDT"
## swirl, Getting and Cleaning Data, Manipulating Data with dplyr
select(cran, -(X:size))
## successful: excludes columns X, date, time, and size from cran.

#@"2014-10-14 16:02:42 CDT"
## swirl, Getting and Cleaning Data, Manipulating Data with dplyr
select(cran, -time)
## successful: selects all columns except time from cran.

#@"2014-10-14 16:02:11 CDT"
## swirl, Getting and Cleaning Data, Manipulating Data with dplyr
select(cran, country:r_arch)
## successful: selects columns country, version, package, r_os, and r_arch from cran.

#@"2014-10-14 14:46:16 CDT"
## swirl, Getting and Cleaning Data, Manipulating Data with dplyr
select(cran, r_arch:country)
## successful: selects columns r_arch, r_os, package, version, and country from cran.

#@"2014-10-14 14:34:54 CDT"
## swirl, Getting and Cleaning Data, Manipulating Data with dplyr
select(cran, ip_id, package, country)
## successful: selects columns ip_id, package, and country from dataframe cran.