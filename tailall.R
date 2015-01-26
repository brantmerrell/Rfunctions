tailall<-function(clock=1,articles=2,artiquote=1,notes=2,notes2=2,coursera=2){
  list(
    'clock'=tail(
      as.matrix(read.csv("C:/Users/Josh/Documents/CSV Personal/clock.csv")),
      clock),
    'articles'=tail(
      as.matrix(read.csv("C:/Users/Josh/Documents/CSV/Articles.csv")),
      articles),
    'Article Quotes'=tail(
      as.matrix(read.csv("C:/Users/Josh/Documents/CSV Personal/artiquote.csv")),
      artiquote),
    'raw notes'=tail(
      as.matrix(read.csv("C:/Users/Josh/Documents/CSV Personal/notes.csv")),
      notes),
    'sorted notes'=tail(
      as.matrix(read.csv("C:/Users/Josh/Documents/CSV Personal/notes2.csv")),
      notes2),
    'coursera notes'=tail(
      as.matrix(read.csv("C:/Users/Josh/Documents/CSV Personal/coursera.csv")),
      coursera))
}