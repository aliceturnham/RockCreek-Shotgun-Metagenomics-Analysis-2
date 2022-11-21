#!/bin/sh
#SBATCH
#SBATCH --job-name=binning
#SBATCH --time=72:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=48
#SBATCH --partition=lrgmem

export PATH="~/.conda/envs/metawrap-env/bin:$PATH"
source ~/.bashrc

OUTDIR=/home-4/yzhan231@jhu.edu/work/yuezhang/RockCreek/yzhan231_rock_creek_shotgun_p1_analysis/yzhan231_rock_creek_shotgun_p1/PreheimLab_metagenomics_SOP/analysis/BINNING
mkdir -p $OUTDIR

cd /home-4/yzhan231@jhu.edu/work/yuezhang/RockCreek/yzhan231_rock_creek_shotgun_p1_analysis/yzhan231_rock_creek_shotgun_p1/PreheimLab_metagenomics_SOP/analysis/Trimmed_FASTQ/assembled

for IN in *; do
     mkdir -p ${OUTDIR}/${IN}
     ASSEMBLY=/home-4/yzhan231@jhu.edu/work/yuezhang/RockCreek/yzhan231_rock_creek_shotgun_p1_analysis/yzhan231_rock_creek_shotgun_p1/PreheimLab_metagenomics_SOP/analysis/ASSEMBLY/${IN}/scaffolds.fasta
     metawrap binning -o ${OUTDIR}/${IN} -t 48 -a $ASSEMBLY --metabat2 --maxbin2 --concoct ${IN}/all_1.fastq ${IN}/all_2.fastq
     echo "$IN done"
done





