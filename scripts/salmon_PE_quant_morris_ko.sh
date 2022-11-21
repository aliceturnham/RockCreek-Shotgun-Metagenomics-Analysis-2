#!/bin/sh
#SBATCH
#SBATCH --job-name=salmon_quant
#SBATCH --time=72:00:00
#SBATCH --nodes=1
#SBATCH --partition=lrgmem
#SBATCH --ntasks-per-node=48

ml anaconda
conda activate salmon

LIB_DIR=/home-4/yzhan231@jhu.edu/work/yuezhang/RockCreek/yzhan231_rock_creek_shotgun_p1_analysis/yzhan231_rock_creek_shotgun_p1/PreheimLab_metagenomics_SOP/metawrap_06222021/CLEAN_READS
OUT_DIR=/home-4/yzhan231@jhu.edu/work/yuezhang/RockCreek/yzhan231_rock_creek_shotgun_p1_analysis/yzhan231_rock_creek_shotgun_p1/PreheimLab_metagenomics_SOP/metawrap_06222021/SALMON

#quantifying the number (abundance) of reads mapped back to each bin
for F in ${LIB_DIR}/*_1.fastq; do
  #next line removes everyting in $F after "_" first, and then append by "_2.fastq"
  R=${F%_*}_2.fastq
  BASE=${F##*/}
  SAMPLE=${BASE%_*}
  mkdir -p ${OUT_DIR}/quants_PE/${SAMPLE}
  salmon quant -i ${OUT_DIR}/morris_ko_index -l A \
	       -1 $F \
	       -2 $R \
	       -p 48 --validateMappings -o ${OUT_DIR}/quants_PE/${SAMPLE} \
               --gcBias \
	       --seqBias
  echo "${SAMPLE} processed"
done 

if [[ $? -ne 0 ]] ; then error "Something went wrong with quantifying the assembly. Exiting."; fi

#rename the output file of salmon
cd ${OUT_DIR}/quants_PE
for i in *; do
        mv ${i}/quant.sf ./${i}_quant_PE.sf
done
