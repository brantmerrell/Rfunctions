#@"2014-10-15 15:39:04 CDT"
cran %>%
  select(ip_id, country, package, size) %>%
  mutate(size_mb = size / 2^20) %>%
  filter(size_mb <= 0.5) %>%
  arrange(desc(size_mb))

#@"2014-10-15 15:36:25 CDT"
cran %>%
  select(ip_id, country, package, size) %>%
  mutate(size_mb = size / 2^20) %>%
  filter(size_mb<=0.5)

#@ "2014-10-15 15:35:54 CDT"
cran %>%
  select(ip_id, country, package, size) %>%
  mutate(size_mb = size / 2^20)

#@"2014-10-15 15:24:34 CDT"
cran %>%
  select(ip_id, country, package, size) %>%
  print
## successful, but swirl doesn't move on
## waiting for me to modify swirl's .R

#@"2014-10-15 15:20:03 CDT"
cran %>%
  select() %>%
  print
# Error in .subset2(x, i, exact = exact) : subscript out of bounds

#@"2014-10-15 15:18:28 CDT"
result3 <- cran %>%
  group_by(package) %>%
  summarize(count = n(),
            unique = n_distinct(ip_id),
            countries = n_distinct(country),
            avg_bytes = mean(size)
            ) %>%
  filter(countries > 60) %>%
  arrange(desc(countries), avg_bytes)

chain {dplyr}