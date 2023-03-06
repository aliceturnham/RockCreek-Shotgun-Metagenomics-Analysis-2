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
#python /scratch4/sprehei1/AliceTurnham/RockCreek-Shotgun-Metagenomics-Analysis-2-ATEdits/scripts/shorten_contig_names.py contigs.fasta > contigs_short_names.fasta
IN_FILE=/scratch4/sprehei1/AliceTurnham/RockCreek-Shotgun-Metagenomics-Analysis-2-ATEdits/analysis/ASSEMBLY/SW_28/contigs_short_names.fasta

OUT_DIR=/scratch4/sprehei1/AliceTurnham/RockCreek-Shotgun-Metagenomics-Analysis-2-ATEdits/analysis/PROKKA_on_contigs
echo 'viables are loaded'

date
prokka --cpus 48 --force --outdir $OUT_DIR $IN_FILE
#note that --force tells the program to overwrite the OUT_DIR
echo 'prokka is done'
date
