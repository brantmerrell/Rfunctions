rm.paper<-function(paper,comment,time=Sys.time()){
  X<-as.matrix(read.csv("C:/Users/Josh/Documents/CSV Personal/rmpaper.csv"))
  Y<-as.matrix(data.frame(paper,comment,time))
  Z<-rbind(X,Y)
  write.csv(Z,"C:/Users/Josh/Documents/CSV Personal/rmpaper.csv",row.names=FALSE)
  print(tail(read.csv("C:/Users/Josh/Documents/CSV Personal/rmpaper.csv"),3))
}

add.object<-function(object,location,comment="",time=Sys.time()){
  X<-as.matrix(read.csv("C:/Users/Josh/Documents/CSV Personal/paper.csv"))
  Y<-as.matrix(data.frame(object,location,time,comment))
  Z<-rbind(X,Y)
  write.csv(Z,"C:/Users/Josh/Documents/CSV Personal/paper.csv",row.names=FALSE)
  print(tail(read.csv("C:/Users/Josh/Documents/CSV Personal/paper.csv"),3))
}

add.note<-function(note){
  X<-as.matrix(read.csv("C:/Users/Josh/Documents/CSV Personal/notes.csv",colClasses="character"))
  Y<-as.matrix(data.frame(note,Sys.time()))
  Z<-rbind(X,Y)
  write.csv(Z,"C:/Users/Josh/Documents/CSV Personal/notes.csv",row.names=FALSE)
  print(tail(read.csv("C:/Users/Josh/Documents/CSV Personal/notes.csv"),3))
}

clock<-function(punch,comment=""){
  X<-as.matrix(read.csv("C:/Users/Josh/Documents/CSV Personal/clock.csv",colClasses="character"))
  Y<-as.matrix(data.frame(punch,Sys.time(),comment))
  Z<-rbind(X,Y)
  write.csv(Z,"C:/Users/Josh/Documents/CSV Personal/clock.csv",row.names=FALSE)
  print(tail(read.csv("C:/Users/Josh/Documents/CSV Personal/clock.csv"),3))
}

variables.csv<-function(folder){
  list.files<-function(n){
    replicate(ncol(read.csv(Sys.glob("*csv")[n])),Sys.glob("*csv")[n])
  }
  varnames<-function(n){
    colnames(read.csv(Sys.glob("*csv")[n]))
  }
  data.frame(file=as.matrix(unlist(lapply(1:length(Sys.glob("*csv")),list.files))),
             variable=as.matrix(unlist(lapply(1:length(Sys.glob("*csv")),varnames))))
}

colnames(read.csv(list.files()[n],row.names = NULL))

variables<-as.vector(read.csv("C:/Users/Josh/Documents/CSV/variables.csv")[,1])
quarterpath<-"C:/Users/Josh/Documents/All_Reports/All_Reports_19921231"
var.deficit<-function(variables,quarterpath){
  folder.variables<-function(quarterpath){
    varnames<-function(n){
      as.matrix(colnames(read.csv(list.files(quarterpath)[n],row.names=NULL)))
    }
    return(sort(unique(unlist(lapply(1:length(list.files()),varnames)))))
  }
  qvariables<-folder.variables(quarterpath)
  return(c(deficit.variables=subset(variables,!(variables %in% qvariables))))
}

directories<-c("C:/Users/Josh/Documents/All_Reports_20140630",
               "C:/Users/Josh/Documents/All_Reports/All_Reports_19921231")
var.masterlist<-function(directories){
  folder.variables<-function(quarterpath){
    varnames<-function(n){
      as.matrix(colnames(read.csv(list.files(quarterpath)[n],row.names = NULL)))
    }
    return(sort(unique(unlist(lapply(1:length(list.files()),varnames)))))
  }
  return(unique(unlist(lapply(directories,folder.variables))))
}
variables<-var.masterlist(directories)
write.csv(variables,"variables.csv",row.names=FALSE)

