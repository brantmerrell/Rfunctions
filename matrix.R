

as.matrix(b,a)
as.matrix(a,b)
##b<-as.matrix(split(care_outcome[,11], care_outcome$State))[1]
##a<-as.matrix(split(care_outcome$Hospital.Name, care_outcome$State))[1]
##both return a 1x1 "Character,17"

as.matrix(split(care_outcome[,11], care_outcome$State))[1]
##returns H.A. mortality rates of 5 Alaskan hospitals, +12NA

as.matrix(split(care_outcome$Hospital.Name, care_outcome$State))[1]
##returns a list of 17 alaskan hospitals

as.matrix(split(care_outcome[,11], care_outcome$State))
##returns a 54x2 matrix, listing states and tabulating hospitals per state

as.matrix(split(care_outcome$Hospital.Name, care_outcome$State))
##returns a 54x2 matrix, states in column 1, hospitals per state in column 2

matrix(data = NA, nrow = 1, ncol = 1, byrow = FALSE,
       dimnames = NULL)