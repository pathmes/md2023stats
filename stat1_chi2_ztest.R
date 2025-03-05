suppressMessages(library(tidyverse))
yop <- tribble(
~status, ~charcoal, ~ placebo,
"Dead", 5,           16,
"Alive", 196,        184,
"Total", 201,        200
)
yop



p1 <- yop[1,2]/yop[3,2]
q1 <- 1-p1
p2 <- yop[1,3]/yop[3,3]
q2 <- 1-p2
p <- (yop[1,2]+yop[1,3])/(yop[3,2]+yop[3,3])
q <- 1-p
n1 <- yop[3,2]
n2 <- yop[3,3]

## Chi squared test with continuity correction
chisq.test(yop[1:2, 2:3], correct = TRUE)

## Chi squared test without continuity correction
chisq.test(yop[1:2, 2:3], correct = FALSE)

se1 <- sqrt((p1*q1/n1)+(p2*q2/n2))
se1
z <- (p2-p1)/se1
z
z^2
se2 <- sqrt(p*q*(1/n1 + 1/n2))
se2
z2 <- (p2-p1)/se2
z2
z2^2


