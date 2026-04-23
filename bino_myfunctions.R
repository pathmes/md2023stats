
fixedss <- function(p = 10, n = 200) {
  pp <- round(p*n/100)
  a <- binom.test(pp, n)
  print(paste0("If the prevalence is ", p, "%", 
               " and the sample size is ", n, "then \\n",
               ", the 95% CI will be from ", round(a$conf.int[1]*100, 1), " to ", round(a$conf.int[2]*100, 1)))  
}

fxss <- function(p = 10, n = 200) {
  pp <- round(p*n/100)
  a <- binom.test(pp, n)
  reslist <- list(p, n, round(a$conf.int[1]*100, 1),round(a$conf.int[2]*100, 1))
  return(reslist)
}


fxssv <- function(p = 10, n = 200) {
  pp <- round(p*n/100)
  a <- binom.test(pp, n)
  return(c(prev = p,
           ssize =n,
           lci = round(a$conf.int[1]*100, 1),
           uci = round(a$conf.int[2]*100, 1)))
}


a <- for (p in 10:20){
  n <-  200
  fxssv(p, 200)
}

p <- c(10, 20, 30, 40, 50)
lapply(p, fxssv)
