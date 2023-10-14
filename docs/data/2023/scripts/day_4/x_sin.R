# Script to plot the sine curve

# integer series
# x <- -20:20
x <- seq(from=-20, to=20, by=0.1)

# sin(x)
y <- sin(x)

# plot - high level
plot(x,y)

# draw lines on top - low level
lines(x,y, lwd=10)

# help
?sin
