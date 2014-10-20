#@


#@"2014-10-15 22:15:09 CDT"
for (n in id) {
  rslt <-  nob(directory, n)
  print(nob (directory, n))
}

#@"2014-10-15 21:52:12 CDT"
for (n in id) {
  tempsubset<-subset(
    read.csv(getElement(list.files(), n)), 
    !is.na(read.csv(getElement(list.files(), n))$sulfate) & 
      !is.na(read.csv(getElement(list.files(), n))$nitrate))
  rbind(nobs, tempsubset)
}

#@"2014-10-15 21:18:20 CDT"
for (n in id) {
  nobs<-nrow(subset(
    read.csv(getElement(list.files(), n)), 
    !is.na(read.csv(getElement(list.files(), n))$sulfate) & 
      !is.na(read.csv(getElement(list.files(), n))$nitrate)))
}
id<-c(1,2)

w<-while(care_outcome[,11]==(levels(data.frame(a,b)[,2])[2])){
  print (care_outcome[,11])
}
##returns nothing - only the first element used

while(length(sixstates)<6) {print(sixstates); print(5)}
##returns nothing

##sixstates<-c("AL","TX","VA","OK","UT","CA")
##sixstates[2] returns "TX]
##sixstates[n]
while (class("sixstates")=="character"){print (sixstates[3])}
##keeps printing "VA" until manually stopped.
repeat {if }

while (x < 10) { x<- x+4; print (x);}
##input x<-0 returns 4, 8, 12.
##input x<-1 returns 5, 9, 12.

while("AL"<-3) {"TX"<-"Texas"}
##console does not execute until stopped

while("TX"=="TX") "AL" <- "3"
##console does not execute until stopped

while("AL"=="TX") "AL" <- "3"
##console does not execute until stopped


for (AL in sequence){} 
##sequence<-c("TX","AL")
## AL returns "AL"
## TX returns "AL"

for (TX in sequence) return 3
## error: unexpected numeric constant

for (TX in sequence) "what does the expr here do?"
##sequence<-c("TX","AL")
##valid, but returns nothing because for returns NULL "invisibly"
##input TX now returns "AL"

if (class(x)=="numeric") {1:3} else {4:6}
##x<-1 returns 1 2 3, x<-"test" returns 4 5 6

if (class(x)=="numeric") [1:3] else [4:6]
##returns error: unexpected '['

##x<-3 y<-"State"
if (class(x)=="numeric") x else y
## class(x) returns 3, class(y) returns "State"

##rankall.R
  ## Check if the outcomename is a heart attack, 
  ## with no cap sensitivity
  if (toupper(outcomename)=="HEART ATTACK")
  
  ##if above test is true, direct variable to column eleven.
  coltouse <- care_outcome[,11]

  ## If not a heart attack, check whether the outcomename is Heart Failure,
  ## with no cap sensitivity.
  else if (toupper(outcomename)=="HEART FAILURE")
  
  ##if above test is true, direct variable to column seventeen.
  coltouse <- care_outcome[,17]

  ## if previous ifs are not true, check whether outcomename is Pneumonia,
  ## with no cap sensitivity.
  else if (toupper(outcomename)=="PNEUMONIA")
  
  ##if Pneumonia, direct variable to column 23
  coltouse <- care_outcome[,23]

  ## if none of the above, stop function and send "invalid outcome" message.
  else stop ("invalid outcome")


##best.R,rankhospital.R Assign outcomename to file column &
  ## Check if the outcomename is a heart attack, 
  ## with no cap sensitivity
  if (toupper(outcomename)=="HEART ATTACK")
  
  ##if above test is true, direct variable to column eleven.
  coltouse <- care_outcome[,11]

  ## If not a heart attack, check whether the outcomename is Heart Failure,
  ## with no cap sensitivity.
  else if (toupper(outcomename)=="HEART FAILURE")
  
  ##if above test is true, direct variable to column seventeen.
  coltouse <- care_outcome[,17]

  ## if previous ifs are not true, check whether outcomename is Pneumonia,
  ## with no cap sensitivity.
  else if (toupper(outcomename)=="PNEUMONIA")
  
  ##if Pneumonia, direct variable to column 23
  coltouse <- care_outcome[,23]

  ## if none of the above, stop function and send "invalid outcome" message.
  else stop ("invalid outcome")

if(cond) expr
if(cond) cons.expr  else  alt.expr

for(var in seq) expr
while(cond) expr
repeat expr
break
next
