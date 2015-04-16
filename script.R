scholarlinks<-function(searchterm,title,link){
  
}

## compile notes
papernotes<-list("Ideas U.S. Policy"=c("Vital Speeches of the Day",
                                       "State Dept. Bulletin (state.gov)",
                                       "State Dept. Daily Press Briefings","senate.gov",
                                       "house.gov","Congressional Quarterly Weekly",
                                       "Congressional Hearings","Foreign Affairs","Foreign Policy",
                                       "Current History","The World Today","Economist",
                                       "Financial Times","ustr.gov","wto.org","worldbank.org",
                                       "fao.org"),
                 "Paper Topic"="Inclusion in Iraq's Political Processes",
                 "Workflow"=data.frame(step=1:5,
                                       verb=c("identify & gather","read","synthesize","write",
                                              "develop"),
                                       object=c("materials","materials","materials","paper",
                                                "policy options")),
                 "dots"=c("pre-Maliki Iraq","pre-Ottoman Iraq","Ideal Iraq (democratic)",
                          "market-success correlation","democracy-success correlation",
                          "Good Constitution + User error","Flawed Constitution"),
                 "sourcelist1"=links1,
                 "sourcelist2"=links2,
                 "pink"=c("assume the role of an analyst who is developing policy alternatives",
                          "a State Department analyst giving the President or Secretary of 
                          State the necessary background and various policy options to 
                          formulate foreign policy",
                          "something that would come out of the United States state department",
                          "specific and detailed policy recommendations to a leading US policy
                          maker","books, government documents, and statistical resources",
                          "weekly news magazines and newspaper articles",
                          "email news services","internet sources"),
                 "Paper"=MEPaper2)

## convert txt to csv
MEPaper2<-readLines("./txt/ME - Paper 2.txt",warn=FALSE)
MEPaper2[MEPaper2==""]<-" "
workchar<-""
for(n in (1:length(MEPaper2))){
  workchar<-paste(workchar,MEPaper2[n], sep="")
}
workchar<-gsub("  "," ",workchar)
workchar<-gsub("U.S.","U.S.*",workchar)
workchar<-gsub("mattew.","mattew.*",workchar)
MEPaper2<-paste(unlist(strsplit(workchar,"(\\. )")),".",sep="")
MEPaper2<-gsub("\*","",MEPaper2)
write.csv(MEPaper2,"./csv Personal/ME-Paper2.csv",row.names=FALSE)
research<-readLines("./txt/INTL Research.txt",warn=FALSE)
research2<-readLines("./txt/INTL Research 2.txt",warn=FALSE)
View(research)
links1<-data.frame(description=research[c(109,113,117)],link=research[c(111,115,119)])
View(links1)
View(research2)
links2<-c("http://www.bbc.com/news/world-us-canada-16191394",
          "https://www.youtube.com/watch?v=Pg9aEV9bcxs",
          "https://www.youtube.com/watch?v=Hlq9eItoAlg obama 12/14/11",
          "https://www.youtube.com/watch?v=spIWGoNZnaU Obama (9/10/14)")

## extract notes for JS gulp course
notes<-read.csv("C:/Users/Josh/Documents/CSV Personal/notes.csv", colClasses="character")
summary(notes)
# note               time          
# Length:1062        Length:1062       
# Class :character   Class :character  
# Mode  :character   Mode  :character  
gulp.js<-notes[subset(notes[,2], grepl("pluralsight.com/courses/javascript-build-automation-gulpjs",
                              notes[,1]))<=notes[,2],]
notes<-notes[notes[,2]<subset(notes[,2], grepl("pluralsight.com/courses/javascript-build-automation-gulpjs",
                                       notes[,1])),]
write.csv(gulp.js,"C:/Users/Josh/Documents/CSV/gulp.js.csv",row.names=FALSE)
write.csv(notes,"C:/Users/Josh/Documents/CSV/gulp.js.csv", row.names=FALSE)

## read Google Scholar Metrics
link="https://scholar.google.com/citations?view_op=top_venues&hl=en"
metrics<-readLines(link)
class(metrics)
# [1] "character"
metrics<-strsplit(metrics,"<|>")
class(metrics)
# [1] "list"
metrics<-unlist(metrics)
class(metrics)
# [1] "character"
head(metrics)
# [1] ""              "!doctype html" ""              "html"          ""              "head"
metrics<-metrics[!(metrics %in% c("","!doctype html","html","head"))]
head(metrics)
# [1] "title"                                                                    
# [2] "Google Scholar Metrics"                                                   
# [3] "/title"                                                                   
# [4] "meta http-equiv=\"Content-Type\" content=\"text/html;charset=ISO-8859-1\""
# [5] "meta http-equiv=\"X-UA-Compatible\" content=\"IE=Edge\""                  
# [6] "meta name=\"referrer\" content=\"always\""                
metrics<-metrics[(!(grepl("(http)|/",metrics)) 
                  & !(metrics %in% c("","!doctype html","html","head","title")))]
