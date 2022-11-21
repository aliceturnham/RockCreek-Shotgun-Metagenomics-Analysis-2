#!/bin/sh
#SBATCH
#SBATCH --job-name=salmon_index
#SBATCH --time=6:00:00
#SBATCH --nodes=1
#SBATCH --partition=lrgmem
#SBATCH --ntasks-per-node=48

ml anaconda
conda activate salmon
ASSEMBLY=/home-4/yzhan231@jhu.edu/work/yuezhang/RockCreek/yzhan231_rock_creek_shotgun_p1_analysis/yzhan231_rock_creek_shotgun_p1/PreheimLab_metagenomics_SOP/metawrap_06222021/Prokka/PROKKA_12062021.ffn
#ASSEMBLY=/home-4/yzhan231@jhu.edu/work/yuezhang/RockCreek/yzhan231_rock_creek_shotgun_p1_analysis/yzhan231_rock_creek_shotgun_p1/PreheimLab_metagenomics_SOP/metawrap_06222021/Prokka/morris_ko_selected_ffn.ffn
OUT_DIR=/home-4/yzhan231@jhu.edu/work/yuezhang/RockCreek/yzhan231_rock_creek_shotgun_p1_analysis/yzhan231_rock_creek_shotgun_p1/PreheimLab_metagenomics_SOP/metawrap_06222021/SALMON

mkdir -p ${OUT_DIR}/all_scaffolds

#indexing assembly file using salmon
salmon index -p 48 -t $ASSEMBLY -i ${OUT_DIR}/all_scaffolds
if [[ $? -ne 0 ]] ; then error  "salmon indexing went wrong."; else echo "salmon indexing done"; fi
