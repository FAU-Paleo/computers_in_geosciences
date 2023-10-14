# Tabulation of entries

# the penguins
penguins <- read.delim("c:/Users/Adam/Desktop/2023-2024winter/computers/day_4/data/penguins.tab")

# getting a tabulation
table(penguins$species)

# sex of penguins, are there more females in the dataset? 
# how many males and how many females
tab <- table(penguins$sex)

# numeric subscript
tab[2]
tab[3]

# cf
a <- 1:12
a[4]

# get the number of penguins in each sex
number_of_male_penguins <- tab["male"]
number_of_female_penguins <- tab["female"]

# are there more females then males? 
number_of_female_penguins > number_of_male_penguins

 


