#!/bin/sh

#SBATCH
#SBATCH --job-name=mw_readqc
#SBATCH --time=6:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=48
#SBATCH --partition=lrgmem

export PATH="~/.conda/envs/metawrap-env/bin:$PATH"
source ~/.bashrc

IN=/home-4/yzhan231@jhu.edu/work/yuezhang/RockCreek/yzhan231_rock_creek_shotgun_p1_analysis/yzhan231_rock_creek_shotgun_p1/PreheimLab_metagenomics_SOP/analysis/FASTQ
OUT=/home-4/yzhan231@jhu.edu/work/yuezhang/RockCreek/yzhan231_rock_creek_shotgun_p1_analysis/yzhan231_rock_creek_shotgun_p1/PreheimLab_metagenomics_SOP/metawwrap_06222021/READ_QC
mkdir -p $OUT
for F in ${IN}/*_1.fastq; do 
	R=${F%_*}_2.fastq
	BASE=${F##*/}
	SAMPLE=${BASE%_*}
	metawrap read_qc -1 $F -2 $R -t 48 -o $OUT/$SAMPLE --skip-bmtagger
done	

