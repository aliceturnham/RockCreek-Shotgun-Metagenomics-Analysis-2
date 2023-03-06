#!/bin/bash

#SBATCH

#SBATCH --job-name=shortContNames
#SBATCH --time=5:00:00
#SBATCH --nodes=1


LONG=/scratch4/sprehei1/AliceTurnham/RockCreek-Shotgun-Metagenomics-Analysis-2-ATEdits/analysis/ASSEMBLY/SW_28/contigs.fasta
SHORT=/scratch4/sprehei1/AliceTurnham/RockCreek-Shotgun-Metagenomics-Analysis-2-ATEdits/analysis/ASSEMBLY/SW_28/contigs_short_names.fasta



ml python/3.8.6 

python /scratch4/sprehei1/AliceTurnham/RockCreek-Shotgun-Metagenomics-Analysis-2-ATEdits/scripts/shorten_contig_names.py $LONG > $SHORT

echo 'names shortened'
