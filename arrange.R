#@"2014-10-15 15:39:04 CDT"
cran %>%
  select(ip_id, country, package, size) %>%
  mutate(size_mb = size / 2^20) %>%
  filter(size_mb <= 0.5) %>%
  arrange(desc(size_mb))
  

#@"2014-10-15 15:06:19 CDT"
result2 <-
  arrange(
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
    ),
    desc(countries),
    avg_bytes
  )


#@"2014-10-15 15:03:29 CDT"
result1 <- arrange(top_countries, desc(countries), avg_bytes)

"2014-10-15 14:58:55 CDT"
arrange(top_unique, desc(unique))

#@"2014-10-15 14:53:52 CDT"
arrange(top_counts, desc(count))

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