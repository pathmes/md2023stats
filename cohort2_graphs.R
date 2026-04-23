library(DiagrammeR)

# Create a node data frame
nodes_1 <-
  create_node_df(
    n = 3,
    type = "upper",
    label = c("E", "C", "O"),
    style = "filled",
    color = "aqua",
    shape = c("circle"),
    data = c(3.5),
    x = c(.5, 0, 2),
    y = c(0, 1, 0))

# Inspect the `nodes_1` NDF
# nodes_1


# Create an edge data frame

edges_1 <-
  create_edge_df(
    from = c(1, 1, 2, 2),
    to = c(3, 2, 1, 3),
    rel = "requires",
    color = c("blue", "black", "black", "black"))

# edges_1
n_graph <-
  create_graph(nodes_1, edges_1) 

# render_graph(n_graph)


# Table 6-6
F_Edu <- c("9p", "9p", "lt9", "lt9")
M_Smoke <- c("No", "Yes", "No", "Yes")
L_Births <- c(5967, 3833, 1967, 767)
NMR <- c(14.9,17.1, 16.4, 46.1)

t66 <- data.frame(cbind(F_Edu, M_Smoke, L_Births, NMR))


# Table 6-7
PNMR <- c(6.1, 11.1, 12.3, 19.8)

t67 <- data.frame(cbind(F_Edu, M_Smoke, L_Births, PNMR))
