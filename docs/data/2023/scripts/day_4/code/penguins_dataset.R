# Reading in the penguins dataset

# tab-delimited data
penguins <- read.delim("c:/Users/Adam/Desktop/2023-2024winter/computers/day_4/data/penguins.tab")

# get a specific column
penguins$body_mass_g

# average body mass of a penguin
mean(penguins$body_mass_g)

# the minimum 
min(penguins$body_mass_g)

# standard argument for omitting NAs
mean(penguins$body_mass_g, na.rm=TRUE)


# logical comparsion is this chinstrap?
penguins$species == "Chinstrap"

# extracting values from a data.frame
# 1. Refer to columns, and then values inside that
penguins$body_mass_g[1]

penguins$body_mass_g[1:3]

# body mass of chinstrap penguins

# where are the Chinstrap penguins
indices <- which(penguins$species == "Chinstrap")
penguins$body_mass_g[indices]

# in a single line of code
chin_body <- penguins$body_mass_g[which(penguins$species == "Chinstrap")]

# average body size
mean(chin_body)

# confirmation
penguins$species[which(penguins$species == "Chinstrap")]

# 2. different way of referring to the data (matrix-style)
# 1: rows
# 2: column
penguins[ 2 , 6 ]

# row and column index!
penguins[ 1:2 , 6 ]

# row index and column name 
penguins [1:5, "year" ]

# rown and column index (multiple columns)
# data frame as a result
question<- penguins[1, 1:5]

# subset of the data frame, first 5 rows
penguins[1:5, ]

# subset of the Chinstrap penguins
penguinsSub <- penguins[ which(penguins$species == "Chinstrap") , ]
mean(penguinsSub$body_mass_g, na.rm=TRUE)

# Gentoo penguins
penguinsSub <- penguins[ which(penguins$species == "Gentoo") , ]
mean(penguinsSub$body_mass_g, na.rm=TRUE)

# Adelie penguins
penguinsSub <- penguins[ which(penguins$species == "Adelie") , ]
mean(penguinsSub$body_mass_g, na.rm=TRUE)

# example 

# 
kinds <-  unique(penguins$species)


for(i in 1:length(kinds) ){
    penguinsSub <- penguins[ which(penguins$species == kinds[i]) , ]
    val <- mean(penguinsSub$body_mass_g, na.rm=TRUE)
    message(paste0(kinds[i],": ", val ))
}









