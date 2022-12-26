library(tidyverse)

q0data <- read_csv(here::here("data", "q0data.csv"))

q0l <- q0data[, 1:3]

q0l <- pivot_longer(
  q0l,
  cols = starts_with("plt"),
  names_to = "Day",
  values_to = "Platelets"
  )
q0l$Day <-  str_remove(q0l$Day, "plt_d")
write.csv(q0l, file = (here::here("data", "q0l.csv")), row.names = FALSE)

