#!/bin/sh
#SBATCH
#SBATCH --job-name=Ranalysis
#SBATCH --time=48:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=8
#SBATCH --mem-per-cpu=12GB
#SBATCH --partition=defq
#SBATCH --mail-type=END
#SBATCH --mail-user=aturnha1@jhu.edu


ml anaconda
conda activate r_env


DIR=/scratch4/sprehei1/AliceTurnham/RockCreek-Shotgun-Metagenomics-Analysis-2-ATEdits/analysis/BOWTIE/alignment


cd $DIR


Rscript $DIR/data_analysis_CB.R







