rbinom(n = 10, size = 1, prob = .5)

for (i in seq(.3, .7, 0.05)) {
  print(rbinom(n = 10, size = 1, prob = i))
}

h <- NULL

a <- seq(.1, .85, 0.05)


for (i in 1:length(a)) {
  b <- rbinom(n = 10, size = 1, prob = a[i])
  h <- c(h, b)
}
id <- 1:160
cid <- ceiling(id/10)
