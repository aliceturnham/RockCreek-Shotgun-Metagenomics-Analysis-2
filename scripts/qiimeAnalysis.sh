#!/bin/bash

#SBATCH

#SBATCH --job-name=qiimeAnalysis
#SBATCH --time=5:00:00
#SBATCH --nodes=1
#SBATCH --mail-type=END
#SBATCH --mail-user=aturnha1@jhu.edu


#run in folder containing biom object and metadata.tsv

ml qiime2

qiime tools import \
  --input-path table.biom \
  --type 'FeatureTable[Frequency]' \
  --source-format BIOMV100Format \
  --output-path table.qza

qiime composition add-pseudocount \
  --i-table table.qza \
  --o-composition-table comp-table.qza

qiime metadata tabulate \
  --m-input-file sample-metadata.tsv \
  --o-visualization tabulated-sample-metadata.qzv

qiime composition ancom \
  --i-table comp-table.qza \
  --m-metadata-file sample-metadata.tsv \
  --m-metadata-column depth \
  --o-visualization ancom-depth.qzv


qiime composition ancom \
  --i-table comp-table.qza \
  --m-metadata-file sample-metadata.tsv \
  --m-metadata-column station \
  --o-visualization ancom-station.qzv


qiime composition ancom \
  --i-table comp-table.qza \
  --m-metadata-file sample-metadata.tsv \
  --m-metadata-column "station type" \
  --o-visualization ancom-station-type.qzv

qiime composition ancom \
  --i-table comp-table.qza \
  --m-metadata-file sample-metadata.tsv \
  --m-metadata-column depth \
  --o-visualization ancom-depth.qzv

qiime composition ancom \
  --i-table comp-table.qza \
  --m-metadata-file sample-metadata.tsv \
  --m-metadata-column "aeration day" \
  --o-visualization ancom-day.qzv

qiime composition ancom \
  --i-table comp-table.qza \
  --m-metadata-file sample-metadata.tsv \
  --m-metadata-column aeration \
  --o-visualization ancom-aeration.qzv




