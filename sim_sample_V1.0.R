beta2marks <- function(n, sh1, sh2) {
  a <- rbeta(n, sh1, sh2)
  r <- range(a)
  round((a- r[1])*100/(r[2] - r[1]))
}

rnorm2marks <- function(n =10020, m = 0, s = 1) {
  a <- rnorm(n, m, s)
  a <- sort(a)
  a <- a[11:10010]
  r <- range(a)
  round((a- r[1])*100/(r[2] - r[1]))
}

set.seed(231)
a <- rnorm2marks()

hist(a, 10,
     col = "lightgray",
     main = "Distribution of Marks (N = 10, 000)",
     sub = paste("Mean = ", round(mean(a),1),
                 "SD = ", round(sd(a),2)),
     xlab = "")
library(tidyverse)

# Sample size 64 & repetitions 100
set.seed(231)
r <- c()
for(i in 1:100){
  x <- sample(a, 64, replace = TRUE)
  mu <- mean(x)
  r <- c(r, mu)
  }
r64100 <- r
results <- tibble(r)

s64r100 <- results %>% 
  summarise(N = n(), Min = min(r), Max = (max(r)),
            Mean = mean(r), SD = sd(r))
s64r100

hist(results$r, 10,
     col = "lightgray",
     main = "Distribution of Sample Means (N = 100)",
     sub = paste0("Mean of sample means = ", round(mean(results$r),1),
                  ";  ",
                 "SD of sample means = ", round(sd(results$r),2),
                 ";  ",
                 "Size of samples = 64"),
     xlab = "")

# Sample size 64 & repetitions 1000
set.seed(231)
r <- c()
for(i in 1:1000){
  x <- sample(a, 64, replace = TRUE)
  mu <- mean(x)
  r <- c(r, mu)
}
r641000 <- r
results <- tibble(r)

s64r1000 <- results %>% 
  summarise(N = n(), Min = min(r), Max = (max(r)),
            Mean = mean(r), SD = sd(r))
s64r1000

hist(results$r, 10,
     col = "lightgray",
     main = "Distribution of Sample Means (N = 1000)",
     sub = paste0("Mean of sample means = ", round(mean(results$r),1),
                  ";  ",
                  "SD of sample means = ", round(sd(results$r),2),
                  ";  ",
                  "Size of samples = 64"),
     xlab = "")

# Sample size 256 & repetitions 100
set.seed(231)
r <- c()
for(i in 1:100){
  x <- sample(a, 256, replace = TRUE)
  mu <- mean(x)
  r <- c(r, mu)
}
r256100 <- r
results <- tibble(r)

s256r100 <- results %>% 
  summarise(N = n(), Min = min(r), Max = (max(r)),
            Mean = mean(r), SD = sd(r))
s256r100

hist(results$r, 10,
     col = "lightgray",
     main = "Distribution of Sample Means (N = 100)",
     sub = paste0("Mean of sample means = ", round(mean(results$r),1),
                  ";  ",
                  "SD of sample means = ", round(sd(results$r),2),
                  ";  ",
                  "Size of samples = 256"),
     xlab = "")



# Sample size 256 & repetitions 1000

set.seed(231)
r <- c()
for(i in 1:1000){
  x <- sample(a, 256, replace = TRUE)
  mu <- mean(x)
  r <- c(r, mu)
}
results <- tibble(r)

s256r1000 <- results %>% 
  summarise(N = n(), Min = min(r), Max = (max(r)),
            Mean = mean(r), SD = sd(r))
s256r1000
y <- rbind(s64r100, s64r1000)
y <- rbind(y, s256r100)
y <- rbind(y, s256r1000)
y <- tibble(y)
y

sample_size <- tibble(c(64, 64, 256, 256))
sample_size <- rename(sample_size, Ssize = 
                        "c(64, 64, 256, 256)")

z <- tibble(cbind(sample_size, y))
z



