#Author: Yue Zhang

#shorten the contig names in the first column
#run it in the command line using 
#Rscript shorten_contigs_name_in_bowtie_output.R infile outfile
args = commandArgs(trailingOnly = T)
# test if there is at least one argument: if not, return an error
if (length(args)==0) {
  stop("At least one argument must be supplied (input file).n", call.=FALSE)
} else if (length(args)==1) {
  # default output file
  args[2] = "out.bed"
}
infile=args[1]

# infile='20190730-RC9-AM-BOTTOM.bowtie2.sorted.bed'
df= read.delim(infile, header = F, comment.char = '#')
df$V1 = gsub("_cov.*", "", df$V1)

write.table(df, file = args[2], col.names = F, sep = '\t', quote = F, row.names = F)
