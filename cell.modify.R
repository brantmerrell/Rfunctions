cell.modify<-function(Var, row, col, mod){
  recpath<-"C:/Users/Josh/Documents/CSV Personal/records_modify_cell.csv"
  filepath<-finddoc(Var)$filepath
  Var<-finddoc(Var)$docname
  X<-read.csv(filepath, colClasses="character")
  before<-X[row,col]
  X[row,col]<-mod
  write.csv(X, filepath, row.names=FALSE)
  records_modify_cell<-read.csv(recpath, colClasses='character')
  new_modify_cell<-data.frame(Var=Var,
                              row=row,
                              col=col,
                              before=before,
                              after=mod,
                              time=paste(Sys.time()))
  records_modify_cell<-rbind(records_modify_cell, new_modify_cell)
  write.csv(records_modify_cell, recpath, row.names=FALSE)
  list(changed=read.csv(filepath)[c((row-1):(row+1)),],
       recorded=tail(read.csv(recpath),3))
}