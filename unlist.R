doc.text = unlist(C:\\Users\\Josh\\Documents\\HTML("The Library of Babel.html", '//p', xmlValue))

#@"2014-10-16 09:47:18 CDT" attempt to start RStudio
#@"2014-10-16 18:15:31 CDT" attempt to start RStudio
#@"2014-10-17 10:49:07 CDT"
doc.text = unlist(xpathApply(doc.html, '//p', xmlValue))
# Err could not find function "xpathApply"