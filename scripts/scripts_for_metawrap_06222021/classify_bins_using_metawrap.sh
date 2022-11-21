#!/bin/sh
#SBATCH
#SBATCH --job-name=classify_metawrap
#SBATCH --time=6:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=48
#SBATCH --partition=lrgmem

ml anaconda
conda activate metawrap-env
#make sure mkdir reassembly

IN=../../metawrap_06222021/REASSEMBLY/reassembled_bins
OUT=../../metawrap_06222021/BIN_CLASSIFICATION
metawrap classify_bins -b $IN -o $OUT -t 48

