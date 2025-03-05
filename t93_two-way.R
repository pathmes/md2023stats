library(tidyverse)
library(readr)
library(broom)

c2l <- read_csv("data/c2l.csv")
c2l$subject <- as.factor(c2l$subject)
c2l$treatment <- as.factor(c2l$treatment)

a1 <- aov(time~treatment, data = c2l)

summary.aov(a1)
tidy(anova(a1)) %>% 
  add_row(term = "Total", df = sum(.$df), sumsq = sum(round(.$sumsq),1) )

a2 <-  aov(time~treatment + subject, data = c2l)
summary.aov(a2)
tidy(anova(a2)) %>% 
  add_row(term = "Total", df = sum(.$df), sumsq = sum(round(.$sumsq),1) )
