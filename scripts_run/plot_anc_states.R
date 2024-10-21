################################################################################
#
# Plot ancestral state estimates inferred using the equal rates models of character evolution.
#
setwd("/Users/oerp1/Documents/Codigos/revbayestest/revbayes_morph_ase")
# authors: Sebastian Hoehna, Will Freyman
#
################################################################################

# if you do not have RevGadgets installed, then follow these instructions
#install.packages("devtools")
#library(devtools)
#install_github("GuangchuangYu/ggtree")
#install_github("revbayes/RevGadgets")

library(RevGadgets)
library(ggplot2)

CHARACTER <- "diet"
NUM_STATES <- 6

STATE_LABELS <- c("0" = "0", "1" = "1", "2"="2", "3"="3", "4"="4", "5"="5")

tree_file <- paste0("output/",CHARACTER,"_ase_ERM.tree")

# process the ancestral states
ase <- processAncStates(tree_file,
                        # Specify state labels.
                        # These numbers correspond to
                        # your input data file.
                        state_labels = STATE_LABELS)

# produce the plot object, showing MAP states at nodes.
# color corresponds to state, size to the state's posterior probability
p <- plotAncStatesMAP(t = ase,
                      #tree_layout = "rect",
                      tip_labels_size = 1) +
     # modify legend location using ggplot2
     theme(legend.position = c(0.92,0.81))

#ggsave(paste0("Primates_",CHARACTER,"_ASE_ERM_MAP.pdf"), p, width = 11, height = 9)




p <- plotAncStatesPie(t = ase,
                      #tree_layout = "rect",
                      tip_labels_size = 1) +
     # modify legend location using ggplot2
     theme(legend.position = c(0.92,0.81))

p

#ggsave(paste0("Primates_",CHARACTER,"_ASE_ERM_Pie.pdf"), p, width = 11, height = 9)