quarterpath1<-"C:/Users/Josh/Documents/All_Reports_20140930"
quarterpath2<-"C:/Users/Josh/Documents/All_Reports_20140630"
var.added<-function(quarterpath1,quarterpath2){
  folder.variables<-function(quarterpath){
    varnames<-function(n){
      as.matrix(colnames(read.csv(list.files(quarterpath)[n],row.names = NULL)))
    }
    return(sort(unique(unlist(lapply(1:length(list.files()),varnames)))))
  }
  quarter1<-folder.variables(quarterpath1)
  quarter2<-folder.variables(quarterpath2)
  return(subset(quarter2,!(quarter2[1:2] %in% quarter1)))
}
var.subtracted<-function(quarterpath1,quarterpath2){
  resetwd<-getwd()
  folder.variables<-function(quarterpath){
    setwd(quarterpath)
    colnames<-function(n){
      as.matrix(colnames(read.csv(list.files()[],row.names = NULL)))
    }
    return(sort(unique(unlist(lapply(1:length(list.files()),colnames)))))
  }
  quarter1<-folder.variables(quarterpath1)
  quarter2<-folder.variables(quarterpath2)
  return(subset(quarter1,!(quarter1 %in% quarter2)))
}

folder.cert<-function(quarterpath){
  resetwd<-getwd()
  setwd(quarterpath)
  file.cert<-function(n){
    return(unique(read.csv(list.files()[n],row.names=NULL)$cert))
  }
  return(unique(unlist(lapply(1:length(list.files()),file.cert))))
  setwd(resetwd)
}

file.cert<-function(filepath){
  return(unique(read.csv(filepath)$cert))
}

folder.variables<-function(quarterpath){
  resetwd<-getwd()
  setwd(quarterpath)
  varnames<-function(n){
    as.matrix(colnames(read.csv(list.files()[n],row.names = NULL)))
  }
  return(sort(unique(unlist(lapply(1:length(list.files()),varnames)))))
  setwd(resetwd)
}

add.paper<-function(Aut,Yr,Ttl,Jrnl,Vol,Num,Pgs){
  resetwd<-getwd()
  setwd("C:/users/Josh/Documents/CSV")
  X<-read.csv("Papers.csv",colClasses="character")
  Y<-rbind(X,c(Aut,Yr,Ttl,Jrnl,Vol,Num,Pgs))
  write.csv(Y,"Papers.csv",row.names=FALSE)
  print(tail(read.csv("Papers.csv"),3))
  setwd(resetwd)
}

add.text<-function(From,To,Time,Text){
  X<-read.csv("C:/users/Josh/Documents/CSV Personal/Texts.csv",colClasses="character")
  Y<-rbind(X,c(From,To,Time,Text))
  write.csv(Y,"C:/users/Josh/Documents/CSV Personal/Texts.csv",row.names=FALSE)
  print(tail(read.csv("C:/users/Josh/Documents/CSV Personal/Texts.csv"),3))
}

add.phrase<-function(author,phrase){
  resetwd<-getwd()
  setwd("C:/Users/Josh/Documents/CSV Personal")
  X<-read.csv("phrasebox.csv",colClasses="character")
  Z<-rbind(X,c(author,phrase))
  write.csv(Z,"phrasebox.csv",row.names=FALSE)
  print(tail(read.csv("phrasebox.csv"),3))
  setwd(resetwd)
}

add.bill<-function(Corp,
                   Prdt,
                   Chrg,
                   Pmnt,
                   Per.,
                   Due,
                   P.Dt,
                   Cnfm){
  resetwd<-getwd()
  setwd("C:/Users/Josh/Documents/CSV Personal")
  X<-read.csv("liv_exp.csv",colClasses="character")
  Z<-rbind(X,c(Corp,Prdt,Chrg,Pmnt,Per.,Due,P.Dt,Cnfm))
  write.csv(Z,"liv_exp.csv",row.names=FALSE)
  print(tail(read.csv("liv_exp.csv"),3))
  setwd(resetwd)
}

add.link<-function(link){
  resetwd<-getwd()
  setwd("C:/Users/Josh/Documents/CSV")
  X<-read.csv("listoflinks.txt")
  Y<-rbind(as.matrix(X[,2]),c("https://www.youtube.com/watch?v=D25l1SWOF9M&app=desktop"))
  write.csv(Y,"listoflinks.csv",row.names=FALSE)
  print(tail(read.csv("listoflinks.csv"),3))
}

