#@"2014-10-19 15:39:42 CDT"
file1<-read.csv("001.csv")
newrow<-c("2014-10-18", "NA", "NA", "0")
rbind(file1, newrow)
## successful
