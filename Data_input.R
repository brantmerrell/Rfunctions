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


##rankall.R Read outcome data
care_outcome<-read.csv("outcome-of-care-measures.csv", colClasses = "character")


##best.R
care_outcome<-read.csv("outcome-of-care-measures.csv", colClasses = "character")
hospital_data<-read.csv("hospital-data.csv")

##best.R
read.csv("C:\\Users\\Josh\\Documents\\Coursera\\rprog-data-ProgAssignment3-data\\outcome-of-care-measures.csv", colClasses = "character")

read.table(file, header = FALSE, sep = "", quote = "\"'",
           dec = ".", numerals = c("allow.loss", "warn.loss", "no.loss"),
           row.names, col.names, as.is = !stringsAsFactors,
           na.strings = "NA", colClasses = NA, nrows = -1,
           skip = 0, check.names = TRUE, fill = !blank.lines.skip,
           strip.white = FALSE, blank.lines.skip = TRUE,
           comment.char = "#",
           allowEscapes = FALSE, flush = FALSE,
           stringsAsFactors = default.stringsAsFactors(),
           fileEncoding = "", encoding = "unknown", text, skipNul = FALSE)

read.csv(file, header = TRUE, sep = ",", quote = "\"",
         dec = ".", fill = TRUE, comment.char = "", ...)

read.csv2(file, header = TRUE, sep = ";", quote = "\"",
          dec = ",", fill = TRUE, comment.char = "", ...)

read.delim(file, header = TRUE, sep = "\t", quote = "\"",
           dec = ".", fill = TRUE, comment.char = "", ...)

read.delim2(file, header = TRUE, sep = "\t", quote = "\"",
            dec = ",", fill = TRUE, comment.char = "", ...)