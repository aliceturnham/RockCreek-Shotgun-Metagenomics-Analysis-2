require('ape')
#read the gff file and output file name from command line arguments
#the syntax of command to run the script is Rscript gff2bed.R infile.gff outfile.bed
#file = 'PROKKA_11112022.gff'
args = commandArgs(trailingOnly = T)
# test if there is at least one argument: if not, return an error
if (length(args)==0) {
  stop("At least one argument must be supplied (input file).n", call.=FALSE)
} else if (length(args)==1) {
  # default output file
  args[2] = "out.bed"
}

gff = read.delim(args[1], header = F, comment.char = '#')
gff = subset(gff, startsWith(V1,'NODE') == T)
gff.s = gff[,c(1,4,5,9)]
names(gff.s) = c('contigs','start','end','feature')

#change "feature column" to only the feature ID
gff.s$feature = gsub(";.*", "", gff.s$feature)
gff.s$feature = gsub("ID=", "", gff.s$feature)

#write the dataframe as a bed file
write.table(gff.s, file = args[2], col.names = F, sep = '\t', quote = F, row.names = F)