head(metrics)
# [1] "Google Scholar Metrics"                                                                               
# [2] "meta name=\"referrer\" content=\"always\""                                                            
# [3] "meta name=\"viewport\" content=\"width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=2\""
# [4] "style"                                                                                                
# [5] "@viewport{width:device-width;min-zoom:1;max-zoom:2;}"                                                 
# [6] "meta name=\"format-detection\" content=\"telephone=no\""
metrics<-metrics[(!(grepl("(http)|/|@|=",metrics)) 
                  & !(metrics %in% c("","!doctype html","html","head","title")))]
head(metrics)
# [1] "Google Scholar Metrics"                                                                                                                                                                                                                                  
# [2] "style"                                                                                                                                                                                                                                                   
# [3] "style"                                                                                                                                                                                                                                                   
# [4] "html,body,form,table,div,h1,h2,h3,h4,h5,h6,img,ol,ul,li,button{margin:0;padding:0;border:0;}table{border-collapse:collapse;border-width:0;empty-cells:show;}#gs_top{position:relative;min-width:964px;-webkit-tap-highlight-color:rgba(0,0,0,0);}#gs_top"
# [5] "script"                                                                                                                                                                                                                                                  
# [6] "!--[if lte IE 8]"
metrics<-metrics[(!(grepl("(http)|/|@|=|\\[|\\{",metrics)) 
                  & !(metrics %in% c("","!doctype html","html","head","title","style","script")))]
metrics[2:7]
# [1] "10||Math.abs(Y-h.pageY)"     "10||Math.abs(O-pageYOffset)" "1060||h"                    
# [4] "1252||h"                     "1&&x"                        "body"  
metrics<-metrics[(!(grepl("(http)|/|@|=|\\[|\\{|&|0|1|2|3|4|5|6|7|8|9",metrics)) 
                  & !(metrics %in% c("","!doctype html","html","head","title","style","script",
                                     "body")))]
metrics[2:7]
# [1] "Web"                                                                    
# [2] "Images"                                                                 
# [3] "Sign in"                                                                
# [4] "div"                                                                    
# [5] "Sorry, some features may not work in this version of Internet Explorer."
# [6] "div"
metrics<-metrics[(!(grepl("(http)|/|@|=|\\[|\\{|&|0|1|2|3|4|5|6|7|8|9|(Sorry)",metrics)) 
                  & !(metrics %in% c("","!doctype html","html","head","title","style","script",
                                     "body","Web","Images","Sign in","div")))]
metrics[2:7]
metrics<-metrics[(!(grepl("(http)|/|@|=|\\[|\\{|&|0|1|2|3|4|5|6|7|8|9|(Sorry)|(Please)|(best)",
                          metrics))
                  & !(metrics %in% c("","!doctype html","html","head","title","style","script",
                                     "body","Web","Images","Sign in","div","","Google Chrome",
                                     " or ","Mozilla Firefox")))]
metrics[2:7]
# [1] "Scholar"        "Search Scholar" "Categories"     "English"        "li"             "li" 
metrics<-metrics[(!(grepl("(http)|/|@|=|\\[|\\{|&|0|1|2|3|4|5|6|7|8|9|(Sorry)|(Please)|(best)",
                          metrics))
                  & !(metrics %in% c("","!doctype html","html","head","title","style","script",
                                     "body","Web","Images","Sign in","div","","Google Chrome",
                                     " or ","Mozilla Firefox","Scholar","Search Scholar",
                                     "Categories","English","li")))]
metrics[2:7]
# [1] "Social Sciences" "div "            "div "            "div "            "div "            "div "
metrics<-metrics[(!(grepl("(http)|/|@|=|\\[|\\{|&|0|1|2|3|4|5|6|7|8|9|(Sorry)|(Please)|(best)|(div)",
                          metrics))
                  & !(metrics %in% c("","!doctype html","html","head","title","style","script",
                                     "body","Web","Images","Sign in","","Google Chrome",
                                     " or ","Mozilla Firefox","Scholar","Search Scholar",
                                     "Categories","English","li")))]
