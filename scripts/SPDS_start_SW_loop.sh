#!/bin/sh
#SBATCH
#SBATCH --job-name=SPDS_SW
#SBATCH --time=72:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=48
#SBATCH --partition=lrgmem

export TMPDIR='/home-4/yzhan231@jhu.edu/work/yuezhang/RockCreek/yzhan231_rock_creek_shotgun_p1_analysis/yzhan231_rock_creek_shotgun_p1/PreheimLab_metagenomics_SOP/analysis/tmp'

#changes the folloing to point to your working copy of spades
SPADES=/home-4/yzhan231@jhu.edu/work/yuezhang/lib/SPAdes/SPAdes-3.15.2-Linux/bin/spades.py

free -mh
getconf _NPROCESSORS_ONLN

cd /home-4/yzhan231@jhu.edu/work/yuezhang/RockCreek/yzhan231_rock_creek_shotgun_p1_analysis/yzhan231_rock_creek_shotgun_p1/PreheimLab_metagenomics_SOP/analysis/Trimmed_FASTQ/assembled

#mkdir -p /home-4/yzhan231@jhu.edu/work/yuezhang/RockCreek/yzhan231_rock_creek_shotgun_p1_analysis/yzhan231_rock_creek_shotgun_p1/PreheimLab_metagenomics_SOP/analysis/ASSEMBLY

for DIR in S*; do
	FWD_FQ=${DIR}/all_1.fastq;
	REV_FQ=${DIR}/all_2.fastq;
	SE_FQ=${DIR}/all_se.fastq;
	mkdir -p /home-4/yzhan231@jhu.edu/work/yuezhang/RockCreek/yzhan231_rock_creek_shotgun_p1_analysis/yzhan231_rock_creek_shotgun_p1/PreheimLab_metagenomics_SOP/analysis/ASSEMBLY/${DIR};
	OUT_DIR=/home-4/yzhan231@jhu.edu/work/yuezhang/RockCreek/yzhan231_rock_creek_shotgun_p1_analysis/yzhan231_rock_creek_shotgun_p1/PreheimLab_metagenomics_SOP/analysis/ASSEMBLY/${DIR}; 
	$SPADES --meta -1 $FWD_FQ -2 $REV_FQ -s $SE_FQ -o $OUT_DIR --threads 48 --memory 960;
	echo "${DIR} assembled";
done


