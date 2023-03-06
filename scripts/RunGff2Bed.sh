#!/bin/bash -l

#SBATCH

#SBATCH --job-name=gff2bed
#SBATCH --time=5:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=8
#SBATCH --mem-per-cpu=4GB
#SBATCH --partition=defq

INPUTDIR=/scratch4/sprehei1/AliceTurnham/RockCreek-Shotgun-Metagenomics-Analysis-2-ATEdits/analysis/PROKKA_on_contigs

OUTPUTDIR=/scratch4/sprehei1/AliceTurnham/RockCreek-Shotgun-Metagenomics-Analysis-2-ATEdits/analysis/BOWTIE/alignment

ml r/4.0.2

Rscript /scratch4/sprehei1/AliceTurnham/RockCreek-Shotgun-Metagenomics-Analysis-2-ATEdits/scripts/gff2bed.R $INPUTDIR/PROKKA_02162023.gff $OUTPUTDIR/PROKKA_02162023.bed






