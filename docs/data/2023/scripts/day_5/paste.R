# String concatenation

# default: with a sppace in between
paste0("word1", "word2")

# without any spaces
paste0("dir1", "dir2")

# same as: 
paste("dir1", "dir2", sep="")

# with a slash
file.path("dir1", "dir2")
paste("dir1", "dir2", sep="/")

# vectorization of concatenation
paste0("file", 1:10)
