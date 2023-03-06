#!/bin/bash -l

#SBATCH

#SBATCH --job-name=trimmo_sw28
#SBATCH --time=5:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=8
#SBATCH --mem-per-cpu=4GB
#SBATCH --partition=defq

ml trimmomatic/0.39_conda


#import run specific variables
source /scratch4/sprehei1/AliceTurnham/RockCreek-Shotgun-Metagenomics-Analysis-2-ATEdits/config_files/trimmer_sw.config 

for F in $LIB_DIR/*_R1_001.fastq ; do
     R=${F%_R1*}_R2${F##*_R1}
     BASE=${F##*/}
     SAMPLE=${BASE%_S*}
     echo "$F"
     echo "$R"
     echo "$BASE"
     echo "$SAMPLE"
     echo "triming $SAMPLE"
     trimmomatic -h
     trimmomatic PE -threads 8 -phred33 \
     $F $R \
     $OUT/${SAMPLE}_1.fastq $OUT/${SAMPLE}_s1.fastq $OUT/${SAMPLE}_2.fastq $OUT/${SAMPLE}_s2.fastq \
     ILLUMINACLIP:$AD_LOC:2:30:10 \
     LEADING:3 TRAILING:3 SLIDINGWINDOW:4:28 CROP:210 HEADCROP:20 MINLEN:50
	done

