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

OUT_DIR=/home-4/yzhan231@jhu.edu/work/yuezhang/RockCreek/yzhan231_rock_creek_shotgun_p1_analysis/yzhan231_rock_creek_shotgun_p1/PreheimLab_metagenomics_SOP/analysis/QUANT_BINS/MI_crop_0.95
mkdir -p $OUT_DIR
CLEAN_READS=/home-4/yzhan231@jhu.edu/work/yuezhang/RockCreek/yzhan231_rock_creek_shotgun_p1_analysis/yzhan231_rock_creek_shotgun_p1/PreheimLab_metagenomics_SOP/analysis/Trimmed_FASTQ/assembled/MI_crop_0.95/separate_trimming/*.fastq
ASSEMBLY=/home-4/yzhan231@jhu.edu/work/yuezhang/RockCreek/yzhan231_rock_creek_shotgun_p1_analysis/yzhan231_rock_creek_shotgun_p1/PreheimLab_metagenomics_SOP/analysis/ASSEMBLY/MI_crop_0.95/scaffolds.fasta
BIN=/home-4/yzhan231@jhu.edu/work/yuezhang/RockCreek/yzhan231_rock_creek_shotgun_p1_analysis/yzhan231_rock_creek_shotgun_p1/PreheimLab_metagenomics_SOP/analysis/BIN_REFINEMENT/MI_crop_0.95/metawrap_70_5_bins

metawrap quant_bins -b $BIN -o $OUT_DIR -a $ASSEMBLY $CLEAN_READS