add.article<-function(Author,
                      Title,
                      Organization,
                      Site,
                      Date,
                      From){
  resetwd<-getwd()
  setwd("C:/Users/Josh/Documents/CSV")
  X<-read.csv("Articles.csv")
  Y<-data.frame(Author=as.matrix(append(as.vector(X$Author),Author)),
                Title=as.matrix(append(as.vector(X$Title),Title)),
                Organization=as.matrix(append(as.vector(X$Organization),Organization)),
                Site=as.matrix(append(as.vector(X$Site),Site)),
                Date=as.matrix(append(as.vector(X$Date),Date)),
                From=as.matrix(append(as.vector(X$From),From)))
  write.csv(Y,"Articles.csv", row.names=FALSE)
  print(tail(read.csv("Articles.csv"),3))
  setwd(resetwd)
}

getline<-function(m,n){
  setwd("C:/Users/Josh/Documents/CSV")
  readLines(getElement(list.files(),m))[n]
}

readcsv<-function(n){
  setwd("C:/Users/Josh/Documents/CSV")
  if(class(n)=="numeric"){
    read.csv(getElement(list.files(),n))
  }
  else{
    read.csv(n)
  }
}
m<-2
n<-1

pollutantmean<-function(directory, pollutant, id=1:332){
  setwd("C:/Users/Josh/Documents/CSV")
  setwd(directory)
  count.nitrate<-function(n){
    length(subset(read.csv(getElement(Sys.glob("*csv"),n))$nitrate,
                  !is.na(read.csv(getElement(Sys.glob("*csv"),n))$nitrate)))
  }
  count.sulfate<-function(n){
    length(subset(read.csv(getElement(Sys.glob("*csv"),n))$sulfate,
                  !is.na(read.csv(getElement(Sys.glob("*csv"),n))$sulfate)))
  }
  sum.nitrate<-function(n){
    sum(read.csv(getElement(Sys.glob("*csv"),n))$nitrate,na.rm=TRUE)
  }
  sum.sulfate<-function(n){
    sum(read.csv(getElement(Sys.glob("*csv"),n))$sulfate,na.rm=TRUE)
  }
  extraction<-data.frame(count_N=as.matrix(lapply(id, count.nitrate)),
                         count_S=as.matrix(lapply(id, count.sulfate)),
                         sum_N=as.matrix(lapply(id, sum.nitrate)),
                         sum_S=as.matrix(lapply(id, sum.sulfate)))
  mean.nitrate<-(sum(as.numeric(extraction$sum_N))/
                   sum(as.numeric(extraction$count_N)))
  mean.sulfate<-(sum(as.numeric(extraction$sum_S))/
                   sum(as.numeric(extraction$count_S)))
  if (toupper(pollutant)=="NITRATE"){
    return(mean.nitrate)
  }
  if (toupper(pollutant)=="SULFATE"){
    return(mean.sulfate)
  }
}

sum.sulfate<-function(id){
  sum(read.csv(getElement(Sys.glob("*csv"),id))$sulfate, na.rm=TRUE)
}

sum.nitrate<-function(id){
  sum(read.csv(getElement(Sys.glob("*csv"),id))$nitrate, na.rm=TRUE)
}

count.sulfate<-function(id){
  sulfate<-read.csv(getElement(Sys.glob("*csv"),id))$sulfate
  length(subset(sulfate,
                !is.na(sulfate)))
}

count.nitrate<-function(id){
  nitrate<-read.csv(getElement(Sys.glob("*csv"),id))$nitrate
  length(subset(nitrate,
         !is.na(nitrate)))
}

read.pollutant<-function(n){
  if (pollutant=="sulfate"){
    selection<-subset(read.csv(getElement(Sys.glob("*csv"),n))$sulfate,
                      !is.na(read.csv(getElement(Sys.glob("*csv"),n))$sulfate))
  }
  if (pollutant=="nitrate"){
    selection<-subset(read.csv(getElement(Sys.glob("*csv"),n))$nitrate,
                      !is.na(read.csv(getElement(Sys.glob("*csv"),n))))
  }
  return(selection)
}


