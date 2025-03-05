# First set up the variable identifying sex
# The rep() function repeats the given element the required number of times:
sex <- c(rep("m", times =5000), rep("f", times=15000))

# Now make the numeric variable with the specified properties
# ht - height
ht <- c(rnorm(n=5000, mean=170, sd=5), rnorm(n=15000, mean=160, sd=5))

# Now bind the two variables together in a data frame
dfsim <- data.frame(sex, ht)


for (i in 1:10) {
print(round(mean(sample(dfsim$ht, 100)), 1))
}

for (i in 1:10) {
print(round(mean(c(sample(dfsim$ht[dfsim$sex == "m"], 25), 
                   sample(dfsim$ht[dfsim$sex == "f"], 75))), 1))
}

csm <- NULL
ssm <- NULL
for (i in 1:1000) {
  csm[i] <- round(mean(sample(dfsim$ht, 100)), 1)
  ssm[i] <- round(mean(c(sample(dfsim$ht[dfsim$sex == "m"], 25), 
                         sample(dfsim$ht[dfsim$sex == "f"], 75))), 1)
}

sd(csm)
sd(ssm)

## as a function

simstrat <- function(i) {
  sex <- c(rep("m", times =5000), rep("f", times=15000))
  ht <- c(rnorm(n=5000, mean=170, sd=5), 
          rnorm(n=15000, mean=160, sd=5))
  
  dfsim <- data.frame(sex, ht)
  
  csm <- NULL
  ssm <- NULL
  for (i in 1:1000) {
    csm[i] <- round(mean(sample(dfsim$ht, 100)), 1)
    ssm[i] <- round(mean(c(sample(dfsim$ht[dfsim$sex == "m"], 25), 
                           sample(dfsim$ht[dfsim$sex == "f"], 75))), 1)
  }
  print(paste0("Unstratified sampling - Mean_100x1000  - ", 
               signif(mean(csm), 4)))
  print(paste0("Unstratified sampling - SEM - ", 
               signif(sd(csm), 2)))
  print(paste0("Statified sampling - Mean_100x1000 - ", 
               signif(mean(ssm), 4)))
  print(paste0("Statified sampling - SEM - ", 
               signif(sd(ssm), 2)))
}
