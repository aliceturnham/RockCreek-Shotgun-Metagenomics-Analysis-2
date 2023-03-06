#!/bin/bash -l

#SBATCH

#SBATCH --job-name=bedtools
#SBATCH --time=72:00:00
#SBATCH --nodes=1
#SBATCH --tasks-per-node=1
#SBATCH --cpus-per-task=8
#SBATCH --partition=defq
#SBATCH --array=0-22

#load variables
SBD=/scratch4/sprehei1/AliceTurnham/RockCreek-Shotgun-Metagenomics-Analysis-2-ATEdits/analysis/BOWTIE/alignment
SBF=`awk "NR==$SLURM_ARRAY_TASK_ID" $SBD/sorted_bam.txt`

ml bedtools/2.30.0

date
echo 'start bam to bed conversion for $SBF'
bedtools bamtobed -i $SBD/$SBF > $SBD/${SBF%.*}.bed  
echo '$SBF is converted to .bed'
date