list.pollutant<-function(n){
  if (pollutant=="sulfate"){
    selection<-as.numeric(
      as.character(
        read.csv(
          getElement(Sys.glob("*csv"),n))$sulfate)
    subset.pollutant<-subset(selection, !is.na(selection))
  }
}

read.pollutants<-function(id){
  lapply(id, read.pollutant)
}

read.pollutant<-function(n){
  if (pollutant=="sulfate"){
    selection<-read.csv(getElement(Sys.glob("*csv"),n))$sulfate
  }
  if (pollutant=="nitrate"){
    selection<-read.csv(getElement(Sys.glob("*csv"),n))$nitrate
  }
  print(selection)
}

countfrom<-function(n){sum(From==unique(From)[n])}

stateset<-function(State){subset(medgrid,medgrid[,2]==State)}#"2014-10-27 16:53:22 CDT"

medvariables<-function(n){getElement(colnames(read.csv("outcome-of-care-measures.csv")), n)}

alllinks<-function(){
  resetwd<-getwd()
  setwd("C:/Users/Josh/Documents/CSV")
  Author<-as.matrix(read.csv("articles.csv")$Author)
  Date<-as.matrix(read.csv("articles.csv")$Date)
  Organization<-as.matrix(read.csv("articles.csv")$Organization)
  From<-as.matrix(read.csv("articles.csv")$From)
  articlegrid<-data.frame(Author, Date, Organization, From)
  as.matrix(
    lapply(
      unique(
        articlegrid$From), 
      manylinks)
  )
  print()
  setwd(resetwd)
}

manylinksnum<-function(){getElement(manylinks(1),2)}

manylinks<-function(n){
  setwd("C:/Users/Josh/Documents/CSV")
  Author<-as.matrix(read.csv("articles.txt")$Author)
  Date<-as.matrix(read.csv("articles.txt")$Date)
  Organization<-as.matrix(read.csv("articles.txt")$Organization)
  From<-as.matrix(read.csv("articles.txt")$From)
  articlegrid<-data.frame(Author, Date, Organization, From)
  data.frame(From=unique(From)[n],
             Links=sum(
               articlegrid$From==unique(
                 articlegrid$From)[n]
               )
             )
}

splitandframe<-function(m,n){
  setwd("C:/Users/Josh/Documents/CSV")
  Author<-as.matrix(read.csv("articles.txt")$Author)
  Date<-as.matrix(read.csv("articles.txt")$Date)
  Organization<-as.matrix(read.csv("articles.txt")$Organization)
  From<-as.matrix(read.csv("articles.txt")$From)
  data.frame(Au=subset(Author, m==unique(m)[n]), 
             Org=subset(Organization, m==unique(m)[n]), 
             Dt=subset(Date, m==unique(m)[n]), 
             Frm=subset(From, m==unique(m)[n]))}

splitandframe<-function(column,n){
  data.frame(Author=subset(Author, column==unique(column)[n]), 
             Organization=subset(Organization, column==unique(column)[n]), 
             Date=subset(Date, column==unique(column)[n]), 
             From=subset(From, column==unique(column)[n]))}

effectivesplit<-function(n){
  Author<-as.matrix(read.csv("articles.txt")$Author)
  Date<-as.matrix(read.csv("articles.txt")$Date)
  Organization<-as.matrix(read.csv("articles.txt")$Organization)
  From<-as.matrix(read.csv("articles.txt")$From)
  data.frame(Author=subset(Author, From==unique(From)[n]), 
             Organization=subset(Organization, From==unique(From)[n]), 
             Date=subset(Date, From==unique(From)[n]), 
             From=subset(From, From==unique(From)[n]))}

corr<-function(directory, threshold){
  setwd(directory)
  complete<-function(file){nrow(subset(
    read.csv(file),
    is.na(getElement(read.csv(file), 2)) &
    is.na(getElement(read.csv(file), 3))))}
  complete("001.csv")
  corrsingle<-function(n){
    file<-read.csv(getElement(list.files(), n))
    complete<-subset(
      file, 
      !is.na(getElement(file, 2)) & 
        !is.na(getElement(file,3)))
    cor(complete[,2], complete[,3])
  }
  completes<-as.matrix(lapply(list.files(), complete))
  thresh<-as.matrix(subset(data.frame(list.files(), completes), completes>=threshold))
  lapply(thresh, corrsingle)
}
threshold<-1000
setwd("C:\\Users\\Josh\\Documents\\CSV\\Specdata")
## 'threshold' is a numeric vector of length 1 indicating the
## number of completely observed observations (on all
## variables) required to compute the correlation between
## nitrate and sulfate; the default is 0
threshsubset<-function(directory, threshold){
  setwd(directory)
  complete<-function(file){nrow(subset(
    read.csv(file), 
    !is.na(getElement(read.csv(file), 2)) & 
      !is.na(getElement(read.csv(file), 3))))}
  completes<-as.matrix(lapply(list.files(),complete))
  subset(data.frame(list.files(), completes), completes>=threshold)
}
threshold<-1000
threshsubset("specdata", 400)
# Error in object[[name, exact = TRUE]] : subscript out of bounds 
#@"2014-10-23 23:02:18 CDT"

setwd("C:\\Users\\Josh\\Documents\\CSV")
corrsingle<-function(directory, id){  
  setwd(directory)
  file<-read.csv(getElement(list.files(), id))
  complete<-subset(
    file, 
    !is.na(getElement(file, 2)) & 
      !is.na(getElement(file,3)))
  cor(complete[,2], complete[,3])
}
id<-2
corrsingle("C:\\Users\\Josh\\Documents\\CSV\\specdata", 1) # -0.2225526
corrsingle("specdata", 2) # -0.01895754
corrsingle("specdata", 3) # -0.1405125
#@"2014-10-23 22:20:05 CDT"

testquotes<-function(document){
  setwd("C:\\Users\\Josh\\Documents\\CSV")
  tail(read.csv(document, quote="",row.names=NULL, stringsAsFactors=FALSE))
}
testquotes("quotes.txt")

testcsv<-function(document,n){
  setwd("C:\\Users\\Josh\\Documents\\CSV")
  tail(read.csv(document, row.names=NULL), n)
}
testcsv("subset.txt")
testcsv("subseterrors.txt")
testcsv("articles.txt", 20)
testcsv("coursera tasks.txt", 34)

#@"2014-10-20 12:16:20 CDT"
complete<-function(directory, id){
  setwd("C:\\Users\\Josh\\Documents\\CSV")
  setwd(directory)
  read<-function(id){getElement(list.files(), id)} 
  files<-lapply(id, read)
  nob<-function(id){
    nrow(subset(
      read.csv(getElement(list.files(), id)), 
      !is.na(read.csv(getElement(list.files(), id))$sulfate) & 
        !is.na(read.csv(getElement(list.files(), id))$nitrate)))
  }
  data.frame(id, nobs=as.matrix(lapply(id, nob)))
}

#@"2014-10-19 18:48:15 CDT"
complete<-function(directory, id){
  setwd("C:\\Users\\Josh\\Documents\\CSV")
  setwd(directory)
  read<-function(id){getElement(list.files(), id)}
  files<-lapply(id, read)
  nob<-function(id){
    nrow(subset(
      read.csv(getElement(list.files(), id)), 
      !is.na(read.csv(getElement(list.files(), id))$sulfate) & 
        !is.na(read.csv(getElement(list.files(), id))$nitrate)))
  }
  lapply(files, nob)
}
complete("specdata", 2)
# Err subscript out of bounds

#@"2014-10-19 17:57:50 CDT"
read<-function(id){read.csv(getElement(list.files(), id))}

#@"2014-10-19 17:38:08 CDT"
complete<-function(directory, id){
  setwd("C:\\Users\\Josh\\Documents\\CSV")
  setwd(directory)
  nobs<-function(directory, id){
    nrow(subset(
      read.csv(getElement(list.files(), id)),
      !is.na(read.csv(getElement(list.files(), id))$sulfate) &
         !is.na(read.csv(getElement(list.files(), id))$nitrate))) 
  }
  for (n in id) {
    rslt <-  nob(directory, n)
    print(nob (directory, n))
  }
  data.frame(id, nobs=as.matrix(lapply(id, nobs)))
}
complete("specdata", 1) # [1] 117 WARNING
complete("specdata", 1:2) # Err 
complete("specdata", c(1,2))

#@"2014-10-19 17:12:18 CDT"
complete<-function(directory, id){
  setwd("C:\\Users\\Josh\\Documents\\CSV")
  setwd(directory)
  nobs<-function(directory, id){
    nrow(subset(
      read.csv(getElement(list.files(), id)), 
      !is.na(read.csv(getElement(list.files(), id))$sulfate) & 
        !is.na(read.csv(getElement(list.files(), id))$nitrate)))
  }
  for (n in id) {
    rslt <-  nob(directory, n)
    print(nob (directory, n))
  }
  #  data.frame(id = as.vector(id), nobs = as.vector(nob(directory, id)))
}
complete("specdata", c(1,2))

  cbind(id, nobs)
}
nobs(2)
complete(2)
id<-2

