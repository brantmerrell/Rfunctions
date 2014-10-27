
read.csv("outcome-of-care-measures.csv")#"2014-10-27 16:16:20 CDT"

read.csv("quotes.txt") # warning: EOF within quoted string
## http://stackoverflow.com/questions/17414776/read-csv-warning-eof-within-quoted-string-prevents-complete-reading-of-file
read.csv("quotes.txt", quote="",row.names=NULL, stringsAsFactors=FALSE)

#@"2014-10-15 07:48:33 CDT"
read.csv(getElement(list.files(), 1))
## successful

#@"2014-10-14 23:35:42 CDT"
read.csv("001.csv")$sulfate
## successful

#@"2014-10-14 23:27:06 CDT"
read.csv("001.csv")$ID
## successful

#@"2014-10-14 23:16:59 CDT"
read.csv("001.csv")
## successful

#@"2014-10-14 14:41:41 CDT"
## Swirl, Getting and Cleaning Data, Manipulating Data with dplyr
mydf<-read.csv(path2csv, stringsAsFactors = FALSE)
## successful

#@"2014-10-13 13:14:14 CDT"
read.csv("jtleek_datascientist_test.txt")

#@"2014-10-13 09:25:00 CDT"
DST_v1<-read.csv("DST_video1.txt")
#   119 columns
#   <0 rows> (or 0-length row.names)
## replaces spaces with dots

## test for subset.R"2014-10-11 16:40:54 CDT"
activity<-read.csv("testschedule.txt")$activity
start<-read.csv("testschedule.txt")$start
end<-read.csv("testschedule.txt")$end
location<-read.csv("testschedule.txt")$location

## test for subset.R"2014-10-11 16:37:49 CDT"
activity<-read.csv("activity.txt")$activity
start<-read.csv("start.txt")$start
end<-read.csv("end.txt")$end
location<-read.csv("location.txt")$location
## successful

@"2014-10-11 15:19:38 CDT"
read.csv("testschedule.txt")
# 5*85

@"2014-10-11 15:18:38 CDT"
read.csv("schedule.txt")
# 5*85

@"2014-10-11 15:08:53 CDT"
read.csv("testschedule.txt")
# 5*75

@"2014-10-11 14:51:21 CDT"
read.csv("testschedule.txt")
# 5*75

@"2014-10-11 14:38:54 CDT"
read.csv("testschedule.txt")
# 5*70

@"2014-10-11 14:20:59 CDT"
read.csv("testschedule.txt")
# 5*69

@"2014-10-11 14:09:20 CDT"
read.csv("testschedule.txt")
# 4*69

@"2014-10-11 13:57:41 CDT"
read.csv("testschedule.txt")
# 3*69

@"2014-10-11 13:56:07 CDT"
read.csv("testschedule.txt")
#   Err No such file

# smooth transition from testbudget to budget? @"2014-10-10 22:57:17 CDT"
read.csv("Budget.txt")
# affrm

# @"2014-10-10 22:29:09 CDT"
# Hyp: if $Description is comma-separated from $Amount, read.csv will run smoothly.
read.csv("testbudget2.txt")
# correct 
read.csv("testbudget.txt")
# correct

# Hyp: if "Description" duplicates of "Category" are renamed to N/A, read.csv will run smoothly
read.csv("testbudget2.txt")
#   Err duplicate row.names not allowed
## incorrect

# http://stackoverflow.com/questions/15285089/
# r-duplicate-row-names-are-not-allowed
# Hyp: if all seven columns are provided inputs for all rows, 
# read.csv("testbudget.txt") will return 7 columns with no errors or warnings.
## testbudget is trimmed to testbudget2 (5x7)
read.csv("testbudget2.txt")
#   Err duplicate row.names not allowed

# @"2014-10-10 22:06:57 CDT"
read.csv("testbudget.txt")
#   Err duplicate row.names not allowed
#   previous read.csv("testbudget.txt") allows several replications in $Date and $Category
#   Possibility: new column $ReCategory has observations in rows 1-5, 9, and 26.
#   Hyp: if $Recategory is filled in from rows 1 to 26, 
#   read.csv("testbudget.txt") will return 7 columns with no errors or warnings.
#   incorrect

# Do CSV files need quotes for dollar values?
# with quotes:
read.csv("testbudget.txt")
#   Err more columns than column names
## used 'enter' to separate columns
# with quotes:
read.csv("testbudget.txt")
#   returns seven columns with no warnings
# no quotes on $Balance columns:
read.csv("testbudget.txt")
#   returns the same thing

## implement answer from link:
## http://stackoverflow.com/questions/22171858/
## in-read-table-incomplete-final-line-found-by-readtableheader
read.csv("Budget.txt")
## operational and returns no warning
## successful

# CSV file in which commas are placed between all objects
read.csv("Budget.txt")
#   Warning: read.table(file = file, header = header, sep = sep, quote = quote,  : 
#   incomplete final line found by readTableHeader on 'Budget.txt'
## operational
## http://stackoverflow.com/questions/22171858/
## in-read-table-incomplete-final-line-found-by-readtableheader

# CSV file in which colnames and data are separated by a non-comma
read.csv("Budget.txt")
#   Warning: read.table(file = file, header = header, sep = sep, quote = quote,  : 
#   incomplete final line found by readTableHeader on 'Budget.txt'
## operational. Comma inconsistency not origin of warning, but not helpful.

read.csv("location.txt")
read.csv("end.txt")
read.csv("start.txt")
read.csv("activity.txt")
## Automatically makes first element the label
## Automatically labels a column X full of NA's.
## class: "data.frame" dim: 51 2

## objective: simulate "i = read.table("file.txt",header=TRUE)"
## from http://stackoverflow.com/questions/11187306/r-heatmap-on-imported-matlab-table
## for experiment in matrix.R @"2014-10-08 13:25:59 CDT"
i<-read.table("hospital-data.csv",header=TRUE)
#   Err more columns than column names
## unsuccessful


