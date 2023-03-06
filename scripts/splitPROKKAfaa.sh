#!/bin/bash -l

#SBATCH

#SBATCH --job-name=split_fa
#SBATCH --time=5:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=8
#SBATCH --mem-per-cpu=4GB
#SBATCH --partition=defq

INPUT=/scratch4/sprehei1/AliceTurnham/RockCreek-Shotgun-Metagenomics-Analysis-2-ATEdits/analysis/PROKKA_on_contigs/*.faa


awk 'BEGIN {n_seq=0;} /^>/ {if(n_seq%500000==0){file=sprintf("myseq%d.faa",n_seq);} print >> file; n_seq++; next;} { print >> file; }' < $INPUT







