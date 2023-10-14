# About missing values and their handling

# single missing
is.na(NA)

# single non-missing
is.na(12)

# vector non-missing
is.na(1:3)

# vector of mixed
example <- c(1:3, NA)

is.na(example)
is.na(c(NA, NA))

# idiom how many non-missing values?
sum(!is.na(example))

# only non-missing values
example[which(!is.na(example))] ### prioritize this!!!
example[!is.na(example)] # is.na cannot include missing values

# keeping the logical values
example==2

# now these are different!
example[example==2]
example[which(example==2)]


