#!/bin/bash -l

#import run specific variables
source /home/yzhan231/scratch4-sprehei1/yuezhang/RockCreek/yzhan231_rock_creek_shotgun_p1_analysis/yzhan231_rock_creek_shotgun_p1/PreheimLab_metagenomics_SOP/config_files/trimmer_sw.config

for F in $LIB_DIR/2019*_1.fastq ; do
     R=${F%_*}_2.fastq
     BASE=${F##*/}
     SAMPLE=${BASE%_*}
     echo "$F"
     echo "$R"
     echo "$BASE"
     echo "$SAMPLE"
     echo "triming $SAMPLE"
done

