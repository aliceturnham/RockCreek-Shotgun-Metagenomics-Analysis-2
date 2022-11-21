#!/bin/sh
#SBATCH
#SBATCH --job-name=salmon_se_quant
#SBATCH --time=72:00:00
#SBATCH --nodes=1
#SBATCH --partition=lrgmem
#SBATCH --ntasks-per-node=48

ml anaconda
conda activate salmon


LIB_DIR=/home-4/yzhan231@jhu.edu/work/yuezhang/ChesapeakeBay_2021/spreheim/Trimmed_SE_FASTQ
OUT_DIR=/home-4/yzhan231@jhu.edu/work/yuezhang/ChesapeakeBay_2021/spreheim/spreheim_key_KO

#quantifying the number (abundance) of reads mapped back to each bin

for F in ${LIB_DIR}/*_1.fastq; do
  #next line removes everyting in $F after "_" first, and then append by "_2.fastq"
  R=${F%_*}_2.fastq
  BASE=${F##*/}
  SAMPLE=${BASE%_*}
#concatenate all se reads for each sample
  cat ${LIB_DIR}/${SAMPLE}* > ${LIB_DIR}/${SAMPLE}_se.fastq
#make dir for output
  mkdir -p ${OUT_DIR}/quants_SE/${SAMPLE}

  salmon quant -i ${OUT_DIR}/assembly_index -l A \
	       -r ${LIB_DIR}/${SAMPLE}_se.fastq \
	       -p 48 --validateMappings -o ${OUT_DIR}/quants_SE/${SAMPLE} \
               --gcBias \
	       --seqBias
  echo "${SAMPLE} processed"
done 

if [[ $? -ne 0 ]] ; then error "Something went wrong with quantifying the assembly. Exiting."; fi

#rename the output file of salmon
cd ${OUT_DIR}/quants_SE
for i in *; do
        mv ${i}/quant.sf ./${i}_quant_SE.sf
done
