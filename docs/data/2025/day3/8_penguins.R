#############################################################
# Computers in geoscience course - Day 3
# Try and read in the penguins.tab file with read.delim()!

# On Windows

# 1. get the windows-style path to the directory
# and add the file name
# C:\Users\Adam\Desktop\computers_course\data\penguins.tab

# 2. Add the quotes around to indicate that this a character
# "C:\Users\Adam\Desktop\computers_course\data\penguins.tab"

# 3. R is not the windows-style paths natively, you have to use /
"C:/Users/Adam/Desktop/computers_course/data/penguins.tab"

# 4. put in read.delim
penguins <- read.delim("C:/Users/Adam/Desktop/computers_course/data/penguins.tab")
str(penguins)

# How many species are there in the dataset?
length(unique(penguins$species))

# How many islands are there in the dataset?
length(unique(penguins$island))

# How many records/row are there per species? (one utility function!)
table(penguins$species)

# shortest, longest, and the mean bill length
min(penguins$bill_length_mm, na.rm=TRUE)
max(penguins$bill_length_mm, na.rm=TRUE)
mean(penguins$bill_length_mm, na.rm=TRUE)
sd(penguins$bill_length_mm, na.rm=TRUE)
median(penguins$bill_length_mm, na.rm=TRUE)

sort(penguins$bill_length_mm)

##########
# Plotting -> help
?plot

# Scatterplot
plot(x=1:10, y=seq(from=-6, to=30, length.out=10))

plot(x=penguins$bill_length_mm, y=penguins$bill_depth_mm)

# title 
plot(x=penguins$bill_length_mm, y=penguins$bill_depth_mm,
     main="The penguin bills", pch=16, col="#54ac7b9c", cex=0.5)


# pch: point character
# col: color of symbols: 
#	 integer code, character name
#	 colors()
#	 HTML, hexadecimal, rgba
# cex: size

plot(x=penguins$bill_length_mm, y=penguins$bill_depth_mm,
     main="The penguin bills", pch=16, col="#54ac7b9c", cex=0.5,
    xlim=c(30, 45), ylim=c(15,22))

plot(x=penguins$bill_length_mm, y=penguins$bill_depth_mm,
     main="The penguin bills", pch=16, col="#54ac7b9c", cex=0.5,
     ylim=c(12,23), xlab="Bill length (mm)", ylab="Bill depth (mm)")
