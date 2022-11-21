#!/bin/sh
#SBATCH
#SBATCH --job-name=binrefinement
#SBATCH --time=72:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=48
#SBATCH --partition=lrgmem

#export PATH="~/.conda/envs/metawrap-env/bin:$PATH"
#source ~/.bashrc

ml anaconda
conda activate metawrap-env
which python

#make sure mkdir bin_refinement

OUTDIR=/home-4/yzhan231@jhu.edu/work/yuezhang/RockCreek/yzhan231_rock_creek_shotgun_p1_analysis/yzhan231_rock_creek_shotgun_p1/PreheimLab_metagenomics_SOP/analysis/BIN_REFINEMENT

mkdir -p $OUTDIR

BIN_DIR=/home-4/yzhan231@jhu.edu/work/yuezhang/RockCreek/yzhan231_rock_creek_shotgun_p1_analysis/yzhan231_rock_creek_shotgun_p1/PreheimLab_metagenomics_SOP/analysis/BINNING

cd $BIN_DIR
for IN in *; do
     mkdir -p ${OUTDIR}/${IN}
     metawrap bin_refinement -o ${OUTDIR}/${IN} -t 48 -A ${BIN_DIR}/${IN}/metabat2_bins/ -B ${BIN_DIR}/${IN}/maxbin2_bins/ -C ${BIN_DIR}/${IN}/concoct_bins/ -c 70 -x 5
     echo "$IN done"
done


