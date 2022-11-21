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

OUT_DIR=/home-4/yzhan231@jhu.edu/work/yuezhang/RockCreek/yzhan231_rock_creek_shotgun_p1_analysis/yzhan231_rock_creek_shotgun_p1/PreheimLab_metagenomics_SOP/analysis/kraken
CLEAN_READS=/home-4/yzhan231@jhu.edu/work/yuezhang/RockCreek/yzhan231_rock_creek_shotgun_p1_analysis/yzhan231_rock_creek_shotgun_p1/PreheimLab_metagenomics_SOP/analysis/Trimmed_FASTQ/*.fastq
ASSEMBLY=/home-4/yzhan231@jhu.edu/work/yuezhang/RockCreek/yzhan231_rock_creek_shotgun_p1_analysis/yzhan231_rock_creek_shotgun_p1/PreheimLab_metagenomics_SOP/analysis/assembledContigs/scaffolds.fasta

metawrap kraken2 -o $OUT_DIR -t 96 -s 1000000 $CLEAN_READS $ASSEMBLY