metrics[2:7]
# [1] "Social Sciences" "Social Sciences" "Chinese"         "Portuguese"      "German"          "Spanish"
metrics[8:14]
# [1] "French"                     "Italian"                    "Japanese"                  
# [4] "Dutch"                      "Top publications - English" " "                         
# [7] "Learn more"                
metrics[15:25]
# [1] "hide"                                "hide"                               
# [3] "tr"                                  "Publication"                        
# [5] "tr"                                  "Nature"                             
# [7] "tr"                                  "The New England Journal of Medicine"
# [9] "tr"                                  "Science"                            
# [11] "tr"                      
metrics<-metrics[(!(grepl("(http)|/|@|=|\\[|\\{|&|0|1|2|3|4|5|6|7|8|9|(Sorry)|(Please)|(best)|(div)",
                          metrics))
                  & !(metrics %in% c("","!doctype html","html","head","title","style","script",
                                     "body","Web","Images","Sign in","","Google Chrome",
                                     " or ","Mozilla Firefox","Scholar","Search Scholar",
                                     "Categories","English","li","tr","hide")))]
metrics[15:25]
# [1] "Publication"                                     "Nature"                                         
# [3] "The New England Journal of Medicine"             "Science"                                        
# [5] "The Lancet"                                      "Cell"                                           
# [7] "Proceedings of the National Academy of Sciences" "Journal of Clinical Oncology"                   
# [9] "Chemical Reviews"                                "Physical Review Letters"                        
# [11] "Journal of the American Chemical Society"       
metrics[35:45]
# [1] "Journal of the American College of Cardiology"               
# [2] "arXiv Cosmology and Extragalactic Astrophysics (astro-ph.CO)"
# [3] "Blood"                                                       
# [4] "The Astrophysical Journal"                                   
# [5] "ACS Nano"                                                    
# [6] "PLoS ONE"                                                    
# [7] "Nature Materials"                                            
# [8] "Nature Medicine"                                             
# [9] "arXiv High Energy Physics - Phenomenology (hep-ph)"          
# [10] "arXiv Mesoscale and Nanoscale Physics (cond-mat.mes-hall)"   
# [11] "arXiv Materials Science (cond-mat.mtrl-sci)"        
metrics[as.integer(length(metrics)*.5)]
# [1] "Nature Biotechnology"
metrics[as.integer((length(metrics)/20)*(1:20))]
# [1] "Portuguese"                                    "Dutch"                                        
# [3] "The New England Journal of Medicine"           "Chemical Reviews"                             
# [5] "Chemical Society reviews"                      "Journal of the American College of Cardiology"
# [7] "Nature Materials"                              "Nature Reviews Cancer"                        
# [9] "The Cochrane Database of Systematic Reviews"   "Nature Biotechnology"                         
# [11] "The Journal of Neuroscience"                   "The Journal of Experimental Medicine"         
# [13] "Nature Reviews Neuroscience"                   "Pediatrics"                                   
# [15] "Nature Cell Biology"                           "Clinical Infectious Diseases"                 
# [17] "Chemical communications (Cambridge, England)"  "Neurology"                                    
# [19] "About Google Scholar"                          "Provide feedback" 
metrics[as.integer((length(metrics)/20)*18):as.integer((length(metrics)/20)*19)]
# [1] "Neurology"                                                                                      
# [2] "Reviews of Modern Physics"                                                                      
# [3] "The Journal of Finance"                                                                         
# [4] "Chemistry of Materials"                                                                         
# [5] "The Journal of Immunology"                                                                      
# [6] "Dates and citation counts are estimated and are determined automatically by a computer program."
# [7] "About Google Scholar" 
metrics[as.integer((length(metrics)/20)*18)+4]
# [1] "The Journal of Immunology"
metrics[as.integer((length(metrics)/20)*2):as.integer((length(metrics)/20)*3)]
# [1] "Dutch"                               "Top publications - English"         
# [3] " "                                   "Learn more"                         
# [5] "Publication"                         "Nature"                             
# [7] "The New England Journal of Medicine"
metrics[as.integer((length(metrics)/20)*2)+5]
# [1] "Nature"
metrics<-metrics[(as.integer((length(metrics)/20)*2)+5):(as.integer((length(metrics)/20)*18)+4)]
head(metrics)
# [1] "Nature"                                          "The New England Journal of Medicine"            
# [3] "Science"                                         "The Lancet"                                     
# [5] "Cell"                                            "Proceedings of the National Academy of Sciences"
tail(metrics)
# [1] "PLoS Genetics"             "Neurology"                 "Reviews of Modern Physics"
# [4] "The Journal of Finance"    "Chemistry of Materials"    "The Journal of Immunology"
metrics[80]
# [1] "Clinical Infectious Diseases"
metrics<-unlist(strsplit(readLines(link,warn=FALSE),"<|>"))
metrics<-metrics[(!(grepl("(http)|/|@|=|\\[|\\{|(Sorry)|(Please)|(best)|(div)",
                          metrics))
                  & !(metrics %in% c("","!doctype html","html","head","title","style","script",
                                     "body","Web","Images","Sign in","","Google Chrome",
                                     " or ","Mozilla Firefox","Scholar","Search Scholar",
                                     "Categories","English","li","tr","hide")))]
