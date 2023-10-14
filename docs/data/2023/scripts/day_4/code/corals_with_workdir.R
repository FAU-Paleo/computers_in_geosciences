# Corals.csv table 

# change working directory
setwd("C:/Users/Adam/Desktop/2023-2024winter/computers/")

# query the working directory
getwd()

# read in the the corals
corals <- read.csv("day_4/data/corals.csv")

# read in the stages
stages <- read.csv("day_4/data/stages.csv", sep=";")

# how many different genera are in this table
length(unique(corals$genus))

# sorting 
kinds <- unique(corals$genus)
# ascending (alphabetic)
sort(kinds)

# reverse alphabetic
sort(kinds, decreasing=TRUE)



# logical not operator FYI
!TRUE


# additional attributes
colnames(corals)
colnames(stages)

# rownames have to be different
rownames(stages)
rownames(corals)


# Join - merge()
mer <- merge(corals, stages, by="stg")

# How many records come from the Carnian
sum(mer$short == "Car")

# the same with not abbreviated
sum(mer$stage.y == "Carnian")

# from the original corals table 
sum(mer$stage.x == "Carnian", na.rm=TRUE)

NA == 4

