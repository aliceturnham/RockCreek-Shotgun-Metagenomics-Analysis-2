#!/bin/bash -l

#SBATCH

#SBATCH --job-name=prokka
#SBATCH --time=72:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=48
#SBATCH --mem-per-cpu=4GB
#SBATCH --partition=defq

#load module
module load prokka/1.14.5
echo 'prokka/1.14.5 is loaded'

#load viables
#python ../../../scripts/shorten_contig_names.py contigs.fasta > contigs_short_names.fasta
IN_FILE=/home/yzhan231/scratch4-sprehei1/yuezhang/RockCreek/yzhan231_rock_creek_shotgun_p1_analysis/yzhan231_rock_creek_shotgun_p1/PreheimLab_metagenomics_SOP/analysis/ASSEMBLY/SW_28/contigs_short_names.fasta

OUT_DIR=/home/yzhan231/scratch4-sprehei1/yuezhang/RockCreek/yzhan231_rock_creek_shotgun_p1_analysis/yzhan231_rock_creek_shotgun_p1/PreheimLab_metagenomics_SOP/analysis/PROKKA_on_contigs
echo 'viables are loaded'

date
prokka --cpus 48 --force --outdir $OUT_DIR $IN_FILE
#note that --force tells the program to overwrite the OUT_DIR
echo 'prokka is done'
date