complete<-function(directory, id){
  setwd("C:\\Users\\Josh\\Documents\\CSV")
  setwd(directory)
  nob<-function(directory, id){
    nrow(subset(
      read.csv(getElement(list.files(), id)), 
      !is.na(read.csv(getElement(list.files(), id))$sulfate) & 
        !is.na(read.csv(getElement(list.files(), id))$nitrate)))
  }
  for (n in id) {
    rslt <-  nob(directory, n)
    print(nob (directory, n))
  }
  #  data.frame(id = as.vector(id), nobs = as.vector(nob(directory, id)))
}
complete("specdata", c(1,2))

#@"2014-10-18 23:56:04 CDT"
multiples<-function(id, n){
  data.frame(id,n)
}
multiples(c(1,3,5), c(2,4,6))
## successful

#@"2014-10-18 23:44:52 CDT"
complete<-function(directory, id){
  setwd("C:\\Users\\Josh\\Documents\\CSV")
  setwd(directory)
  nob<-function(directory, id){
    nrow(subset(
      read.csv(getElement(list.files(), id)), 
      !is.na(read.csv(getElement(list.files(), id))$sulfate) & 
        !is.na(read.csv(getElement(list.files(), id))$nitrate)))
  }
  for (n in id) {
    nobs <-  nob(directory, n)
    print(c(id,nobs (directory, n)))
  }
  #  data.frame(id = as.vector(id), nobs = as.vector(nob(directory, id)))
}
complete("specdata", c(1,2))
# Err subscript out of bounds

