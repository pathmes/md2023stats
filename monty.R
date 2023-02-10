## Simulate Monty Hall Puzzle

mhp <- function(r=5) {
  n1 <- 0
  for ( i in 1:r) {
    door <- c(1,2,3)
    choice <- sample(door,1)
    cardoor <- sample(door,1)
    if (choice == cardoor) {
      n1 <- n1 + 1
    }
  }
  cat(c("Repetitions - ", r, "\nStay - ", round(n1/r,2)))
  
  
  n2 <- 0
  door <- c(1,2,3)
  for ( i in 1:r) {
    cardoor <- sample(door,1)
    select <- sample(door,1)
    remove <- ifelse(cardoor==select, 
                     sample(setdiff(door,cardoor),1),
                     setdiff(door,c(cardoor,select)))
    reselect <- setdiff(door,c(select,remove))
    if (cardoor == reselect) {
      n2 <- n2 + 1
    }
  }
  cat(c("\nSwitch - ", round(n2/r,2), "\n_______________________"))
}
