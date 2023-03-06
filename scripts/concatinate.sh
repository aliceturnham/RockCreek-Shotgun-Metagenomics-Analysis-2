#!/bin/bash

#SBATCH

#SBATCH --job-name=concat_trimmed_files
#SBATCH --time=5:00:00
#SBATCH --nodes=1


SEPARATED=/scratch4/sprehei1/AliceTurnham/RockCreek-Shotgun-Metagenomics-Analysis-2-ATEdits/analysis/Trimmed_FASTQ/assembled/SW_28/separated_trimmedfiles
MERGED=/scratch4/sprehei1/AliceTurnham/RockCreek-Shotgun-Metagenomics-Analysis-2-ATEdits/analysis/Trimmed_FASTQ/assembled/SW_28/



#Concatinate all pair-end R1 trimmed reads
cat $SEPARATED/*_1.fastq > $MERGED/all_1.fastq

#concatinate all pair-end R2 trimmed reads
cat $SEPARATED/*_2.fastq > $MERGED/all_2.fastq

#concatinate all single-end trimmed reads (concatinate R1 and R2 together)
cat $SEPARATED/*_s*.fastq > $MERGED/all_se.fastq