#@"2014-10-18 23:23:15 CDT"
complete<-function(id){
  nobs<-nrow(subset(read.csv(getElement(list.files(),id)),
              !is.na(read.csv(getElement(list.files(),id))$sulfate) &
                !is.na(read.csv(getElement(list.files(), id))$nitrate)))
  frame<-data.frame(id,nobs)
  for (n in id) {
    rslt <- nrow(subset(read.csv(getElement(list.files(),n)),
                        !is.na(read.csv(getElement(list.files(),n))$sulfate) &
                          !is.na(read.csv(getElement(list.files(),n))$nitrate)))
    frame<-data.frame(n,rslt)
  }
  print(frame)
}
## complete(integer) works, complete(vector) doesn't


#@"2014-10-18 23:15:51 CDT"
complete<-function(directory, id){
  setwd("C:\\Users\\Josh\\Documents\\CSV")
  setwd(directory)
  for (n in id) {
    rslt <- nrow(subset(read.csv(getElement(list.files(),n)),
                        !is.na(read.csv(getElement(list.files(),n))$sulfate) & 
                          !is.na(read.csv(getElement(list.files(), n))$nitrate)))
    
  }
  data.frame(id,rslt)
}
complete("specdata", c(1,2))
#  1 1041
#  2 1041
## unsuccessful

#@"2014-10-18 23:07:37 CDT"
complete<-function(directory, id){
  setwd("C:\\Users\\Josh\\Documents\\CSV")
  setwd(directory)
  nob<-function(id){
    nrow(subset(
      read.csv(getElement(list.files(), id)), 
      !is.na(read.csv(getElement(list.files(), id))$sulfate) & 
        !is.na(read.csv(getElement(list.files(), id))$nitrate)))
  }
  for (n in id) {
    rslt <-  nob(n)
    
#     print(nob (directory, n))
    data.frame(nob,id)
  }
  #  data.frame(id = as.vector(id), nobs = as.vector(nob(directory, id)))
}
complete("specdata", c(1,2))
# Err cannot coerce class function to data frame

