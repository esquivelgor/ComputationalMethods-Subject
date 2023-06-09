library(igraph)
library(stringr)
# Input user example
string <- "(S,B,a)
(S,A,b)
(S,E,c)
(B,A,b)
(B,C.,-)
(B,C.,a)
(A,B,a)
(A,C,b)
(A,E,c)
(C,B,c)
(C,B,b)
(C,A,a)

"
string2 <- "(S,B,a)
(S,A,b)
(B,A,b)
(B,C.,-)"

# Formatted data
string <- str_replace_all(string, "(\n)|([:space:]*\n)", " ")

## Extract edges
edgesCompleted <- str_extract_all(string, "\\([A-Z],[A-Z],[a-z]\\)")[[1]]
edgesFinal <- str_extract_all(string, "\\([A-Z],[A-Z]\\.,([a-z]|.)\\)")[[1]]
string <- append(edgesCompleted, edgesFinal)

## Extract nodes
coupleNodesCompleted <- unlist(str_extract_all(edgesCompleted, "[A-Z]"))
coupleNodesFinal <- unlist(str_extract_all(edgesFinal, "(?!S)[A-Z]"))
nodesFinal <- gsub("\\.","",unique(unlist(str_extract_all(edgesFinal, "(?!S)[A-Z]\\."))))
nodes <- append(coupleNodesCompleted, coupleNodesFinal)
uniqueNodes <- unique(nodes)

## Number of nodes
nNodesCompleted <- length(unique(unlist(str_extract_all(edgesCompleted, "(?!S)[A-Z]"))))
nNodesFinal <- length(gsub("\\.","",unique(unlist(str_extract_all(edgesFinal, "(?!S)[A-Z]\\.")))))

## Alphabet
uniqueAlphabet <- unique(unlist(str_extract_all(string, "[a-z]")))
nAlphabet <- length(uniqueAlphabet)

nodeTypes <- c()
for(node in uniqueNodes){
    if(node == "S"){
      nAlphabetCheck = 0
      for(alphabet in uniqueAlphabet){
        if((sum(grepl(paste("S,[A-Z].?,[", alphabet, "]", sep = ""), string))) == TRUE){
          nAlphabetCheck = nAlphabetCheck + 1  
        } 
      }
      if(nAlphabetCheck == nAlphabet){
        nodeTypes <- nodeTypes %>% append(1)
      } else {
          nodeTypes <- nodeTypes %>% append(4)  
        } 
      
    } else if (node %in% nodesFinal){
      nAlphabetCheck = 0
      for(alphabet in uniqueAlphabet){
        if(sum(grepl(paste(node, ",[A-Z].?,[", alphabet, "]", sep = ""), string)) == TRUE){
          nAlphabetCheck = nAlphabetCheck + 1
        }
      }
      if(nAlphabetCheck == nAlphabet){
        nodeTypes <- nodeTypes %>% append(3)  
      } else {  
        nodeTypes <- nodeTypes %>% append(4)
      }
    }
    else {
      nAlphabetCheck = 0
      for(alphabet in uniqueAlphabet){
        if(sum(grepl(paste(node, ",[A-Z].?,[", alphabet, "]", sep = ""), string)) == TRUE){
          nAlphabetCheck = nAlphabetCheck + 1
        }
      }
      if(nAlphabetCheck == nAlphabet){
        nodeTypes <- nodeTypes %>% append(2) 
      } else {  
        nodeTypes <- nodeTypes %>% append(4)
      }
    }
}

node.types <- nodeTypes
g <- graph(nodes, directed = TRUE)

edge.labels <- gsub("-","λ",unlist(str_extract_all(string, "[a-z]|-")))


mapping.colors <- c("green","white", "red", "yellow")
node.colors <- mapping.colors[node.types]

curves <- curve_multiple(g, start = 0.8)
set.seed(10)
plot(g, edge.arrow.size=.3, vertex.label.cex=0.8, vertex.size=35,vertex.frame.color="gray", vertex.label.color="black",  edge.label = edge.labels, vertex.color = node.colors, edge.curved=curves )

