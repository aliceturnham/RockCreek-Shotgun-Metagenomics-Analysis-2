#!/bin/sh
#SBATCH
#SBATCH --job-name=prokka
#SBATCH --time=72:00:00
#SBATCH --nodes=1
#SBATCH --partition=lrgmem
#SBATCH --ntasks-per-node=24

IN_FILE=../metawrap_06222021/ASSEMBLY/final_assembly.fasta
TMP_IN=../metawrap_06222021/ASSEMBLY/final_assembly_shortname.fasta
OUT_DIR=../metawrap_06222021/Prokka

#python shorten_contig_names.py $IN_FILE > $TMP_IN
#echo "contig names have been shortened"
ml anaconda
ml -centos7
conda activate Prokka
echo "prokka module successfully loaded"
prokka --cpus 48 --outdir $OUT_DIR $TMP_IN


