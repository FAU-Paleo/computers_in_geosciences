# Counting 'levels'

# the penguins
penguins <- read.delim("c:/Users/Adam/Desktop/2023-2024winter/computers/day_4/data/penguins.tab")

# set of values in a function
unique(penguins$species)

# how many kinds of species do I have
length(unique(penguins$species))

# how many islands are in the dataset?
# two lines
islands <- unique(penguins$island)
length(islands)

# one line
length(unique(penguins$island))

# how many years did sampling take place?
length(unique(penguins$year))




