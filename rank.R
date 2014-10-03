##rankall.R Create rank to which all inputs can be referred

rankcoltouse<-rank(coltouse,na.last=TRUE,ties.method=c("first"))
##coltouse<-care_outcome[,11]


##rankhospital.R Return hospital list in that state based on lowest 30-day mortality rate  
rankcoltouse<-rank(coltouse,na.last=TRUE,ties.method=c("first"))


rank(x, na.last = TRUE,
     ties.method = c("average", "first", "random", "max", "min"))
