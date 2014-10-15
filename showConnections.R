## rather not run closeAllConnections()

#@"2014-10-15 07:16:44 CDT"
getConnection(1)
#description       class        mode        text      opened    can read   can write 
#"stdout"  "terminal"         "w"      "text"    "opened"        "no"       "yes" 

#@"2014-10-15 07:15:19 CDT"
showConnections(all=FALSE)
#   description class mode text isopen can read can write

#@"2014-10-15 07:13:46 CDT"
showConnections(all=TRUE)
#description class      mode text   isopen   can read can write
#0 "stdin"     "terminal" "r"  "text" "opened" "yes"    "no"     
#1 "stdout"    "terminal" "w"  "text" "opened" "no"     "yes"    
#2 "stderr"    "terminal" "w"  "text" "opened" "no"     "yes" 