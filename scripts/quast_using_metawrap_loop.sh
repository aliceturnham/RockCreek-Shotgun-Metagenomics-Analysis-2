#!/bin/sh

#SBATCH
#SBATCH --job-name=mw-quast
#SBATCH --time=72:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=48
#SBATCH --partition=lrgmem

ml anaconda
conda activate metawrap-env

cd /home-4/yzhan231@jhu.edu/work/yuezhang/RockCreek/yzhan231_rock_creek_shotgun_p1_analysis/yzhan231_rock_creek_shotgun_p1/PreheimLab_metagenomics_SOP/analysis/ASSEMBLY

mkdir -p /home-4/yzhan231@jhu.edu/work/yuezhang/RockCreek/yzhan231_rock_creek_shotgun_p1_analysis/yzhan231_rock_creek_shotgun_p1/PreheimLab_metagenomics_SOP/analysis/QUAST
OUTDIR=/home-4/yzhan231@jhu.edu/work/yuezhang/RockCreek/yzhan231_rock_creek_shotgun_p1_analysis/yzhan231_rock_creek_shotgun_p1/PreheimLab_metagenomics_SOP/analysis/QUAST

for IN in *; do
     mkdir -p ${OUTDIR}/${IN}
     quast -t 48 -o ${OUTDIR}/${IN} -m 960 $IN/scaffolds.fasta
     echo "$IN done"
done

