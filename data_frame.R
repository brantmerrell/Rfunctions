dd[with(dd, order(-z, b)), ]
##see   http://stackoverflow.com/questions/
##      1296646/how-to-sort-a-dataframe-by-columns-in-r
#returns 

dd<-data.frame(b = factor(c("Hi", "Med", "Hi", "Low"), 
                      levels = c("Low", "Med", "Hi"), ordered = TRUE),
           x = c("A", "D", "A", "C"), y = c(8, 3, 9, 9),
           z = c(1, 1, 1, 2))
##see   http://stackoverflow.com/questions/
##      1296646/how-to-sort-a-dataframe-by-columns-in-r

data.frame(
  State=(care_outcome[,2],),
           Hospital.Name=care_outcome[,7],
           Outcome=coltouse),

##see coltouse in control.R
##see care_outcome in data_input.R


data.frame(State=care_outcome[,2],
           Hospital.Name=care_outcome[,7],
           Outcome=coltouse),
levels=(statevector,ordered=true)
##see coltouse in control.R
##see care_outcome in data_input.R
##Error: unexpected ',' 

trimmed_outcome<-data.frame(State=care_outcome[,2],Hospital.Name=care_outcome[,7],Outcome=coltouse),levels=(statevector,ordered=true)
##see coltouse in control.R
##see care_outcome in data_input.R
##returns 4706x3 with columns named State, Hospital.Name, and coltouse

data.frame(care_outcome[,2], care_outcome[,7],coltouse,rankcoltouse)
##rankcoltouse<-rank(coltouse,na.last=TRUE,ties.method=c("first"))
##see coltouse in control.R
##see care_outcome in data_input.R

trimmed_outcome<-data.frame(care_outcome[,2], care_outcome[,7],coltouse)
##returns 4706x3 of H.Name, State, coltouse
##see care_outcome in data_input.R
##see coltouse in control.R

trimmed_outcome<-data.frame(care_outcome[,2], care_outcome[,7], care_outcome[,11],care_outcome[,17],care_outcome[,23])
##head(trimmed_outcome) returns 6x5 of H.Name, State, and (H.A. + H.F. + P.) mortality
##see care_outcome in data_input.R

data.frame(care_outcome[,2 & 7])
##returns all columns of care_outcome
##see care_outcome in data_input.R

data.frame(care_outcome[2,7])
##returns "AL"
##see care_outcome in data_input.R

data.frame(care_outcome[,2,7])
##returns 4706x1 of Hospital Names ([,2])
##see care_outcome in data_input.R

data.frame(care_outcome[,2,7,11,17,23])
##returns error for "unused arguments (11,17,23)"
##see care_outcome in data_input.R

dataframetest<-data.frame(care_outcome,rankcoltouse)
##rankcoltouse<-rank(coltouse,na.last=TRUE,ties.method=c("first"))
  ##see coltouse in control.R
  ##see care_outcome in data_input.R
##head() returns six rows, 47 columns of unranked hospital data

data.frame(b,a)
##b<-as.matrix(split(care_outcome[,11], care_outcome$State))[1]
##a<-as.matrix(split(care_outcome$Hospital.Name, care_outcome$State))[1]
##returns a 17x2 list of mortality rates and their Alaskan hospitals

data.frame(a,b)
##b<-as.matrix(split(care_outcome[,11], care_outcome$State))[1]
##a<-as.matrix(split(care_outcome$Hospital.Name, care_outcome$State))[1]
##returns a 17x2 list of Alaskan hospitals and their mortality rates

data.frame(split(care_outcome$Hospital.Name, care_outcome$State),
           split(care_outcome[,11], care_outcome$State))
##error: arguments imply differing number of rows

dataframestate<-data.frame(care_outcome[,7],rankcoltouse)
##rankcoltouse<-care_outcome[,11]
##head() returns 6X2 State and rankcoltouse

numeric13_14<-data.frame(numeric13,numeric14)
##numeric13<-care_outcome[,13]
##numeric14<-care_outcome[,14]
##returns two columns, mostly of NA.

## rankall.R combine splitcoltouse with 

## rankhospital.R combine ranked column with data frame
dataframetest<-data.frame(care_outcomesubset,rankcoltouse)




data.frame(..., row.names = NULL, check.rows = FALSE,
           check.names = TRUE,
           stringsAsFactors = default.stringsAsFactors())

default.stringsAsFactors()

##rankall.R: assign task to "numbest"
dataframetest<-data.frame(care_outcome,rankcoltouse)

