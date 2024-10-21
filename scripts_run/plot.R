library(RevGadgets)
library(ggplot2)

ntaxa <- c(20, 50, 100, 200)
ntaxa <- c(100)

for(itaxa in ntaxa){
  # read the posterior and prior output
  simple_posterior <- readTrace(paste0("output/output_",itaxa,"/",itaxa,"_ERM.log"))[[1]]

  
  plot <- plotTrace(list(simple_posterior), vars=c("mu"))
  plot[[1]]
  ggsave(paste0("output/output_", itaxa,"/trace_mu_",itaxa,".pdf"), plot[[1]], width = 11, height = 9)

}

itaxa = 100
  #simple_BM_prior     <- readTrace("output/simple_BM_prior.log")[[1]]
  
  # combine the samples into one data frame
  #simple_BM_posterior$sigma2_prior <- simple_BM_prior$sigma2
  
  # plot the prior vs the posterior
  
  plot <- plotTrace(list(simple_posterior), vars=c("mu"))
  plot[[1]]
  ggsave(paste0("output/output_", itaxa,"/trace_mu_",itaxa,".pdf"), plot[[1]], width = 11, height = 9)

  
  
  
  simple_posterior <- readTrace(paste0("output/output_",itaxa,"/",itaxa,"_ERM.log"))[[1]]
  
  
  plot <- plotTrace(list(simple_posterior), vars=c("mu"))
  plot[[1]]