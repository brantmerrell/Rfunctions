chartr("TX","texas", care_outcome[,7])
##changes TX to te.

chartr("TX","tx", care_outcome[,7])
##changes TX to tx.

chartr("Arkansas", "AR", care_outcome)
##Error: 'old' is longer than 'new'.

##best.R nullify case sensitivity of argument
toupper(outcomename)=="HEART ATTACK"
  


chartr(old, new, x)
tolower(x)
toupper(x)
casefold(x, upper = FALSE)

