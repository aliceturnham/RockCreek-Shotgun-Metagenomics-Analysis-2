#!/bin/bash -l

#SBATCH

#SBATCH --job-name=bedtools
#SBATCH --time=72:00:00
#SBATCH --nodes=1
#SBATCH --tasks-per-node=1
#SBATCH --cpus-per-task=8
#SBATCH --partition=defq
#SBATCH --array=0-15

#load variables
SBD=/home/yzhan231/scratch4-sprehei1/yuezhang/RockCreek/yzhan231_rock_creek_shotgun_p1_analysis/yzhan231_rock_creek_shotgun_p1/PreheimLab_metagenomics_SOP/analysis/BOWTIE/alignment
SBF=`awk "NR==$SLURM_ARRAY_TASK_ID" $SBD/sorted_bam.txt`

ml bedtools/2.30.0

date
echo 'start bam to bed conversion for $SORTEDBAM'
bedtools bamtobed -i $SBD/$SBF > $SBD/${SBF%.*}.bed  
echo '$SORTEDBAM is converted to .bed'
date
