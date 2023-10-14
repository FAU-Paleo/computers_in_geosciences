# The stages table

# importing the table
# wrong import, 1 column
# stages <- read.csv("C:/Users/Adam/Desktop/2023-2024winter/computers/day_4/data/stages.csv")

# wrong import, decimal points! characters for age-dates
# stages <- read.csv2("C:/Users/Adam/Desktop/2023-2024winter/computers/day_4/data/stages.csv")
               
# manually set to semicolon separators
stages <- read.csv("C:/Users/Adam/Desktop/2023-2024winter/computers/day_4/data/stages.csv", 
                   sep=";")

# how many systems are in the table?
length(unique(stages$system))

# How many stages are there in the Jurassic System? GTS2020. 
# Solution No. 1
length(stages$stage[which(stages$system == "Jurassic")])

# works with unique too!
length(unique(stages$stage[which(stages$system == "Jurassic")]))

# Solution No. 2
system <- table(stages$system)
system["Jurassic"]

# Solution 1B
length(stages[which(stages$system == "Jurassic") , "stage" ])



