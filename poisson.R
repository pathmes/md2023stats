library(tidyverse)

anc <- tribble(
  ~Parity, ~Freq, 
  "0", 59,
  "1", 44,
  "2", 14,
  "3", 3,
  "4", 4,
  "5", 1,
  "Total", 125
)

ancn <- tibble(anc[1:6, ])
ggplot(ancn, aes(x = Parity, y = Freq)) + geom_bar(stat = "identity", width = .5)

ancn$Parity <- as.integer(ancn$Parity)
ancl <- ancn %>% slice(rep(1:nrow(ancn), Freq)) %>% select(-Freq)

mean(ancl$Parity)
sd(ancl$Parity)

anc$Parity[7] <- ">5"
anc$Freq[7] <- 0


ancn$expp <- dpois(ancn$Parity, 0.816)
ancn$expf <- dpois(ancn$Parity, 0.816) * 125
ancn$chi <- (ancn$Freq - ancn$expf)^2/ ancn$expf

sum(ancn$chi)
pchisq(14.99, 5)
