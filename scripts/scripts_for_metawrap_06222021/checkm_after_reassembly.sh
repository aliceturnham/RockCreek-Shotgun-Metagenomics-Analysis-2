#!/bin/sh
#SBATCH
#SBATCH --job-name=reassembly_metawrap
#SBATCH --time=6:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=48
#SBATCH --partition=lrgmem
ml anaconda
conda activate metawrap-env
#make sure mkdir reassembly

OUT_DIR=../../metawrap_06222021/REASSEMBLY
CLEAN_READS_1=../../metawrap_06222021/CLEAN_READS/all_1.fastq
CLEAN_READS_2=../../metawrap_06222021/CLEAN_READS/all_2.fastq
BIN=../../metawrap_06222021/BIN_REFINEMENT/metawrap_70_5_bins

metawrap checkm_from_reassemble_bins -o $OUT_DIR -1 $CLEAN_READS_1 -2 $CLEAN_READS_2 -t 48 -m 1000 -c 70 -x 5 -b $BIN

