#@"2014-10-15 15:07:06 CDT"
summarize(
  group_by(cran,
           package
  ),
  count = n(),
  unique = n_distinct(ip_id),
  countries = n_distinct(country),
  avg_bytes = mean(size)
)

#@"2014-10-15 15:01:58 CDT"
pack_sum <- summarize(by_package,
                      count = n(),
                      unique = n_distinct(ip_id),
                      countries = n_distinct(country),
                      avg_bytes = mean(size))


#@"2014-10-15 13:27:21 CDT"
pack_sum<-summarize(by_package,
                    count = n(),
                    #                     number of rows for each package
                    unique = n_distinct(ip_id),
                    #                     number of unique downloads for each package
                    countries = n_distinct(country),
                    #                     number of countries in which each package was downloaded
                    avg_bytes = mean(size))
#                     mean download size for each package
## no Err returned "2014-10-15 14:32:53 CDT"
# on swirl, returns 1st 10 rows (1 per package), with 4 columns of numeric values.

#@"2014-10-15 14:11:39 CDT"
summarize(by_package, mean(size))


#@"2014-10-14 16:20:42 CDT"
## swirl, Getting and Cleaning Data, Manipulating Data with dplyr
summarize(cran, avg_bytes = mean(size))
## successful: selects size column of cran, calculates the mean and labels as 'avg_bytes'