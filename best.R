best<-function(state, outcome){
  
  ## Read outcome data
  setwd("C:/Users/Josh/Documents/Coursera/Medicalrank")
  data.outcome <- data.frame(read.csv("outcome-of-care-measures.csv", colClass="character")[,c(2,7,11,17,23)])
  names(data.outcome)<-c("Hospital.Name", "State", "Heart.Attack", "Heart.Failure", "Pneumonia")
  
  ## Check that state and outcome are valid
  if(!(state %in% unique(data.outcome$State))){
    stop("invalid state")
  }
  if(!(tolower(outcome) %in% 
        c("heart attack", "heart failure", "pneumonia")
      )){
    stop("invalid outcome")
  }
  
  ## Return hospital name in that state with lowest 30-day mortality rate
  ST<-subset(data.outcome, data.outcome$State==state)
  if(tolower(outcome)=="heart attack"){
    workfactor<-as.matrix(as.numeric(as.character(ST$Heart.Attack)))
  }
  if(tolower(outcome)=="heart failure"){
    workfactor<-as.matrix(as.numeric(as.character(ST$Heart.Failure)))
  }
  if(tolower(outcome)=="pneumonia"){
    workfactor<-as.matrix(as.numeric(as.character(ST$Pneumonia)))
  }
  workframe<-data.frame(Hospital.Name=as.matrix(ST$Hospital.Name),
                        State=as.matrix(ST$State),
                        workfactor=workfactor
  )
  return(subset(workframe$Hospital.Name, workframe$workfactor==min(workfactor,na.rm=TRUE)))
}
