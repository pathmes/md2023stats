library(readr)
library(tidyverse)

q1 <- read_csv("data/q0l.csv")
View(q1)


q1$Day <- as.factor(q1$Day)

# Boxplot
 
p <- ggplot(data = q1, aes(x = Day, y = Platelets))
p + geom_boxplot()

p + geom_boxplot() + 
  geom_dotplot(binaxis = 'y')

p + geom_boxplot() + 
  geom_dotplot(binaxis = 'y',stackdir = 'center')

p + geom_boxplot() + 
  geom_dotplot(binaxis = 'y',stackdir = 'center', alpha = 0.3)

# Scatterplot

p2 <- ggplot(data = q0data, aes(x = plt_d0, y = plt_d5))
p2 + geom_point()


