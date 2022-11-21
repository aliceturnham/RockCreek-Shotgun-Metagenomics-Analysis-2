#!/bin/bash

#SBATCH
#SBATCH --job-name=split
#SBATCH --time=12:00:00
#SBATCH --partition=express
#SBATCH --ntasks-per-node=1
ml anaconda
conda activate python3_env
scaffolds='~/work/yuezhang/RockCreek/yzhan231_rock_creek_shotgun_p1_analysis/yzhan231_rock_creek_shotgun_p1/PreheimLab_metagenomics_SOP/metawrap_06222021/Prokka/PROKKA_12062021.faa'

python split_scaffolds.py $scaffolds 12 
