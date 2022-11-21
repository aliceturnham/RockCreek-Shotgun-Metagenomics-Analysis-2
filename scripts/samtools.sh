#!/bin/bash -l

#SBATCH

#SBATCH --job-name=samtools
#SBATCH --time=72:00:00
#SBATCH --nodes=1
#SBATCH --tasks-per-node=1
#SBATCH --cpus-per-task=8
#SBATCH --partition=defq

#load variables
#choose the fastq files to work on
ALIGNMENTS=/home/yzhan231/scratch4-sprehei1/yuezhang/RockCreek/yzhan231_rock_creek_shotgun_p1_analysis/yzhan231_rock_creek_shotgun_p1/PreheimLab_metagenomics_SOP/analysis/BOWTIE/alignment

ml samtools/1.10

date
echo 'start samtools view and sort functions'

for SAMFILE in $ALIGNMENTS/*.sam; do
	samtools view -bS $SAMFILE > ${SAMFILE%.*}.bam
	echo '$SAMFILE is transformed to bam'
	samtools sort ${SAMFILE%.*}.bam -o ${SAMFILE%.*}.sorted.bam
	echo '$SAMFILE bam is sorted'
done
date
