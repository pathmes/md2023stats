# Load packages
#
library(tidyverse)
library(readr)
library(broom)
library(flextable)
library(huxtable)



# Q1 data

q0l <- read_csv(here::here("data", "q0l.csv"))
t1 <- q0l %>%
  group_by(Day) %>%
  summarise(mean = mean(Platelets), sd = sd(Platelets))

huxtable(t1) %>% 
  set_bold(row = 1, col = everywhere) %>%
  set_bottom_border(row = 1, col = everywhere) %>%
  set_number_format(row = everywhere, col = 3, value = "%5.1f" ) %>%   
  set_width(0.8) %>%
  set_caption("Platelets on Day 0 and Day 5 - Summary ")


# Q1 analysis 1



q0data <- read_csv(here::here("data", "q0data.csv"))
t1 <- tidy(t.test(q0data$plt_d5, q0data$plt_d0, paired = FALSE, var.equal = TRUE)) 

t1[ , 1:6] %>%   
  huxtable() %>% 
  set_bold(row = 1, col = everywhere) %>%
  set_bottom_border(row = 1, col = everywhere) %>%
  set_width(0.8) 

t1[ , 7:9] %>% 
  huxtable() %>% 
  set_bold(row = 1, col = everywhere) %>%
  set_bottom_border(row = 1, col = everywhere) %>%
  set_width(0.8)


# Q1 analysis 2



t1 <- tidy(t.test(q0data$plt_d5, q0data$plt_d0, paired = FALSE, var.equal = FALSE))

t1[ , 1:6] %>%   
  huxtable() %>% 
  set_bold(row = 1, col = everywhere) %>%
  set_bottom_border(row = 1, col = everywhere) %>%
  set_width(0.8) 

t1[ , 7:9] %>% 
  huxtable() %>% 
  set_bold(row = 1, col = everywhere) %>%
  set_bottom_border(row = 1, col = everywhere) %>%
  set_width(0.8)




# Q1 - Summary data 2



q0l <- read_csv(here::here("data", "q0l.csv"))
t1 <- q0l %>%
  group_by(Day) %>%
  summarise(mean = mean(Platelets), sd = sd(Platelets))

huxtable(t1) %>% 
  set_bold(row = 1, col = everywhere) %>%
  set_bottom_border(row = 1, col = everywhere) %>%
  set_number_format(row = everywhere, col = 3, value = "%5.1f" ) %>%  
  set_width(0.8) 

q0w <- read_csv(here::here("data", "q0data.csv"))
t12 <- q0w %>% 
  summarise(Diff_m = mean(diff), Diff_sd = sd(diff))

huxtable(t12) %>%
  set_bold(row = 1, col = everywhere) %>%
  set_bottom_border(row = 1, col = everywhere) %>%
  set_number_format(row = 2, col = everywhere, value = "%5.1f" ) %>%
  set_width(0.8)

# Results of one sample t tests

# Mean difference = 0 (Null hypothesis)



t2 <- tidy(t.test(q0data$diff, mu = 0)) 
t2[ , 1:4] %>%   
  huxtable() %>% 
  set_bold(row = 1, col = everywhere) %>%
  set_bottom_border(row = 1, col = everywhere) %>%
  set_width(0.8) 

t2[ , 5:7] %>%
  huxtable() %>%
  set_bold(row = 1, col = everywhere) %>%
  set_bottom_border(row = 1, col = everywhere) %>%
  set_width(0.8)


# Results of paired t test



q0l <- read_csv(here::here("data", "q0l.csv"))
t4 <- tidy(t.test(q0l$Platelets~q0l$Day, paired = TRUE)) 

t4[ , 1:4] %>%   
  huxtable() %>% 
  set_bold(row = 1, col = everywhere) %>%
  set_bottom_border(row = 1, col = everywhere) %>%
  set_width(0.8) 

t4[ , 5:7] %>%
  huxtable() %>%
  set_bold(row = 1, col = everywhere) %>%
  set_bottom_border(row = 1, col = everywhere) %>%
  set_width(0.8)

# Results of paired t test



q0data <- read_csv(here::here("data", "q0data.csv"))
t4 <- tidy(t.test(Pair(plt_d5, plt_d0) ~ 1, data = q0data)) 

t4[ , 1:4] %>%   
  huxtable() %>% 
  set_bold(row = 1, col = everywhere) %>%
  set_bottom_border(row = 1, col = everywhere) %>%
  set_width(0.8) 

t4[ , 5:7] %>%
  huxtable() %>%
  set_bold(row = 1, col = everywhere) %>%
  set_bottom_border(row = 1, col = everywhere) %>%
  set_width(0.8)

# Scientific Notation

# Scientific Notation

format(t4$p.value, scientific = TRUE)

# Decimal Form

format(t4$p.value, scientific = FALSE)


# Data from a clinical trial


yop <- tribble(
  ~status, ~charcoal, ~ placebo,
  "Dead", 5,           16,
  "Alive", 196,        184,
  "Total", 201,        200
)
yop %>% 
  kableExtra::kbl()




# Chi Squared Test


tidy(chisq.test(yop[1:2, 2:3])) %>% 
  mutate_if(is.numeric, format, digits = 3) %>% 
  kableExtra::kbl() %>% 
  kableExtra::kable_styling(latex_options = c("scale_down"))  



yop %>% 
  kableExtra::kbl()

chisq.test(yop[1:2, 2:3])$expected %>% 
  kableExtra::kbl(digits = 1)  


# Comparing Two Proportions


x1 <- c(yop$placebo[1], yop$charcoal[1])
n1 <- c(yop$placebo[3], yop$charcoal[3])

t5 <- tidy(prop.test(x1, n1))

t5[ , 1:4] %>%   
  huxtable() %>% 
  set_bold(row = 1, col = everywhere) %>%
  set_bottom_border(row = 1, col = everywhere) %>%
  set_width(0.8) 


# Difference: 
round((t5$estimate1 - t5$estimate2), 3)

# 95% CI: 
round(t5$conf.low, 3) 
round(t5$conf.high, 3)