#@"2014-10-15 22:15:09 CDT"
complete<-function(directory, id){
  setwd("C:\\Users\\Josh\\Documents\\CSV")
  setwd(directory)
  nob<-function(directory, id){
    nrow(subset(
      read.csv(getElement(list.files(), id)), 
      !is.na(read.csv(getElement(list.files(), id))$sulfate) & 
      !is.na(read.csv(getElement(list.files(), id))$nitrate)))
  }
  for (n in id) {
   rslt <-  nob(directory, n)
   print(nob (directory, n))
  }
#  data.frame(id = as.vector(id), nobs = as.vector(nob(directory, id)))
}
complete("specdata", c(1,2))

#@"2014-10-15 21:11:03 CDT"
complete<-function(directory, id){
  setwd("C:\\Users\\Josh\\Documents\\CSV")
  setwd(directory)
  nobs<-nrow(subset(
    read.csv(getElement(list.files(), id)), 
    !is.na(read.csv(getElement(list.files(), id))$sulfate) & 
      !is.na(read.csv(getElement(list.files(), id))$nitrate)))
  data.frame(id, nobs)
}
complete("specdata", 1)
## correct
complete("specdata", c(2, 4, 8, 10, 12))
## Err selects more than 1 element

#@"2014-10-15 20:52:33 CDT"
nobs<-function(directory, id){
  setwd("C:\\Users\\Josh\\Documents\\CSV")
  setwd(directory)
  nrow(subset(
    read.csv(getElement(list.files(), id)), 
    !is.na(read.csv(getElement(list.files(), id))$sulfate) & 
      !is.na(read.csv(getElement(list.files(), id))$nitrate)))
}
# passes id = 1, 2, 4, 8, 10, 12, 30, 29, 28, 27, 26, 25, 3
# still needs to print data frame

#@"2014-10-15 18:36:41 CDT"
complete<-function(directory, id){
  setwd("C:\\Users\\Josh\\Documents\\CSV")
  setwd(directory)
  nrow(
    subset(
      read.csv(getElement(list.files(), id)), 
      !is.na(read.csv(getElement(list.files(), id))$sulfate)
    )
  )
}
complete("specdata", 1)
# [1] 15747
# should be 117

#@"2014-10-15 18:09:35 CDT"
complete<-function(directory, id){
  setwd("C:\\Users\\Josh\\Documents\\CSV")
  setwd(directory)
  nrow(
    subset(
      read.csv(getElement(list.files(), id)), 
      is.na(read.csv(getElement(list.files(), id))$sulfate)
      )
    )
}
complete("specdata", 1)
# [1] 40509
# should be 117

#@"2014-10-15 08:48:45 CDT"
complete<-function(directory, id){
  setwd("C:\\Users\\Josh\\Documents")
  setwd(directory)
  nrow(subset(read.csv(getElement(list.files(), id)), sulfate !="NA"))
}
complete("specdata", 1)
#   [1] 15747
## should be 117

#@"2014-10-15 08:38:07 CDT"
complete<-function(directory, id){
  setwd("C:\\Users\\Josh\\Documents")
  setwd(directory)
  nrow(subset(read.csv(getElement(list.files(), id))), sulfate!="NA")
}
complete("specdata", 1)
#   Err unused argument (sulfate!="NA")

#@"2014-10-15 08:34:33 CDT"
nobs<-function(id){nrow(subset(read.csv(getElement(list.files(), id)), sulfate!="NA"))}
nobs(1)
#   [1] 15747
## incorrect
# [1] 117 after correcting CSV, thus correct
nobs(2)
#   [1] 1041
## correct

#@"2014-10-15 08:26:50 CDT"
nobs<-function(id){
  nrow(
    subset(
      data.frame(
        read.csv(
          getElement(
            list.files(), id
          )
        )
      ), 
      sulfate != "NA"))}
nobs(2)
#   [1] 1041


#@"2014-10-15 07:58:19 CDT"
pollutantmean<-function(directory, pollutant, id){
  setwd("C:\\Users\\Josh\\Documents")
  setwd(directory)
  doc<-read.csv(getElement(list.files(), id))
  getElement(doc, pollutant)
}
pollutantmean("specdata", "sulfate", 5)
## successful

#@"2014-10-15 07:55:54 CDT"
pollutantmean<-function(directory, pollutant, id){
  setwd("C:\\Users\\Josh\\Documents")
  setwd(directory)
  doc<-read.csv(getElement(list.files(), id))
  pol<-getElement(doc, pollutant)
}
