#!/bin/bash -l

#SBATCH
#SBATCH --job-name=trimmo38-MI
#SBATCH --time=5:00:00

module load trimmomatic/0.38

#import run specific variables
source /home-4/yzhan231@jhu.edu/work/yuezhang/RockCreek/yzhan231_rock_creek_shotgun_p1_analysis/yzhan231_rock_creek_shotgun_p1/PreheimLab_metagenomics_SOP/config_files/trimmer_sw.config

o=/home-4/yzhan231@jhu.edu/work/yuezhang/RockCreek/yzhan231_rock_creek_shotgun_p1_analysis/yzhan231_rock_creek_shotgun_p1/PreheimLab_metagenomics_SOP/analysis/Trimmed_FASTQ/assembled/MI_crop_0.95/separate_trimming

for F in ${LIB_DIR}/*RC*_1.fastq ${LIB_DIR}/zymo-*_1.fastq; do
  #next line removes everyting in $F after "_" first, and then append by "_2.fastq"
  R=${F%_*}_2.fastq
  BASE=${F##*/}
  SAMPLE=${BASE%_*}
  echo "$SAMPLE is been trimming"
  trimmomatic PE -threads 8 -phred33 \
  $F  $R \
  $o/${SAMPLE}_1.fastq $o/${SAMPLE}_s1.fastq $o/${SAMPLE}_2.fastq $o/${SAMPLE}_s2.fastq \
  ILLUMINACLIP:$AD_LOC:2:30:10 \
  LEADING:3 TRAILING:3 MAXINFO:40:0.95 CROP:210 HEADCROP:20 MINLEN:50
  echo "$SAMPLE is trimmed"
done

