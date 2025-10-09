#############################################################
# Computers in geoscience course - Day 3
# The stages table

# 1. construct the windows-style path to the directory
# and add the file name
# C:\Users\Adam\Desktop\computers_course\data\stages.csv

# 2. Add the quotes around to indicate that this a character
# "C:\Users\Adam\Desktop\computers_course\data\stages.csv"

# 3. R is not the windows-style paths natively, you have to use /
"C:/Users/Adam/Desktop/computers_course/data/stages.csv"

# 4. put it in the loading function
stages <- read.csv(
  "C:/Users/Adam/Desktop/computers_course/data/stages.csv",
  sep=";", dec=".", header=TRUE)
str(stages)

# DO NOT SAVE A CSV IN EXCEL AND THEN IMPORT INTO R
# 1. Make sure that the number of columns is correct
# 2. Make sure that the types of the columns are correct

# integers vs "numerics" (i.e. double precision floating point numbers)
str(1)
str(stages$stg[1])

# an integer value
# str(1L)


################################################################################
# Some basic analyses/wrangling

# 1. What are the names of the stages that have a mid age younger than 100Ma?
stages$stage[which(stages$mid < 100)]

# a bit more flexible - allowing the extracted variable to be changed computationally
question <- "system"
stages[which(stages$mid < 100), question]


# 2. How many different periods/systems are in this table?
# - get the column of the systems/periods
stages$system
# - omit the duplicates: keep every value once
unique(stages$system)

# - count the number elements in the resulting vector
length(unique(stages$system))

# the number of epochs/series
length(unique(stages$series))

# 3. Which is the longest age/stage in the table? (give me a stage name!)
# a. stage duration is equal to the max duration
# b. use this to subset the names of the stage
stages$stage[which(stages$dur==max(stages$dur))]


# 4. The longest age/stage in the Phanerozoic eon!
# a. Create a subset for the Phanerozoic! (data.frame)
phanerozoic <- stages[ stages$system!="Ediacaran" , ]
# phanerozoic <- subset(stages, system!="Ediacaran")


# b. Use the expression from earlier to find the longest stage
# replace 'stages' with 'phanerozoic' -> EVERYWHERE!
phanerozoic$stage[which(phanerozoic$dur==max(phanerozoic$dur))]

# replace really everywhere!
# phanerozoic$stage[which(phanerozoic$dur==max(phanero$dur))]




