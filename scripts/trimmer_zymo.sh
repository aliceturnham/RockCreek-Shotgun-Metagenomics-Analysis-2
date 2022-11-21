#!/bin/bash -l

#SBATCH
#SBATCH --job-name=trimmo38
#SBATCH --time=5:00:00
#SBATCH --array=1-15
#submit as an array with the number of lines of forward or reverse file

module load trimmomatic/0.38

#import run specific variables
source /home-4/yzhan231@jhu.edu/work/yuezhang/RockCreek/yzhan231_rock_creek_shotgun_p1_analysis/yzhan231_rock_creek_shotgun_p1/PreheimLab_metagenomics_SOP/config_files/trimmer_zymo.config

#choose the fastq file to work on
FWD_FQ=`awk "NR==$SLURM_ARRAY_TASK_ID" $sample`
REV_FQ=`awk "NR==$SLURM_ARRAY_TASK_ID" $sample`

#This assumes they are zipped but you provide the unzipped name
#gunzip $LIB_DIR/${FWD_FQ}_R1_001.fastq.gz
#gunzip $LIB_DIR/${REV_FQ}_R2_001.fastq.gz

trimmomatic PE -threads 8 -phred33 \
$LIB_DIR/${FWD_FQ}_1.fastq  $LIB_DIR/${REV_FQ}_2.fastq \
$ASSEM/${FWD_FQ}_1.fastq $ASSEM/${FWD_FQ}_s1.fastq $ASSEM/${REV_FQ}_2.fastq $ASSEM/${REV_FQ}_s2.fastq \
ILLUMINACLIP:$AD_LOC:2:30:10 \
LEADING:3 TRAILING:3 SLIDINGWINDOW:4:33 MINLEN:50

trimmomatic PE -threads 8 -phred33 \
$LIB_DIR/${FWD_FQ}_1.fastq  $LIB_DIR/${REV_FQ}_2.fastq \
$ASSEM1/${FWD_FQ}_1.fastq $ASSEM1/${FWD_FQ}_s1.fastq $ASSEM1/${REV_FQ}_2.fastq $ASSEM1/${REV_FQ}_s2.fastq \
ILLUMINACLIP:$AD_LOC:2:30:10 \
LEADING:3 TRAILING:3 SLIDINGWINDOW:4:33 CROP:210 HEADCROP:20 MINLEN:50

trimmomatic PE -threads 8 -phred33 \
$LIB_DIR/${FWD_FQ}_1.fastq  $LIB_DIR/${REV_FQ}_2.fastq \
$ASSEM2/${FWD_FQ}_1.fastq $ASSEM2/${FWD_FQ}_s1.fastq $ASSEM2/${REV_FQ}_2.fastq $ASSEM2/${REV_FQ}_s2.fastq \
ILLUMINACLIP:$AD_LOC:2:30:10 \
LEADING:3 TRAILING:3 MAXINFO:40:0.7 MINLEN:50

trimmomatic PE -threads 8 -phred33 \
$LIB_DIR/${FWD_FQ}_1.fastq  $LIB_DIR/${REV_FQ}_2.fastq \
$ASSEM3/${FWD_FQ}_1.fastq $ASSEM3/${FWD_FQ}_s1.fastq $ASSEM3/${REV_FQ}_2.fastq $ASSEM3/${REV_FQ}_s2.fastq \
ILLUMINACLIP:$AD_LOC:2:30:10 \
LEADING:3 TRAILING:3 MAXINFO:40:0.8 MINLEN:50

trimmomatic PE -threads 8 -phred33 \
$LIB_DIR/${FWD_FQ}_1.fastq  $LIB_DIR/${REV_FQ}_2.fastq \
$ASSEM4/${FWD_FQ}_1.fastq $ASSEM4/${FWD_FQ}_s1.fastq $ASSEM4/${REV_FQ}_2.fastq $ASSEM4/${REV_FQ}_s2.fastq \
ILLUMINACLIP:$AD_LOC:2:30:10 \
LEADING:3 TRAILING:3 MAXINFO:40:0.9 MINLEN:50

trimmomatic PE -threads 8 -phred33 \
$LIB_DIR/${FWD_FQ}_1.fastq  $LIB_DIR/${REV_FQ}_2.fastq \
$ASSEM5/${FWD_FQ}_1.fastq $ASSEM5/${FWD_FQ}_s1.fastq $ASSEM5/${REV_FQ}_2.fastq $ASSEM5/${REV_FQ}_s2.fastq \
ILLUMINACLIP:$AD_LOC:2:30:10 \
LEADING:3 TRAILING:3 MAXINFO:40:0.95 MINLEN:50

trimmomatic PE -threads 8 -phred33 \
$LIB_DIR/${FWD_FQ}_1.fastq  $LIB_DIR/${REV_FQ}_2.fastq \
$ASSEM6/${FWD_FQ}_1.fastq $ASSEM6/${FWD_FQ}_s1.fastq $ASSEM6/${REV_FQ}_2.fastq $ASSEM6/${REV_FQ}_s2.fastq \
ILLUMINACLIP:$AD_LOC:2:30:10 \
LEADING:3 TRAILING:3 MAXINFO:40:0.99 MINLEN:50

echo "Complete: trimmomatic $SLURM_ARRAY_TASK_ID"
