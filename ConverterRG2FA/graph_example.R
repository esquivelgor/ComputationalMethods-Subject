library(igraph)
library(stringr)

## Input user example
string <- "S -> aA B -> a S -> bB A -> bB A -> c B -> c"

## Extract the edges
edgesCompleted <- str_extract_all(string, "[A-Z] -> [a-z][A-Z]")[[1]]
edgesNotCompleted  <- str_extract_all(string, "([A-Z] -> [a-z][^A-Z])|[A-Z] -> [a-z](?!.*[A-Z])")[[1]]
edgesCompletedZ <- str_replace_all(edgesNotCompleted, "(?<=[a-z])(?!$)|(?<=[a-z])$", "Z")

stringUpdated <- append(edgesCompleted, edgesCompletedZ)

nodes <- unlist(str_extract_all(stringUpdated, "[A-Z]"))
edge.labels <- unlist(str_extract_all(string, "[a-z]"))
g <- graph(nodes, directed = TRUE)
node.types <- c(1, rep(2, length(edge.labels)-2), length(edge.labels)-1)
mapping.colors <- c("green","white", "red", "blue")
node.colors <- mapping.colors[node.types]

curves <- curve_multiple(g, start = 0.8)
set.seed(12)
plot(g, edge.arrow.size=.3, vertex.label.cex=0.8, vertex.size=35,vertex.frame.color="gray", vertex.label.color="black",  edge.label = edge.labels, vertex.color = node.colors, edge.curved=curves )

?curve_multiple


# Clear
rm(list = ls())

