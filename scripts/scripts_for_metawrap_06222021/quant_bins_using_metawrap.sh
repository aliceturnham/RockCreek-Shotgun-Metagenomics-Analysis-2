#!/bin/sh
#SBATCH
#SBATCH --job-name=quantbins_metawrap
#SBATCH --time=72:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=48
#SBATCH --partition=lrgmem

#export PATH="~/.conda/envs/metawrap-env/bin:$PATH"
#source ~/.bashrc
#make sure mkdir quant_bins
ml anaconda
conda activate metawrap-env

OUT_DIR=/home-4/yzhan231@jhu.edu/work/yuezhang/RockCreek/yzhan231_rock_creek_shotgun_p1_analysis/yzhan231_rock_creek_shotgun_p1/PreheimLab_metagenomics_SOP/metawrap_06222021/QUANT_BINS
mkdir -p $OUT_DIR
CLEAN_READS=/home-4/yzhan231@jhu.edu/work/yuezhang/RockCreek/yzhan231_rock_creek_shotgun_p1_analysis/yzhan231_rock_creek_shotgun_p1/PreheimLab_metagenomics_SOP/metawrap_06222021/CLEAN_READS
ASSEMBLY=/home-4/yzhan231@jhu.edu/work/yuezhang/RockCreek/yzhan231_rock_creek_shotgun_p1_analysis/yzhan231_rock_creek_shotgun_p1/PreheimLab_metagenomics_SOP/metawrap_06222021/ASSEMBLY/final_assembly.fasta
BIN=/home-4/yzhan231@jhu.edu/work/yuezhang/RockCreek/yzhan231_rock_creek_shotgun_p1_analysis/yzhan231_rock_creek_shotgun_p1/PreheimLab_metagenomics_SOP/metawrap_06222021/BIN_REFINEMENT/metawrap_70_5_bins

metawrap quant_bins -b $BIN -o $OUT_DIR -a $ASSEMBLY $CLEAN_READS/all_1.fastq $CLEAN_READS/all_2.fastq

