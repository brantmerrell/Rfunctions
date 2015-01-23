tailall<-function(clock=1,articles=2,artiquote=1,notes=2,notes2=2,coursera=2){
  print(tail(as.matrix(read.csv("C:/Users/Josh/Documents/CSV Personal/clock.csv")),clock))
  print(tail(as.matrix(read.csv("C:/Users/Josh/Documents/CSV/Articles.csv")),articles))
  print(tail(as.matrix(read.csv("C:/Users/Josh/Documents/CSV Personal/artiquote.csv")),artiquote))
  print(tail(as.matrix(read.csv("C:/Users/Josh/Documents/CSV Personal/notes.csv")),notes))
  print(tail(as.matrix(read.csv("C:/Users/Josh/Documents/CSV Personal/notes2.csv")),notes2))
  print(tail(as.matrix(read.csv("C:/Users/Josh/Documents/CSV Personal/coursera.csv")),coursera))
}