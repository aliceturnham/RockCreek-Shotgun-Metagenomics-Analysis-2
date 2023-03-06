#!/bin/bash -l

#SBATCH

#SBATCH --job-name=trimm_qc
#SBATCH --time=5:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=8
#SBATCH --mem-per-cpu=4GB
#SBATCH --partition=defq

ml fastqc



UNTRIM_LIB_DIR=/scratch4/sprehei1/AliceTurnham/RockCreek-Shotgun-Metagenomics-Analysis-2-ATEdits/analysis/FastQ
TRIM_LIB_DIR=/scratch4/sprehei1/AliceTurnham/RockCreek-Shotgun-Metagenomics-Analysis-2-ATEdits/analysis/Trimmed_FASTQ/assembled/SW_28/separated_trimmedfiles
OUTPUT=/scratch4/sprehei1/AliceTurnham/RockCreek-Shotgun-Metagenomics-Analysis-2-ATEdits/analysis/fastqc


#echo 'untrimmed fastq files'
#for F in $UNTRIM_LIB_DIR/*.fastq ; do
#	fastqc -o $OUTPUT/untrimmed $F
#done

echo 'trimmed fastq files'
for F in $TRIM_LIB_DIR/*.fastq; do
	fastqc -o $OUTPUT/trimmed $F
done


