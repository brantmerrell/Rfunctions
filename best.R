best<-function(state, outcome){
  setwd("C:/Users/Josh/Documents/Coursera/Medicalrank")
  ##read outcome data
  metric<-outcome
  outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  setwd("C:/Users/Josh/Documents/Functions")
  Hospital.Name<-as.matrix(outcome$Hospital.Name)
  State<-as.matrix(outcome$State)
  if(tolower(metric)=="heart attack"){
    m<-as.matrix(as.numeric(outcome[,11]))
  }
  if(tolower(metric)=="heart failure"){
    m<-as.matrix(as.numeric(outcome[,17]))
  }
  if(tolower(metric)=="pneumonia"){
    m<-as.matrix(as.numeric(outcome[,23]))
  }
  ##check that state and outcome are valid
  if(!(tolower(metric) %in% c("heart attack","heart failure","pneumonia"))){
    stop("invalid outcome")
  }
  if(!(toupper(state) %in% State)){
    stop("invalid state")
  }
  ## Return hospital name in that state with lowest 30-day mortality rate
  workframe<-data.frame(Hospital.Name,State,m)
  ST<-subset(workframe, workframe$State==state & !is.na(m))
  sortframe<-as.vector(ST[
    with(ST,
         order(
           ST$m,
           ST$Hospital.Name)
         ),1])
  sortframe[1]
}

