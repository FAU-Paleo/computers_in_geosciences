# Population of germany, data from: 
# https://en.wikipedia.org/wiki/Demographics_of_Germany

# year
year <- c(
  1500,
  1550, 
  1600,
  1650,
  1700,
  1750,
  1800,
  1850,
  1870,
  1900,
  1910,
  1920,
  1930,
  1940,
  1950,
  1960,
  1970,
  1980,
  1990,
  2000,
  2010,
  2020
)

# population
population <- c(
  9200000,
  12900000,
  16200000,
  10000000,
  14100000,
  18300000,
  22700000,
  35303000,
  40804000,
  56046000,
  64568000,
  61974000,
  64294000,
  69838000,
  69346000,
  73147000,
  78069000,
  78397000,
  79753227,
  82259540,
  81751602,
  83155031
)

# plotting the two vectors: an empty canvas
plot(year,population, type="n")

# visualizing the data
lines(year,population)
points(year, population)
