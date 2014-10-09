
## objective: simulate 100 coin flips in which 0=tails with probability 0.3 
## and 1=heads with probability 0.7
sample(c(0,1), 100, replace = TRUE, prob = c(0.3, 0.7))

## objective: permute the alphabet
sample(LETTERS)
#   [1] "K" "O" "F" "L" "C" "W" "I" "D" "P" "Y" "U" "V" "Q" "X" "H" "N" "J" "R" "E" "S"
#   [21] "T" "B" "M" "G" "Z" "A"
## successful

## objective: generate 10 numbers between 1 and 20 without replacement.
sample(1:20, 10)
#   [1] 10 14 20 15 5 2 6 7 1 13
## successful

## objective: simulate four six-sided dice
sample(1:6, 4, replace = TRUE)
#   [1] 5 6 5 3
sample(1:6, 4, replace = TRUE)
#   [1] 2 1 3 6
## successful
