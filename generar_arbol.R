library(phytools)
library(stringr)
## assign colors for the two states 
#colors<-setNames(c("gray","black"),0:1)
#colors

taxa <- c(20, 50, 100, 200)

for(ntaxa in taxa) {
  tree<-pbtree(n=ntaxa,scale=1)
  ape::write.tree(tree, str_interp("data/arbol_${ntaxa}.nwk"))
}

# tree <- read.tree("data/arbol_50.nwk")
# plot(tree)
a <- pbtree(n=20, scale=1, nsim=10)
a
