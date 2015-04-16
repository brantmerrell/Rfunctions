library(rmongodb)

##load definitions
data<-alldefinitions()

##create alphabetized vector of all unique words (split by space)
words<-""
for(row in 1:nrow(data)){
  words<-sort(unique(c(words,strsplit(data[row,4]," ")[[1]])))
}
words<-subset(words,words!="")

## test all at once:
# mongo.bson.from.list(list(testword=words[1:4378])) == NULL

## test whether NULLs are strictly localized
# mongo.bson.from.list(list(testword=words[101:4378])) == NULL
# mongo.bson.from.list(list(testword=words[1:100])) == NULL
## NULLs not localized

## test in overlapping increments of 101
#### valid: 
# mongo.bson.from.list(list(testword=words[100:200]))
# mongo.bson.from.list(list(testword=words[200:300]))
# mongo.bson.from.list(list(testword=words[400:500]))
# mongo.bson.from.list(list(testword=words[500:600]))
# mongo.bson.from.list(list(testword=words[600:700]))
# mongo.bson.from.list(list(testword=words[700:800]))
# mongo.bson.from.list(list(testword=words[800:900]))
# mongo.bson.from.list(list(testword=words[1100:1200]))
# mongo.bson.from.list(list(testword=words[1200:1300]))
# mongo.bson.from.list(list(testword=words[1300:1400]))
# mongo.bson.from.list(list(testword=words[1800:1900]))
# mongo.bson.from.list(list(testword=words[1900:2000]))
# mongo.bson.from.list(list(testword=words[2000:2100]))
# mongo.bson.from.list(list(testword=words[2200:2300]))
# mongo.bson.from.list(list(testword=words[2400:2500]))
# mongo.bson.from.list(list(testword=words[2500:2600]))
# mongo.bson.from.list(list(testword=words[2600:2700]))
# mongo.bson.from.list(list(testword=words[2700:2800]))
# mongo.bson.from.list(list(testword=words[2800:2900]))
# mongo.bson.from.list(list(testword=words[2900:3000]))
# mongo.bson.from.list(list(testword=words[3000:3100]))
# mongo.bson.from.list(list(testword=words[3200:3300]))
# mongo.bson.from.list(list(testword=words[3300:3400]))
# mongo.bson.from.list(list(testword=words[3400:3500]))
# mongo.bson.from.list(list(testword=words[3500:3600]))
# mongo.bson.from.list(list(testword=words[3600:3700]))
# mongo.bson.from.list(list(testword=words[3800:3900]))
# mongo.bson.from.list(list(testword=words[3900:4000]))
# mongo.bson.from.list(list(testword=words[4000:4100]))
# mongo.bson.from.list(list(testword=words[4100:4200]))
# mongo.bson.from.list(list(testword=words[4300:4378]))
####NULL:
# mongo.bson.from.list(list(testword=words[300:400]))
# mongo.bson.from.list(list(testword=words[900:1000]))
# mongo.bson.from.list(list(testword=words[1500:1600]))
# mongo.bson.from.list(list(testword=words[1600:1700]))
# mongo.bson.from.list(list(testword=words[1700:1800]))
# mongo.bson.from.list(list(testword=words[2100:2200]))
# mongo.bson.from.list(list(testword=words[2300:2400]))
# mongo.bson.from.list(list(testword=words[3100:3200]))
# mongo.bson.from.list(list(testword=words[3700:3800]))
# mongo.bson.from.list(list(testword=words[4200:4300]))

## test nulls in overlapping increments of 27
testrange<-function(n,plusminus=13){
  mongo.bson.from.list(list(testword=words[(n-plusminus):(n+plusminus)]))
}


testrange(312) # valid
testrange(912) # NULL
testrange(1512) # valid
testrange(1612) # valid
testrange(1712) # valid
testrange(2112) # NULL
testrange(2312) # NULL
testrange(3112) # valid
testrange(3712) # valid
testrange(4212) # valid
testrange(337) # NULL
testrange(937) # valid
testrange(1537) # valid
testrange(1637) # valid
testrange(1737) # NULL
testrange(2137) # valid
testrange(2337) # valid
testrange(3137) # valid
testrange(3737) # NULL
testrange(4237) # NULL 
testrange(362) # NULL
testrange(962) # valid
testrange(1562) # NULL
testrange(1662) # NULL
testrange(1762) # valid
testrange(2162) # valid
testrange(2362) # valid
testrange(3162) # valid
testrange(3762) # valid
testrange(4262) # NULL 
testrange(387) # valid
testrange(987) # valid
testrange(1587) # valid
testrange(1687) # valid
testrange(1787) # valid
testrange(2187) # valid
testrange(2387) # valid
testrange(3187) # NULL 
testrange(3787) # valid
testrange(4287) # valid

nulls<-c(912,2112,2312,337,1737,3737,4237,362,1562,1662,4262,3187)

