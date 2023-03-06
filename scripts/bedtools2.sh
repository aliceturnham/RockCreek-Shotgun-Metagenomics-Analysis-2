#!/bin/bash -l

#SBATCH

#SBATCH --job-name=bedtools2
#SBATCH --time=72:00:00
#SBATCH --nodes=1
#SBATCH --tasks-per-node=1
#SBATCH --cpus-per-task=8

SBD_DIR=/scratch4/sprehei1/AliceTurnham/RockCreek-Shotgun-Metagenomics-Analysis-2-ATEdits/analysis/BOWTIE/alignment
PBED=${SBD_DIR}/PROKKA_02162023.bed

ml bedtools/2.30.0
module load r/4.0.2
date

for SBD in $SBD_DIR/*.sorted.bed; do
	BASE=${SBD##*/}
	echo "processing ${SBD}"
	Rscript /scratch4/sprehei1/AliceTurnham/RockCreek-Shotgun-Metagenomics-Analysis-2-ATEdits/scripts/shorten_contigs_name_in_bedfile.R $SBD ${SBD_DIR}/${BASE}.short
	echo "contig names in $$SBD has been shortened"
	bedtools intersect -a $PBED -b ${SBD_DIR}/${BASE}.short -wo > ${SBD_DIR}/${BASE}.intersect.q20.bed
       	bedtools groupby -i ${SBD_DIR}/${BASE}.intersect.q20.bed -g 4 -c 11 -o count > ${SBD_DIR}/${BASE}.intersect.q20.bed.grouped_count
	bedtools groupby -i ${SBD_DIR}/${BASE}.intersect.q20.bed -g 4 -c 11 -o count_distinct > ${SBD_DIR}/${BASE}.intersect.q20.bed.grouped_countdistinct
	echo "${SBD} is processed"
done
date

