# Procedure to map reads back to genes of interest
1.	Use trimmer_sw28.sh to trim the reads
2.	Use SPDS_start_SW_loop.sh to assembly the reads to contigs
3.	Use bowtie_built_index.sh to build the index from contigs
4.	Use bowtie_mapping.sh to map the reads back to contigs
5.	Use samtools.sh to convert bowtie output .sam files to binary .bam files, and then sort it
6.	Use bedtools.sh to convert the sorted .bam files to human readable .bed file
(how to read a bed file: https://bedtools.readthedocs.io/_/downloads/en/stable/pdf/) 
7.	Use prokka_on_contigs.sh to predict genes from contigs
8.	Upload the PROKKA output .faa files to GhostKoala to annotate genes
9.	Use gff2bed.R to convert PROKKA output .gff files to bed files
10.	Use bedtools2.sh to find the overlapped region between reads and genes mapping back to the same contigs; and count the events of overlapping per gene
11. Analyze the results using a customized R script /home/yzhan231/scratch4-sprehei1/yuezhang/RockCreek/yzhan231_rock_creek_shotgun_p1_analysis/yzhan231_rock_creek_shotgun_p1/PreheimLab_metagenomics_SOP/analysis/BOWTIE/alignment/data_analysis_CB.R
Note that this script has not been validated so far.

To run an Rstudio interactive session on MARCC, consult https://www.arch.jhu.edu/user-guide/#elementor-tab-title-1603 section "R-Studio Server"
example bash scripts to initiate an Rstudio interactive session are:
Rstudio.sh
R-Studio-Server.slurm.script

