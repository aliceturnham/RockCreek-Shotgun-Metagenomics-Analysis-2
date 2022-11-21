#!/bin/sh
ml -centos7
ml anaconda
conda activate Prokka
#export PATH="~/.conda/envs/metawrap-env/bin:$PATH"



IN=../../metawrap_06222021/TRY
OUT=../../metawrap_06222021/BIN_ANNOTATION
metaWRAP annotate_bins -o $OUT -t 1 -b $IN


