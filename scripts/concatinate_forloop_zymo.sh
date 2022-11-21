#!/bin/bash

cd /home-4/yzhan231@jhu.edu/work/yuezhang/RockCreek/yzhan231_rock_creek_shotgun_p1_analysis/yzhan231_rock_creek_shotgun_p1/PreheimLab_metagenomics_SOP/analysis/Trimmed_FASTQ

for DIR in * ; do
	echo "$DIR"; 
        #concatinate all pair-end R1 trimmed reads
	cat $DIR/zymo*_1.fastq > $DIR/zymo_1.fastq
	echo "all_1 done"

	#concatinate all pair-end R2 trimmed reads
	cat $DIR/zymo*_2.fastq > $DIR/zymo_2.fastq
	echo "all_2 done"

	#concatinate all single-end trimmed reads (concatinate R1 and R2 together)
	cat $DIR/zymo*_s*.fastq > $DIR/zymo_se.fastq
	echo "all_se done"
done
