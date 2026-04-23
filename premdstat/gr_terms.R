library(tidyverse)
library(flextable)

gr_terms <- tribble(
  ~ Term, ~ Explanation_Representation,
  "Nodes/ vertices", "Points on the graph - Variables",
  "Arc/ edge", "Arrow",
  "Adjacent nodes", "Direct connection by an arrow", 
  "Cause to effect", "Single headed arrow", 
  "Path", "Unbroken route that can be traced along or against arrows",
  "Directed (or causal) path", "Route that can be traced along arrows",
  "Backdoor path", "Route that can be traced against arrows",
  "Blocked path", "Route where two arrowheads meet",
  "Ancestor & Descendant", "Directed path exists between the two",
  "Parent & Child", "Connected by a single arrow"
)

# gr_terms %>% flextable() %>% autofit() %>% print()


dag_fig1 <- tribble(
  ~ Node, ~ Discription,
  "A", "Air pollution level",
  "B", "Sex",
  "C", "Bronchial Reactivity",
  "D", "Asthma",
  "E", "Antihistamine treatment"
  )

# dag_fig1 %>% flextable() %>% autofit() %>% print()
