#!/bin/bash
cd /home-4/yzhan231@jhu.edu/work/yuezhang/RockCreek/yzhan231_rock_creek_shotgun_p1_analysis/yzhan231_rock_creek_shotgun_p1/PreheimLab_metagenomics_SOP/analysis/Trimmed_FASTQ/assembled
for i in *; do
	cd $i;
	cat *_1.fastq > all_1.fastq
	cat *_2.fastq > all_2.fastq
	cat *_s*.fastq > all_se.fastq
	cd ..;
done

