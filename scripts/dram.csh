#!/bin/sh
#SBATCH
#SBATCH --job-name=dram
#SBATCH --time=72:00:00
#SBATCH --nodes=1
#SBATCH --partition=lrgmem
#SBATCH --ntasks-per-node=24

ml anaconda
conda activate DRAM

INPUT=../metawrap_06222021/ASSEMBLY/final_assembly.fasta
OUT_DIR=../metawrap_06222021/DRAM
mkdir -p $OUT_DIR

DRAM.py annotate -i $INPUT -o ${OUT_DIR}/annotation
#if [[ $? -ne 0 ]] ; then error "Something went wrong with DRAM annotation step. Exiting."; fi

#DRAM.py distill -i ${OUT_DIR}/annotation/annotations.tsv -o ${OUT_DIR}/genome_summaries --trna_path ${OUT_DIR}/annotation/trnas.tsv --rrna_path ${OUT_DIR}/annotation/rrnas.tsv
