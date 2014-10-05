

as.vector(coltouse)
##see coltouse in control.R
##see care_outcome in data_input.R
##returns 4706 columns of coltouse


statevector<-unique(care_outcome[,7])
##returns all abbreviations for states in order of their care_outcome listing

statenumber<-c(1:54)
##returns numbers 1-54 to correspond with states