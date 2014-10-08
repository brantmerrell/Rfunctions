## objective: concatenate hour and minute vectors from as_POSIX.R into %H:%M format
c(as.POSIXlt(start)$hour,as.POSIXlt(start)$min)
#   [1] 13 11 11 10  9  9  7  7  6  0 23 22 22 21 21 52 52 30 53 47 19 45 34 59 20 37 46
#   [28]  2 50 38
## unsuccessful

## objective: construct vector of names to test rownames.force in matrix.R
names<-c("name1","name2","name3","name4","name5","name6","name7","name8",
         "name9","name10","name11","name12","name13","name14")
## concatenation successful

## objective: create 14x4 grid of activity, start, end, range, and location for schedule.R
grid<-c(activity,start,end,range,location)
#   list of 70 values of class "character"
## unsuccessful
## Sol see data_frame.R and matrix.R

## objective: label and create vector for the schedule.R *location* column
location<-c("SMU","SMU","car","La Madeleine","car","car","apartment","apartment","apartment","apartment","apartment","apartment","apartment","apartment")
## successful

## objective: label and create vector for the schedule.R *action* column
activity<-c("R Programming",
            "walking",
            "driving",
            "R Programming",
            "driving",
            "R Programming",
            "move stuff",
            "hygeine",
            "sleep",
            "R Programming",
            "gmail",
            "R Programming",
            "dishes",
            "hygeine")
## successful

## objective: label and create vector for the schedule.R *amount of time* column
range<-difftime(end,start)
## successful

## objective: label and create vector for the schedule.R *end time* column
end<-c("2014-10-08 13:49:59 CDT",
       "2014-10-08 11:52:54 CDT",
       "2014-10-08 11:30:00 CDT",
       "2014-10-08 10:53:46 CDT",
       "2014-10-08 09:47:45 CDT",
       "2014-10-08 09:19:36 CDT",
       "2014-10-08 07:45:43 CDT",
       "2014-10-08 07:34:04 CDT",
       "2014-10-08 06:59:22 CDT",
       "2014-10-08 00:20:52 CDT",
       "2014-10-07 23:37:18 CDT",
       "2014-10-07 22:46:25 CDT",
       "2014-10-07 22:02:00 CDT",
       "2014-10-07 21:50:00 CDT"
  )
## successful

## objective: label and create vector for the schedule.R *start time* column
start<-c("2014-10-08 11:52:54 CDT",
         "2014-10-08 11:30:00 CDT",
         "2014-10-08 10:53:46 CDT",
         "2014-10-08 09:47:45 CDT",
         "2014-10-08 09:19:36 CDT",
         "2014-10-08 07:45:43 CDT",
         "2014-10-08 07:34:04 CDT",
         "2014-10-08 06:59:22 CDT",
         "2014-10-08 00:20:52 CDT",
         "2014-10-07 23:37:18 CDT",
         "2014-10-07 22:46:25 CDT",
         "2014-10-07 22:02:00 CDT",
         "2014-10-07 21:50:00 CDT",
         "2014-10-07 21:38:00 CDT"
         )
## successful

## objective: efficiently construct and label vectors for schedule.R
description<-c("R programming", "getting out the door")
start<-c("2014-10-08 07:34:04 CDT","2014-10-08 06:59:22 CDT")
end<-c("2014-10-08 09:15:49 CDT","2014-10-08 07:34:04 CDT")
range<- c(
  as.integer(
    difftime("2014-10-08 09:00:00 CDT","2014-10-08 07:34:04 CDT", units = 'mins'
    )
  ),
  as.integer(
    difftime("2014-10-08 07:34:04 CDT","2014-10-08 06:59:22 CDT", units = 'mins'
    )
  )
)
## innefficient

c(Date="2014-10-08",time_start="07:45:43",Time_end="08:15:16",Description="R Programming")
#   returns 1x4 character

c(Date="2014-10-08",time_start="07:45:43",Time_end="08:15:16",Description=c("schedule.R", "Sys_time.R", "strptime.R", "class.R"))
#   returns 1x6 character: additional columns for concatenation in description

## Oct 7 - what is a good way to represent chessboard pgn?
rows<-c("1","2","3","4","5","6","7","8")
columns<-c("a","b","c","d","e","f","g","h")

pieces<-c("King","Queen","Rook","Bishop","Knight","Pawn")
pcs<-c("K","Q","R","B","N","P")
## see vector.R and concatenate.R

## what is a good way to represent chessboard pgn?
rows<-c("1","2","3","4","5","6","7","8")
columns<-c("a","b","c","d","e","f","g","h")
pieces<-c("King","Queen","Rook","Bishop","Knight","Pawn")
pcs<-c("K","Q","R","B","N","P")
## see vector.R and PGN_97721646

statnum_matrix <- c("as.matrix(orderedsplit$","n", ")")
  ##orderedsplit <- split (testsorter$Hospital.Name, testsorter$State)
    ##alphebatized this time, not in care_outcome order
  ##testsorter<-dataframetest[order(dataframetest[,47]),]
  ##dataframetest<-data.frame(care_outcome,rankcoltouse)
  ##rankcoltouse<-rank(coltouse,na.last=TRUE,ties.method=c("first"))
    ##see coltouse in control.R
    ##see care_outcome in data_input.R
##returns "as.matrix(orderedsplit$" "n" ")"

see ?c