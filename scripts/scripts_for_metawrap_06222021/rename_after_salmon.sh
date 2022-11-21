#!/bin/sh

cd /home-4/yzhan231@jhu.edu/work/yuezhang/RockCreek/yzhan231_rock_creek_shotgun_p1_analysis/yzhan231_rock_creek_shotgun_p1/PreheimLab_metagenomics_SOP/metawrap_06222021/QUANT_BINS_salmon1.5.1/quants
for i in *; do
	mv ${i}/quant.sf ./${i}_quant.sf
done
