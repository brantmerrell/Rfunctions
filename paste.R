

paste (statnum_matrix, sep = "", collapse = " ")
## returns "as.matrix(orderedsplit$ n )"
## n<-AL does not change return

paste (statnum_matrix, sep = NULL, collapse = " ")
##returns error: invalid separator

paste0 (statnum_matrix, sep = NULL, collapse = " ")
##returns "as.matrix(orderedsplit$ n )"

paste0 (statnum_matrix, collapse = " ")
## returns "as.matrix(orderedsplit$ n )"

paste (statnum_matrix, sep = " ", collapse = " ")
  ##statnum_matrix <- c("as.matrix(orderedsplit$","n", ")")
  ##orderedsplit <- split (testsorter$Hospital.Name, testsorter$State)
    ##alphebatized this time, not in care_outcome order
  ##testsorter<-dataframetest[order(dataframetest[,47]),]
  ##dataframetest<-data.frame(care_outcome,rankcoltouse)
  ##rankcoltouse<-rank(coltouse,na.last=TRUE,ties.method=c("first"))
    ##see coltouse in control.R
    ##see care_outcome in data_input.R
##returns "as.matrix(orderedsplit$ n )"