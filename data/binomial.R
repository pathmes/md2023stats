suppressMessages(library(tidyverse))
t1 <- tribble(
  ~heads, ~freq,
  0, 1,
  1, 1
)
t1$rf <- t1$freq/sum(t1$freq)

t2 <- tribble(
  ~heads, ~freq,
  0, 1,
  1, 2,
  2, 1
)
t2$rf <- t2$freq/sum(t2$freq)



t3 <- tribble(
  ~heads, ~freq,
  0, 1,
  1, 3,
  2, 3,
  3, 1
)
t3$rf <- t3$freq/sum(t3$freq)

t4 <- tribble(
  ~heads, ~freq,
  0, 1,
  1, 4,
  2, 6,
  3, 4,
  4, 1
)

t4$rf <- t4$freq/sum(t4$freq)

t10 <- tribble(
  ~heads, ~freq,
  0, 1,
  1, 10,
  2, 45,
  3, 120,
  4, 210,
  5, 252,
  6, 210,
  7, 120,
  8, 45,
  9, 10,
  10, 1
)

t10$rf <- t10$freq/sum(t10$freq)



p1 <- ggplot(data = t1, mapping = aes(x = as.character(heads), y = rf))
p11 <- p1 + geom_bar(stat = "identity", width = 0.1) +
  labs(x = "Number of Heads", y = "Probability")

p2 <- ggplot(data = t2, mapping = aes(x = as.character(heads), y = rf))
p20 <- p2 + geom_bar(stat = "identity", width = 0.1) +
  labs(x = "Number of Heads", y = "Probability")

p3 <- ggplot(data = t3, mapping = aes(x = as.character(heads), y = rf))
p30 <- p3 + geom_bar(stat = "identity", width = 0.1) +
  labs(x = "Number of Heads", y = "Probability")

p4 <- ggplot(data = t4, mapping = aes(x = as.character(heads), y = rf))
p40 <- p4 + geom_bar(stat = "identity", width = 0.1) +
  labs(x = "Number of Heads", y = "Probability")

p10 <- ggplot(data = t10, mapping = aes(x = heads, y = rf))
p100 <- p10 + geom_bar(stat = "identity", width = 0.1) +
  labs(x = "Number of Heads", y = "Probability")
  
# scale_y_continuous(name = "Probability")
# 
# p1 + geom_bar(stat = "identity", width = 0.1) +
# scale_y_discrete(name="Frequency", 
#                  breaks = c(0,1),
#                  labels = c(0,1),
#                  limits = factor(0,1))
# 
# scale_y_discrete(name, breaks, labels, limits)


##########################
a <- c(1, 0)
set.seed(2172022)
sample(a, 500, replace = TRUE)
a1t <- as.data.frame(sample(a, 500, replace = TRUE))
colnames(a1t)[1]  <- "heads"
a1t$try <- 1
a1t$cs_heads <- cumsum(a1t$heads)
a1t$cs_tries <- cumsum(a1t$try)
a1t$prop_heads <- a1t$cs_heads/a1t$cs_tries
ggplot(data = a1t, mapping = aes(x = cs_tries, y = prop_heads)) + geom_line() + geom_point()
