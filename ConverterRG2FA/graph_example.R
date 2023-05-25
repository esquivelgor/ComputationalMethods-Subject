library(igraph)
library(stringr)

## Input user example
string <- "S -> aA
B -> a
S -> bB  
A -> bB
A -> c
B -> c"

# Formatted data
string <- str_replace_all(string, "(\n)|([:space:]*\n)", " ")

## Extract the edges
edgesCompleted <- str_extract_all(string, "[A-Z] -> [a-z][A-Z]")[[1]]
edgesFinal  <- str_extract_all(string, "([A-Z] -> [a-z][^A-Z])|[A-Z] -> [a-z](?!.*[A-Z])")[[1]]
edgesFinalZ <- str_replace_all(edgesFinal, "(?<=[a-z])(?!$)|(?<=[a-z])$", "Z")
stringUpdated <- append(edgesCompleted, edgesFinalZ)

nodes <- unlist(str_extract_all(stringUpdated, "[A-Z]"))
node.types <- c(1, rep(2, length(unique(nodes))-2), 3)
g <- graph(nodes, directed = TRUE)

edge.labels <- unlist(str_extract_all(stringUpdated, "[a-z]"))

mapping.colors <- c("green","white", "red")
node.colors <- mapping.colors[node.types]

curves <- curve_multiple(g, start = 0.8)
set.seed(12)
plot(g, edge.arrow.size=.7, vertex.label.cex=0.8, vertex.size=35,vertex.frame.color="gray", vertex.label.color="black",  edge.label = edge.labels, vertex.color = node.colors, edge.curved=curves )

# Clear
rm(list = ls())
