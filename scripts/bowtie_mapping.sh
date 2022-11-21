#!/bin/bash -l

#SBATCH

#SBATCH --job-name=bowtie2_mapping
#SBATCH --time=72:00:00
#SBATCH --nodes=1
#SBATCH --tasks-per-node=1
#SBATCH --cpus-per-task=8
#SBATCH --partition=defq
#SBATCH --array=1-15

#load variables
#choose the fastq files to work on
TRIMMED=/home/yzhan231/scratch4-sprehei1/yuezhang/RockCreek/yzhan231_rock_creek_shotgun_p1_analysis/yzhan231_rock_creek_shotgun_p1/PreheimLab_metagenomics_SOP/analysis/Trimmed_FASTQ/assembled/SW_28/separated_trimmed_files
BOWTIE=/home/yzhan231/scratch4-sprehei1/yuezhang/RockCreek/yzhan231_rock_creek_shotgun_p1_analysis/yzhan231_rock_creek_shotgun_p1/PreheimLab_metagenomics_SOP/analysis/BOWTIE
INDEX=/home/yzhan231/scratch4-sprehei1/yuezhang/RockCreek/yzhan231_rock_creek_shotgun_p1_analysis/yzhan231_rock_creek_shotgun_p1/PreheimLab_metagenomics_SOP/analysis/BOWTIE/contigs_index/contigs_index

FWD_FQ=`awk "NR==$SLURM_ARRAY_TASK_ID" $TRIMMED/forward_PE.txt`
REV_FQ=`awk "NR==$SLURM_ARRAY_TASK_ID" $TRIMMED/reverse_PE.txt`
SE1=`awk "NR==$SLURM_ARRAY_TASK_ID" $TRIMMED/forward_SE.txt`
SE2=`awk "NR==$SLURM_ARRAY_TASK_ID" $TRIMMED/reverse_SE.txt`
#ls 2019*_1.fastq | awk '{sub(/_.*/,""); print}'>sample.txt
OUTPUT=`awk "NR==$SLURM_ARRAY_TASK_ID" $TRIMMED/sample.txt`

module load bowtie2/2.4.1
echo "Startin bowtie2-mapping"
date

bowtie2 -x $INDEX -1 $TRIMMED/$FWD_FQ -2 $TRIMMED/$REV_FQ -U $TRIMMED/$SE1,$TRIMMED/$SE2 -S $BOWTIE/${OUTPUT}.bowtie2.sam

echo "Completed bowtie2-build"
date