head(metrics)
# [1] "Google Scholar Metrics"      "10||Math.abs(Y-h.pageY)"     "10||Math.abs(O-pageYOffset)"
# [4] "1060||h"                     "1252||h"                     "1&&x"    
tail(metrics)
# [1] " "                "Privacy"          " "                "Terms"            " "               
# [6] "Provide feedback"
metrics[as.integer((length(metrics)/20)*(1:20))]
# [1] "Physics &amp; Mathematics"      "2."                             "306"                           
# [4] "Circulation"                    "241"                            "149"                           
# [7] "30."                            "133"                            "Journal of High Energy Physics"
# [10] "204"                            "Nature Physics"                 "58."                           
# [13] "119"                            "69."                            "173"                           
# [16] "Nature Methods"                 "157"                            "109"                           
# [19] "97."                            "Provide feedback"              
n<-1
while(metrics[n]!="Nature"){
  n<-n+1
}
metrics[n]
# [1] "Nature"
head(metrics[-(1:(n-1))])
# [1] "Nature"                              "355"                                
# [3] "495"                                 "2."                                 
# [5] "The New England Journal of Medicine" "329"    
metrics<-metrics[-(1:(n-2))]
n<-length(metrics)
while(metrics[n]!="The Journal of Immunology"){
  n<-n-1
}
metrics[(n-1):(n+2)]
# [1] "100."                      "The Journal of Immunology" "107"                      
# [4] "142"                      
metrics<-metrics[-((n+3):(length(metrics)))]
tail(metrics)
# [1] "107"                       "152"                       "100."                     
# [4] "The Journal of Immunology" "107"                       "142" 
head(data.frame(rank=metrics[(1:100)*4-3],
                journal=metrics[(1:100)*4-2],
                h5_index=metrics[(1:100)*4-1],
                h5_median=metrics[(1:100)*4]))
# rank                                         journal h5_index h5_median
# 1   1.                                          Nature      355       495
# 2   2.             The New England Journal of Medicine      329       495
# 3   3.                                         Science      311       431
# 4   4.                                      The Lancet      248       381
# 5   5.                                            Cell      223       343
# 6   6. Proceedings of the National Academy of Sciences      217       280
tail(data.frame(rank=metrics[(1:100)*4-3],
                journal=metrics[(1:100)*4-2],
                h5_index=metrics[(1:100)*4-1],
                h5_median=metrics[(1:100)*4]))
# rank                   journal h5_index h5_median
# 95   95.             PLoS Genetics      108       144
# 96   96.                 Neurology      108       132
# 97   97. Reviews of Modern Physics      107       233
# 98   98.    The Journal of Finance      107       163
# 99   99.    Chemistry of Materials      107       152
# 100 100. The Journal of Immunology      107       142
## conclusion: required scholar inputs are link, first journal, and last journal or number of journals
journals<-scholarmetric()
journals<-rbind(scholarmetric(),
                scholarmetric("https://scholar.google.com/citations?view_op=top_venues&hl=en&vq=bus",
                              "NBER Working Papers",
                              "The Economic Journal"))
journals<-rbind(journals,
                scholarmetric("https://scholar.google.com/citations?view_op=top_venues&hl=en&vq=
                              bus_accountingtaxation",
                              "Journal of Accounting and Economics",
                              "International Journal of Accounting Information Systems"))
journals<-rbind(journals,
                scholarmetric("https://scholar.google.com/citations?view_op=top_venues&hl=en&vq=
                              bus_busgeneral",
                              "Management Information Systems Quarterly",
                              "Open Access publications from Université catholique de Louvain"))
journals<-unique(journals)
