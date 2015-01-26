finddoc<-function(keyword){
  if(tolower(keyword) %in% c('clock','timeclock','chessclock','punch','timepunch','clock.csv')){
    return(list(filepath="C:/Users/Josh/Documents/CSV Personal/clock.csv",
                docname="clock"))
  }
  if(tolower(keyword) %in% c('article','articles','articles.csv','news')){
    return(list(filepath="C:/Users/Josh/Documents/CSV/Articles.csv",
                docname="articles"))
  }
  if(tolower(Variable) %in% c('article quotes','article quote','artiquote','artiquotes')){
    return(list(filepath="C:/Users/Josh/Documents/CSV Personal/artiquote.csv",
                docname="artiquote"))
  }
  if(tolower(Variable) %in% c('raw notes','notes.csv','notes','note')){
    return(list("C:/Users/Josh/Documents/CSV Personal/notes.csv",
                docname="notes"))
  }
  if(tolower(Variable) %in% c('sorted notes','note2','notes2','notes2.csv')){
    return(list("C:/Users/Josh/Documents/CSV Personal/notes2.csv",
                docname="notes2"))
  }
  if(tolower(Variable) %in% c('coursera','coursera.csv','coursera.note','coursera notes','coursera note')){
    return("C:/Users/Josh/Documents/CSV Personal/coursera.csv")
  }
}
