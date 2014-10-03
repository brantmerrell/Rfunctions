

##best.R Assign outcomename to file column
ifelse(toupper(outcomename)=="HEART ATTACK",
       coltouse <- care_outcome[,11],
       ifelse(toupper(outcomename)=="HEART FAILURE",
              coltouse <- care_outcome[,17]
              ifelse(toupper(outcomename)=="PNEUMONIA",
                     coltouse <- care_outcome[,23],
                     stop("invalid outcome"))))
  ##Returns error: cannot find outcomename
  ##Evolution of best.R if & else statements referred to "Control" doc

##best.R Assign outcomename to file column &
## Check that the column name passed in is actually in outcome file
if (toupper(outcomename)=="HEART ATTACK")
  coltouse <- care_outcome[,11]
else if (toupper(outcomename)=="HEART FAILURE")
  coltouse <- care_outcome[,17]
else if (toupper(outcomename)=="PNEUMONIA")
  coltouse <- care_outcome[,23]
else stop ("invalid outcome")


ifelse(test, yes, no)