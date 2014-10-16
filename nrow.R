#@"2014-10-15 21:07:28 CDT"
nobs<-nrow(subset(read.csv(getElement(list.files(), id)), !is.na(read.csv(getElement(list.files(), id))$sulfate) & !is.na(read.csv(getElement(list.files(), id))$nitrate)))

#@"2014-10-15 18:42:13 CDT"
nrow(subset(
  read.csv(getElement(list.files(), 1)), 
  !is.na(read.csv(getElement(list.files(), 1))$sulfate ) &
    !is.na(read.csv(getElement(list.files(), 1))$nitrate)))
# [1] 15747
# same as subset of sulfate alone

#@"2014-10-15 10:12:28 CDT"
nrow(read.csv(getElement(list.files(), 1))$sulfate)
# NULL

#@"2014-10-15 10:10:28 CDT"
nrow(subset(read.csv(getElement(list.files(), 1)), sulfate !="NA"))
# [1] 15747
# Why does NA + !NA of sulfate not equal total?

#@"2014-10-15 10:00:44 CDT"
nrow(subset(read.csv(getElement(list.files(), 1)), sulfate =="NA"))
# [1] 0

#@"2014-10-15 09:59:19 CDT"
nrow(read.csv(getElement(list.files(), 1)))
#   [1] 56256

#@"2014-10-15 09:56:29 CDT"

#   [1] 15747
## should be 117

#@"2014-10-15 08:46:44 CDT"
nrow(subset(read.csv(getElement(list.files(), id)), sulfate !="NA"))
#   Err object ID not found

#@"2014-10-15 08:43:53 CDT"
nrow(subset(read.csv(getElement(list.files(), id))), sulfate!="NA")
#   Err unused argument (sulfate!="NA")

#@"2014-10-15 08:33:04 CDT"
nrow(subset(read.csv("001.csv"), nitrate != "NA"))
#   [1] 15902
## data.frame() is redundant in previous implementations

nrow(subset(data.frame(read.csv("001.csv")), nitrate != "NA"))
#   [1] 15902
## nobs do not match

#@"2014-10-15 08:24:42 CDT"
nrow(subset(data.frame(read.csv("030.csv")), nitrate != "NA"))
#   [1] 980
## nobs do not match

#@"2014-10-15 08:23:38 CDT"
nrow(subset(data.frame(read.csv("030.csv")), sulfate != "NA"))
#   [1] 932
## nobs match

#@"2014-10-15 08:22:41 CDT"
nrow(subset(data.frame(read.csv("012.csv")), sulfate != "NA"))
#   [1] 96
## nobs match

#@"2014-10-15 08:22:02 CDT"
nrow(subset(data.frame(read.csv("010.csv")), sulfate != "NA"))
#   [1] 148
## nobs match

#@"2014-10-15 08:21:08 CDT"
nrow(subset(data.frame(read.csv("008.csv")), sulfate != "NA"))
#   [1] 192
## nobs match

"2014-10-15 08:20:13 CDT"
nrow(subset(data.frame(read.csv("004.csv")), sulfate != "NA"))
#   [1] 474
## nobs match

#@"2014-10-15 08:19:17 CDT"
nrow(subset(data.frame(read.csv("002.csv")), sulfate != "NA"))
#   [1] 1041
## nobs match

#@"2014-10-15 08:12:22 CDT"
nrow(data.frame(read.csv("002.csv"), na.rm=TRUE))
#   [1] 3652

#@"2014-10-15 08:10:32 CDT"
nrow(read.csv("002.csv"))
#   [1] 3652

ncol(schedule)
#   [1] 5

ncol(plants)
#   [1] 10