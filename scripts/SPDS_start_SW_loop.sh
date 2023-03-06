#!/bin/sh
#SBATCH
#SBATCH --job-name=SPDS_SW
#SBATCH --time=48:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=48
#SBATCH --partition=bigmem
#SBATCH -A sprehei1_bigmem

export TMPDIR='/scratch4/sprehei1/AliceTurnham/tmp'

#changes the folloing to point to your working copy of spades
SPADES=/scratch4/sprehei1/yuezhang/lib_old/SPAdes/SPAdes-3.15.2-Linux/bin/spades.py

free -mh
getconf _NPROCESSORS_ONLN

cd /scratch4/sprehei1/AliceTurnham/RockCreek-Shotgun-Metagenomics-Analysis-2-ATEdits/analysis/Trimmed_FASTQ/assembled

#mkdir -p /scratch4/sprehei1/AliceTurnham/RockCreek-Shotgun-Metagenomics-Analysis-2-ATEdits/analysis/NewFileTest/ASSEMBLY


for DIR in S*; do
	FWD_FQ=${DIR}/all_1.fastq;
	REV_FQ=${DIR}/all_2.fastq;
	SE_FQ=${DIR}/all_se.fastq
	mkdir -p /scratch4/sprehei1/AliceTurnham/RockCreek-Shotgun-Metagenomics-Analysis-2-ATEdits/analysis/ASSEMBLY/${DIR};
	OUT_DIR=/scratch4/sprehei1/AliceTurnham/RockCreek-Shotgun-Metagenomics-Analysis-2-ATEdits/analysis/ASSEMBLY/${DIR}; 
	$SPADES --meta -1 $FWD_FQ -2 $REV_FQ -o ${OUT_DIR} --threads 48 --memory 960;
	echo "${DIR} assembled";
done


