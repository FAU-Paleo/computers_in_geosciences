# Computers in geosciences course: day 3
# Script written during the class: working directory

# ON windows and Rstudio
# Copy the file in the windows explorer, and paste it into Rstudio'as code editor
# it will make the path R-compatible, which should be using forward slashes
#  This is a semicolon-separated data file
#  YOU WILL NEED TO UPDATE THIS ON YOUR COMPUTER TO WORK
stages <- read.csv("C:/Users/Adam/Desktop/computers_course/data/stages.csv", sep=";")

# Always check the strucutre of the imported object:
# - Class is correct
# - All columns are recognized, their number makes sense
# - The types of the columns are correct - look for number data, if they are listed as characters,
# then they are not recognized to be numbers, somethign is wrong, maybe decimals not correctly set
str(stages)

# get current working directory
getwd()

# the working directory can be set to make it easier to find files.
# This will be used as a reference point for the rest of the paths
setwd("C:/Users/Adam/Desktop/computers_course/")

# and then they can be used like this
rm(stages)
stages <- read.csv("data/stages.csv", sep=";")


