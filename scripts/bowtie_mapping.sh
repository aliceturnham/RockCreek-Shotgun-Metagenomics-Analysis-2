#!/bin/bash -l

#SBATCH

#SBATCH --job-name=bowtie2_mapping
#SBATCH --time=72:00:00
#SBATCH --nodes=1
#SBATCH --tasks-per-node=1
#SBATCH --cpus-per-task=8
#SBATCH --partition=defq
#SBATCH --array=1-22

#load variables
#choose the fastq files to work on
TRIMMED=/scratch4/sprehei1/AliceTurnham/RockCreek-Shotgun-Metagenomics-Analysis-2-ATEdits/analysis/Trimmed_FASTQ/assembled/SW_28/separated_trimmedfiles
BOWTIE=/scratch4/sprehei1/AliceTurnham/RockCreek-Shotgun-Metagenomics-Analysis-2-ATEdits/analysis/BOWTIE
INDEX=/scratch4/sprehei1/AliceTurnham/RockCreek-Shotgun-Metagenomics-Analysis-2-ATEdits/analysis/BOWTIE/contigs_index/contigs_index


FWD_FQ=`awk "NR==$SLURM_ARRAY_TASK_ID" $TRIMMED/forward_PE.txt`
REV_FQ=`awk "NR==$SLURM_ARRAY_TASK_ID" $TRIMMED/reverse_PE.txt`
SE1=`awk "NR==$SLURM_ARRAY_TASK_ID" $TRIMMED/forward_SE.txt`
SE2= `awk "NR==$SLURM_ARRAY_TASK_ID" $TRIMMED/reverse_SE.txt`


OUTPUT=`awk "NR==$SLURM_ARRAY_TASK_ID" $TRIMMED/samples.txt`



module load bowtie2/2.4.1
echo "Starting bowtie2-mapping"
date

bowtie2 -x $INDEX -1 $TRIMMED/$FWD_FQ -2 $TRIMMED/$REV_FQ -U $TRIMMED/$SE1,$TRIMMED/$SE2 -S $BOWTIE/${OUTPUT}.bowtie2.sam

echo "Completed bowtie2-build"
date
