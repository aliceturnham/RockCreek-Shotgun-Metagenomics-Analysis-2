#!/bin/bash

#SBATCH
#SBATCH --job-name=fastqc_untrimmed
#SBATCH --time=2:00:00


module load fastqc

fastqc /home-4/yzhan231@jhu.edu/work/yuezhang/RockCreek/yzhan231_rock_creek_shotgun_p1_analysis/yzhan231_rock_creek_shotgun_p1/PreheimLab_metagenomics_SOP/analysis/FASTQ/zymo* -o /home-4/yzhan231@jhu.edu/work/yuezhang/RockCreek/yzhan231_rock_creek_shotgun_p1_analysis/yzhan231_rock_creek_shotgun_p1/PreheimLab_metagenomics_SOP/analysis/fastqc_outdir/untrimmed 

