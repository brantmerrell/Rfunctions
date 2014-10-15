#@"2014-10-15 15:36:25 CDT"
cran %>%
  select(ip_id, country, package, size) %>%
  mutate(size_mb = size / 2^20) %>%
  filter(size_mb<=0.5)

#@"2014-10-15 15:06:32 CDT"
filter(
  summarize(
    group_by(cran,
             package
    ),
    count = n(),
    unique = n_distinct(ip_id),
    countries = n_distinct(country),
    avg_bytes = mean(size)
  ),
  countries > 60
)

#@"2014-10-15 15:02:51 CDT"
top_countries <- filter(pack_sum, countries > 60)

#@"2014-10-15 14:57:52 CDT"
top_unique<-filter(pack_sum, unique > 465)

#@"2014-10-15 14:45:40 CDT"
top_counts<-filter(pack_sum, count > 679)
## 69 rows because dataset has fewer than 100 rows

#@"2014-10-14 16:10:02 CDT"
## swirl, Getting and Cleaning Data, Manipulating Data with dplyr
filter(cran, !is.na(r_version))
## successful: returns columns in which r_version is numeric.

#@"2014-10-14 16:10:02 CDT"
## swirl, Getting and Cleaning Data, Manipulating Data with dplyr
filter(cran, size > 100500, r_os == "linux-gnu")
## successful: returns all rows of cran with size greater than 100500 
## in which r_os equals linux-gnu

#@"2014-10-14 16:09:46 CDT"
## swirl, Getting and Cleaning Data, Manipulating Data with dplyr
filter(cran, country == "US" | country == "IN")
## successful: returns all rows with country US, and all rows with country IN.

#@"2014-10-14 16:08:10 CDT"
## swirl, Getting and Cleaning Data, Manipulating Data with dplyr
filter(cran, r_version <= "3.0.2", country == "IN")
## successful: returns all rows with r_version earlier or equal to 3.0.2 in country IN.

#@"2014-10-14 16:07:55 CDT"
## swirl, Getting and Cleaning Data, Manipulating Data with dplyr
filter(cran, r_version == "3.1.1", country == "US")
## successful: returns all rows with r_version 3.1.1 and country US.

#@"2014-10-14 16:04:35 CDT"
## swirl, Getting and Cleaning Data, Manipulating Data with dplyr
filter(cran, package == "swirl")
## successful: returns only rows whose package equals swirl.