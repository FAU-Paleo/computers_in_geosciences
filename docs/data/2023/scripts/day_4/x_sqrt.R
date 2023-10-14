# Square root of x

x <- seq(from=-20, to=20, by=0.1)

# square roo(x)
y <- sqrt(x)

# plot - high level
plot(x,y)

# limits in x direction
plot(x,y, xlim=c(0,20))

# limits in y direction
plot(x,y, xlim=c(0,20), ylim=c(-5,5))

# missing value placeholders
NaN
NA
