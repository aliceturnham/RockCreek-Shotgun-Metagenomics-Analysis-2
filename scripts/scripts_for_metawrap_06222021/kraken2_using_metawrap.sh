#!/bin/sh
#SBATCH
#SBATCH --job-name=kraken2
#SBATCH --time=72:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=48
#SBATCH --partition=lrgmem

#mkdir for output
export PATH="~/.conda/envs/metawrap-env/bin:$PATH"
source ~/.bashrc

OUT_DIR=/home-4/yzhan231@jhu.edu/work/yuezhang/RockCreek/yzhan231_rock_creek_shotgun_p1_analysis/yzhan231_rock_creek_shotgun_p1/PreheimLab_metagenomics_SOP/metawrap_06222021/KRAKEN
CLEAN_READS=/home-4/yzhan231@jhu.edu/work/yuezhang/RockCreek/yzhan231_rock_creek_shotgun_p1_analysis/yzhan231_rock_creek_shotgun_p1/PreheimLab_metagenomics_SOP/metawrap_06222021/CLEAN_READS/*.fastq
ASSEMBLY=/home-4/yzhan231@jhu.edu/work/yuezhang/RockCreek/yzhan231_rock_creek_shotgun_p1_analysis/yzhan231_rock_creek_shotgun_p1/PreheimLab_metagenomics_SOP/metawrap_06222021/ASSEMBLY/final_assembly.fasta


metawrap kraken2 -o $OUT_DIR -t 48 -s 1000000 $CLEAN_READS $ASSEMBLY
