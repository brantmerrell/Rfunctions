table(schedule$driving)
#   < table of extent 0 >

table(schedule$activity)
#   listed the items in the activity column and numbered their occurrences 

table(schedule)
#   turned columns into rows and multiplied . . . not sure . . . produced something big

table(plants)
#   Error in table(plants) : attempt to make a table with >= 2^31 elements


table(plants$Active_Growth_Period)
#  Fall, Winter and Spring                  Spring         Spring and Fall 
#  15                     144                      10 
#  Spring and Summer    Spring, Summer, Fall                  Summer 
#  447                      95                      92 
#  Summer and Fall              Year Round 
#  24                       5