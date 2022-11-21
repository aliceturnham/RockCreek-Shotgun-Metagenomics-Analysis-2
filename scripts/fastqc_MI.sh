#!/bin/bash

#SBATCH
#SBATCH --job-name=fastqc_trimmed
#SBATCH --time=2:00:00


module load fastqc

cd /home-4/yzhan231@jhu.edu/work/yuezhang/RockCreek/yzhan231_rock_creek_shotgun_p1_analysis/yzhan231_rock_creek_shotgun_p1/PreheimLab_metagenomics_SOP/analysis/Trimmed_FASTQ
OUTDIR=/home-4/yzhan231@jhu.edu/work/yuezhang/RockCreek/yzhan231_rock_creek_shotgun_p1_analysis/yzhan231_rock_creek_shotgun_p1/PreheimLab_metagenomics_SOP/analysis/fastqc_outdir/trimed
for IN in MI_crop_*; do
	mkdir -p ${OUTDIR}/${IN}
	fastqc $IN/*.fastq -o ${OUTDIR}/${IN}
	echo "$IN done"
done


