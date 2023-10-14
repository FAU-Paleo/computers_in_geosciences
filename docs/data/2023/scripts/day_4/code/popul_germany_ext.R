# First data importing script
# import the data
# no staring slash
# forward slashes for hierarchy
# point to the file

numbers <- c(44,3,3)

# read in from tab-delimited
# germany <- read.delim("c:/Users/Adam/Desktop/2023-2024winter/computers/day_4/data/germany.tab")
# str(germany)


# read in from csv
germany <- read.csv("c:/Users/Adam/Desktop/2023-2024winter/computers/day_4/data/germany.csv")
str(germany)
View(germany)


# column access (subsetting)
# Blueprint: <name_of_data.frame>$<name_of_the_column>

# print the year column to the console as a vector
germany$Year

# print the population column to the console as a vector
germany$Pop.

# line plot
plot(germany$Year, germany$Pop., type="l")

