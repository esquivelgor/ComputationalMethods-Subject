library(igraph)
library(stringr)
# Input user example
string <- "(S,B,a)
(S,A,b)
(B,A,b)
(B,C.,-)"
string2 <- "(S,B,a)
(S,A,b)
(B,A,b)
(B,Z.,-)
(A,Z.,-)
(E,A,a)
(D,A,a)
(B,C.,-)"

# Formatted data
string <- str_replace_all(string, "(\n)|([:space:]*\n)", " ")

## Extract edges
edgesCompleted <- str_extract_all(string, "\\([A-Z],[A-Z],[a-z]\\)")[[1]]
edgesFinal <- str_extract_all(string, "\\([A-Z],[A-Z]\\.,([a-z]|.)\\)")[[1]]
stringUpdated <- append(edgesCompleted, edgesFinal)

nodesCompleted <- unlist(str_extract_all(edgesCompleted, "[A-Z]"))
nodesFinal <- unlist(str_extract_all(edgesFinal, "[A-Z]"))
nodes <- append(nodesCompleted, nodesFinal)

nNodesCompleted <- length(unique(unlist(str_extract_all(edgesCompleted, "(?!S)[A-Z]"))))
nNodesFinal <- length(unique(unlist(str_extract_all(edgesFinal, "(?!S)[A-Z]\\."))))

node.types <- c(1, rep(2, nNodesCompleted), rep(3, nNodesFinal))  
g <- graph(nodes, directed = TRUE)

edge.labels <- unlist(str_extract_all(stringUpdated, "[a-z]|-"))
mapping.colors <- c("green","yellow", "orange")
node.colors <- mapping.colors[node.types]

# Identify non-deterministic spaces
nonDeterministicSpaces <- c()
unique(str_extract_all(stringUpdated, paste0("\\(", node, ",[A-Z],[a-z|-]\\)"))[[1]])
for (node in unique(nodes)) {
  outputs <- unique(str_extract_all(stringUpdated, paste0("\\(", node, ",[A-Z]\\)"))[[1]])
  expectedOutputs <- str_extract_all(stringUpdated, paste0("\\(", node, ",[A-Z]\\.,([a-z]|.)\\)"))[[1]]
  
  if (length(outputs) != length(expectedOutputs)) {
    nonDeterministicSpaces <- c(nonDeterministicSpaces, outputs)
  }
}

curves <- curve_multiple(g, start = 0.8)
set.seed(10)
plot(g, edge.arrow.size = .7, vertex.label.cex = 0.8, vertex.size = 35, vertex.frame.color = "gray",
     vertex.label.color = "black", edge.label = edge.labels, vertex.color = node.colors,
     edge.curved = curves)

# Mark non-deterministic spaces
nonDeterministicSpaces <- unique(nonDeterministicSpaces)
for (space in nonDeterministicSpaces) {
  spaceLabel <- paste0(" ", space, " ")
  spaceColor <- "red"
  spaceSize <- 10
  textxy(spaceLabel, space, col = spaceColor, cex = spaceSize)
}

#curves <- curve_multiple(g, start = 0.8)
#set.seed(10)
#plot(g, edge.arrow.size=.3, vertex.label.cex=0.8, vertex.size=35,vertex.frame.color="gray", vertex.label.color="black",  edge.label = edge.labels, vertex.color = node.colors, edge.curved=curves )



# Clear
rm(list = ls())
