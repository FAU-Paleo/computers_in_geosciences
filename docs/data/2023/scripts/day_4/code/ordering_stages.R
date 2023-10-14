# Ordering the tables

# manually set to semicolon separators
stages <- read.csv("C:/Users/Adam/Desktop/2023-2024winter/computers/day_1/stages.csv", 
                   sep=";")

# sorting duration
sort(stages$dur)


# alphabetic of stageas
sort(stages$stage) # doing it in 1 steps
stages$stage[order(stages$stage)] # doing 2 steps

# the entire stages table rearrange alphabetically 
ordered_stages <- stages[order(stages$stage), ]


# stages in order of durations
ordered_stages_by_durations <- stages[order(stages$dur), ]
