#!/bin/zsh

ntaxa=("20" "50" "100" "200")

for itaxa in "${ntaxa[@]}"; do
  revbayes "gen_data/generate_${itaxa}taxa.Rev"
done
