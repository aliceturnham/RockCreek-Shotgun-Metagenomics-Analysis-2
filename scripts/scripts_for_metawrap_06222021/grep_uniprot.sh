#!/usr/bin/sh
BIN=/home-4/yzhan231@jhu.edu/work/yuezhang/RockCreek/yzhan231_rock_creek_shotgun_p1_analysis/yzhan231_rock_creek_shotgun_p1/PreheimLab_metagenomics_SOP/metawrap_06222021/BIN_ANNOTATION/bin_funct_annotations
OUT=/home-4/yzhan231@jhu.edu/work/yuezhang/RockCreek/yzhan231_rock_creek_shotgun_p1_analysis/yzhan231_rock_creek_shotgun_p1/PreheimLab_metagenomics_SOP/metawrap_06222021/UNIPROT
mkdir -p $OUT
for i in $BIN/*; do
	BASE=${i##*/}
  	SAMPLE=${BASE%.*}
	grep -o 'UniProt.*' $i | cut -d';' -f1 | cut -d':' -f2 > ${OUT}/${SAMPLE}_uniprotlist.txt
done



