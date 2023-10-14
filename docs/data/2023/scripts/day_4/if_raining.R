
# If: shall we a bring a jacket
T <- 0

# if T is above 15°C bring a jacket!
if(T < 15){
  message("Bring a jacket!")
}else{
  message("Don't bring a jacket!")
}

############################
# Example 2

# If: shall we a bring a jacket
T <- 20
raining <- FALSE

# if T is above 15°C bring a jacket!
# if it is raining then you must bring a jacket
if(T < 15 | raining){
  message("Bring a jacket!")
}else{
  message("Don't bring a jacket!")
}




# example for logical operations
TRUE | FALSE

