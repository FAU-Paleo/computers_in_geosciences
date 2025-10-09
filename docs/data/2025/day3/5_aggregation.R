# Computers in geoscience course - Day 3
# Aggregating information from vectors

# aggreagation fucntions
favorite <- c(7,3,7,9,8,3,9,6,3,7,4,2,1,8,4,5)

# how many of them are greater than 5
length(favorite[which(favorite > 5)])

# Sum of a logical vector
sum(favorite > 5)

# the sum of the favorite numbers
sum(favorite)

# the minimum of the favorite vector - look up function on the web!
min(favorite) 

# the maximum of the favorite vector - look up function on the web!
max(favorite)

# average (mean) of the favorite vector -look up function on the web!
mean(favorite)

# when the mean function does
sum(favorite)/length(favorite)


# with Adam's value (missing!)
favorite2 <- c(7,3,7,9,8,3,9,6,3,7,4,2,1,8,4,5,NA)

# all of these are NA by default
min(favorite2)
sum(favorite2)
mean(favorite2)

# Parameter to remove the missing values
mean(favorite2, na.rm=TRUE)

# suboptimal solution - hard-coded values
# favorite2[1:16]

# no hard-coded numbers
# gives back the missing values- we need to invert this
favorite2[is.na(favorite2)]

!is.na(favorite2)

# much better solution
favorite2[!is.na(favorite2)]

# Works with this too!
favoriteDummy <- c(7,3,7,NA, 9,8,NA, NA,3,9,6,3,7,4,NA, 2,1, NA ,8,4,5,NA)
favoriteDummy[!is.na(favoriteDummy)]
