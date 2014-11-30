rankhospital <- function(state, outcome, num = "best"){
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
  ##return hospital name in that state with the given rank
  workframe<-subset(
    data.frame(
      Hospital.Name,
      State,
      m),
    !is.na(m) &
      State==state)
  sortframe<-workframe[
    with(
      workframe,
      order(
        workframe$m,
        workframe$Hospital.Name)
      ),
    ]
  if(class(num)=="character"){
    if(num=="best"){
      return(as.vector(sortframe[1,1]))
    }
    if(num=="worst"){
      return(as.vector(sortframe[nrow(workframe),1]))
    }
  }
  if(class(num)=="numeric"){
    return(as.vector(sortframe[num,1]))
  }
}