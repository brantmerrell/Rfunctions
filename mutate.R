#@ "2014-10-15 15:35:54 CDT"
cran %>%
  select(ip_id, country, package, size) %>%
  mutate(size_mb = size / 2^20)

#@"2014-10-14 16:19:50 CDT"
## swirl, Getting and Cleaning Data, Manipulating Data with dplyr
mutate(cran3, correct_size = size + 1000)
## successful: generates column from  cran3's size column by adding 1,000 to each element.

#@"2014-10-14 16:18:56 CDT"
## swirl, Getting and Cleaning Data, Manipulating Data with dplyr
mutate(cran3, size_mb = size / 2^20, size_gb = size_mb / 2^10)
## successful: generates size_mb from cran3 (megabyte = 2^20 bytes)
## and size_gb from size_mb from size_mb (gigabyte=2^10 bytes)

#@"2014-10-14 16:17:46 CDT"
## swirl, Getting and Cleaning Data, Manipulating Data with dplyr
mutate(cran3, size_mb = size / 2^20)
## successful: adds a column to cran3 that contains download size in megabytes (2^20 bytes)