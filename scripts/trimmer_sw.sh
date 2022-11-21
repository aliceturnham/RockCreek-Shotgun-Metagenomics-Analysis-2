#!/bin/bash -l

#SBATCH
#SBATCH --job-name=trimmo38-sw
#SBATCH --time=5:00:00

module load trimmomatic/0.38

#import run specific variables
source /home-4/yzhan231@jhu.edu/work/yuezhang/RockCreek/yzhan231_rock_creek_shotgun_p1_analysis/yzhan231_rock_creek_shotgun_p1/PreheimLab_metagenomics_SOP/config_files/trimmer_sw.config

for i in {10..32..2} ; do
     echo "$i as sliding window quality"
     mkdir -p $ASSEM/SW_${i}
     o=$ASSEM/SW_${i}
     for rr in all_rawreads zymo; do
          echo "$i with $rr"
          trimmomatic PE -threads 8 -phred33 \
          $LIB_DIR/${rr}_1.fastq  $LIB_DIR/${rr}_2.fastq \
          $o/${rr}_1.fastq $o/${rr}_s1.fastq $o/${rr}_2.fastq $o/${rr}_s2.fastq \
          ILLUMINACLIP:$AD_LOC:2:30:10 \
          LEADING:3 TRAILING:3 SLIDINGWINDOW:4:${i} CROP:210 HEADCROP:20 MINLEN:50
	done

done
