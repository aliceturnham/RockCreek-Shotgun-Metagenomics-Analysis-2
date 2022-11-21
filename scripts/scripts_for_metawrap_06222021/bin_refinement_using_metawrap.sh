#!/bin/sh
#SBATCH
#SBATCH --job-name=binrefinement
#SBATCH --time=6:00:00
#SBATCH --partition=express

#export PATH="~/.conda/envs/metawrap-env/bin:$PATH"
#source ~/.bashrc

ml anaconda
conda activate metawrap-env
which python

#make sure mkdir bin_refinement

OUTDIR=/home-4/yzhan231@jhu.edu/work/yuezhang/RockCreek/yzhan231_rock_creek_shotgun_p1_analysis/yzhan231_rock_creek_shotgun_p1/PreheimLab_metagenomics_SOP/metawrap_06222021/BIN_REFINEMENT
mkdir -p $OUTDIR

IN=/home-4/yzhan231@jhu.edu/work/yuezhang/RockCreek/yzhan231_rock_creek_shotgun_p1_analysis/yzhan231_rock_creek_shotgun_p1/PreheimLab_metagenomics_SOP/metawrap_06222021/BINNING

metawrap bin_refinement -o ${OUTDIR} -t 1 -A ${IN}/metabat2_bins/ -B ${IN}/maxbin2_bins/ -C $/${IN}/concoct_bins/ -c 70 -x 5



