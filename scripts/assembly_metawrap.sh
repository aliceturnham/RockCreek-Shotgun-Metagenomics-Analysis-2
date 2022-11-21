#!/bin/sh
#SBATCH
#SBATCH --job-name=ASSEMBLY-MW
#SBATCH --time=72:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=48
#SBATCH --partition=lrgmem

export PATH="~/.conda/envs/metawrap-env/bin:$PATH"
source ~/.bashrc

CLEAN_READS=/home-4/yzhan231@jhu.edu/work/yuezhang/RockCreek/yzhan231_rock_creek_shotgun_p1_analysis/yzhan231_rock_creek_shotgun_p1/PreheimLab_metagenomics_SOP/metawrap_06222021/CLEAN_READS
ASSEMBLY=/home-4/yzhan231@jhu.edu/work/yuezhang/RockCreek/yzhan231_rock_creek_shotgun_p1_analysis/yzhan231_rock_creek_shotgun_p1/PreheimLab_metagenomics_SOP/metawrap_06222021/ASSEMBLY
mkdir -p $ASSEMBLY

metawrap assembly -1 $CLEAN_READS/all_1.fastq -2 $CLEAN_READS/all_2.fastq -m 1000 -t 48 --metaspades -o $ASSEMBLY