## test nulls in overlapping increments of 11
## then test 
testrange<-function(n,plusminus=5){
  mongo.bson.from.list(list(testword=words[(n-plusminus):(n+plusminus)]))
}
n<-1
testrange(nulls[n]-7) # NULL
mongo.bson.from.list(list(testword=words[905])) # NULL 905
testrange(nulls[n]+3)
testrange(nulls[n]+8)
n<-2
testrange(nulls[n]-7)
testrange(nulls[n]+3) # NULL 
mongo.bson.from.list(list(testword=words[2116])) # NULL 2116
testrange(nulls[n]+8) # NULL
mongo.bson.from.list(list(testword=words[2117:2125]))
n<-3
testrange(nulls[n]-7) # NULL
mongo.bson.from.list(list(testword=words[2301])) # NULL 2301
testrange(nulls[n]+3)
testrange(nulls[n]+8)
n<-4
testrange(nulls[n]-7)
testrange(nulls[n]+3)
testrange(nulls[n]+8) # NULL
mongo.bson.from.list(list(testword=words[346])) # NULL 346
n<-5
testrange(nulls[n]-7) # NULL
mongo.bson.from.list(list(testword=words[1726])) # NULL 1726
mongo.bson.from.list(list(testword=words[1727])) # NULL 1727
testrange(nulls[n]+3)
testrange(nulls[n]+8)
n<-6
testrange(nulls[n]-7) # NULL
mongo.bson.from.list(list(testword=words[3731])) # NULL 3731
testrange(nulls[n]+3)
testrange(nulls[n]+8)
n<-7
testrange(nulls[n]-7)
testrange(nulls[n]+3)
testrange(nulls[n]+8) # NULL
mongo.bson.from.list(list(testword=words[4246])) # NULL 4246
n<-8
testrange(nulls[n]-7) # NULL
mongo.bson.from.list(list(testword=words[358])) # NULL 358
mongo.bson.from.list(list(testword=words[359])) # NULL 359
testrange(nulls[n]+3)
testrange(nulls[n]+8)
n<-9
testrange(nulls[n]-7) # NULL
mongo.bson.from.list(list(testword=words[1557])) # NULL 1557
testrange(nulls[n]+3)
testrange(nulls[n]+8)
n<-10
testrange(nulls[n]-7)
testrange(nulls[n]+3) # NULL
mongo.bson.from.list(list(testword=words[1665])) # NULL 1665
testrange(nulls[n]+8) # NULL
n<-11
testrange(nulls[n]-7)
testrange(nulls[n]+3) # NULL
mongo.bson.from.list(list(testword=words[4270])) # NULL 4270
testrange(nulls[n]+8) # NULL
n<-12
testrange(nulls[n]-7)
testrange(nulls[n]+3)
testrange(nulls[n]+8) # NULL
mongo.bson.from.list(list(testword=words[3199])) # NULL 3199
wordframe<-data.frame(row=1:length(words),word=words)
subset(wordframe,grepl("–bearing",wordframe$word))
words[54]
troublewords<-words[c(54,3199,4270,1665,1557,359,358,4246,3731,1727,1726,346,2301,2116,905)]
# length(troublewords)
# replaceframe<-data.frame(troubleword=troublewords,
#                          replacement=c("-bearing","policy's","vary","Employers'","Directors'","\"Other",
#                                        "\"Equity","user's","securities","etc....","etc...",
#                                        "* prior","institution's","IBA's","bank's"))
troubleDash<-strsplit(words[54],"")[[1]][1]
troubleApost<-strsplit(words[3199],"")[[1]][7]
troubleQuoteRight<-strsplit(words[4270],"")[[1]][7]
troubleQuoteLeft<-strsplit(words[359],"")[[1]][1]
troubleDots<-strsplit(words[1727],"")[[1]][4]
troubleSpace<-strsplit(words[346],"*|p")[[1]][2]
subset(troublewords,!grepl(troubleDash,troublewords) & !grepl(troubleApost,troublewords) 
       & !grepl(troubleQuoteRight,troublewords) &  !grepl(troubleQuoteLeft,troublewords) 
       & !grepl(troubleDots,troublewords) & !grepl(troubleSpace,troublewords))
identical(troubleDash,"-")
sum(grepl(troubleDash,data$LongDescription))
data$LongDescription<-gsub(troubleDash,"-",data$LongDescription)
sum(grepl(troubleDash,data$LongDescription))
sum(grepl(troubleApost,data$LongDescription))
sum(grepl(troubleQuoteRight,data$LongDescription))
data$LongDescription<-gsub(troubleQuoteRight,"\"",data$LongDescription)
sum(grepl(troubleQuoteRight,data$LongDescription))
sum(grepl(troubleQuoteLeft,data$LongDescription))
sum(grepl(troubleDots,data$LongDescription))
sum(grepl(troubleSpace,data$LongDescription))
mongo.bson.from.list(list(LongDescription=data$LongDescription))
mongo.bson.from.list(list(ShortDescription=data$ShortDescription))
sum(grepl(troubleDash,data$ShortDescription))
data$ShortDescription<-gsub(troubleDash,"-",data$ShortDescription)
data$ShortDescription<-gsub(troubleApost,"'",data$ShortDescription)
data$ShortDescription<-gsub(troubleQuoteRight,"\"",data$ShortDescription)
data$ShortDescription<-gsub(troubleQuoteLeft,"\"",data$ShortDescription)
data$ShortDescription<-gsub(troubleDots,"...",data$ShortDescription)
data$ShortDescription<-gsub(troubleSpace," ",data$ShortDescription)
mongo.bson.from.list(list(ShortDescription=data$ShortDescription))
mongo.bson.from.list(list(Variable=data$Variable))
mongo.bson.from.list(list(File=data$File))
mongo.bson.from.df(data)

mongo.bson.from.list(list(testword=words[4270]))
problem<-2
LongDescription<-data$LongDescription
class(LongDescription)
for(problem in 1:nrow(replaceframe)){
  LongDescription<-gsub(replaceframe[problem,1],replaceframe[problem,2],LongDescription)
}

mongo.bson.from.list(list(testvec=LongDescription[90]))

gsub(words[159],"IBA's",gsub(words[4],"\\-bearing",))
