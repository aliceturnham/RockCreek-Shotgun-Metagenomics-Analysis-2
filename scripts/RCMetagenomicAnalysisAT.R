install.packages('dplyr')
install.packages('vegan')

BiocManager::installa("metagenomeSeq")
BiocManager::install("biomformat")
library(metagenomeSeq)
library("biomformat")


require('dplyr')
require('vegan')


filenames=list.files(path='.',pattern = '*.sorted.bed.intersect.q20.bed.grouped_countdistinct')
gffbed=read.csv('PROKKA_02162023.bed',sep='\t',header=F)
kegg=read.csv('GhostKOALA_output.txt', sep = '\t',header=T)
keygenes=read.csv('kegg_key_metabolic_processes.csv')
print(ncol(kegg))


#if first feature has no "KO", column names must be added mannually to kegg file
names(kegg)=c('FeatureID','KO')

gffbed$FeatureLength = gffbed$V3-gffbed$V2
summary(gffbed$FeatureLength>0)
gffbed = gffbed[,4:5]
names(gffbed)[1] = 'FeatureID'

ChangeNames <- function(x,y) {
  names(x) <- c('FeatureID',y)
  return(x)
}

for (i in seq_along(filenames)) {
  assign(paste("df", i, sep = "."), read.csv(filenames[i],sep='\t',header = F))#assign a name to each file
  assign(paste("df", i, sep = "."), ChangeNames(get(paste("df", i, sep = ".")),sub('\\..*','',filenames[i])))
  if (i == 1) {df.all <- df.1} else {assign('df.all', merge(get('df.all'),get(paste("df", i, sep = ".")),all=T))} #merge files
}

#remove the CRISPER entry
df.all = subset(df.all, startsWith(FeatureID,'note') == F) 
#replace NA with 0
df.all[is.na(df.all)] = 0
#merge with prokka output to acquire the length of each feature identified
df.merged = merge(df.all,gffbed,all.x = T, by = 'FeatureID')


df.1= merge(df.merged,kegg,all.x = T, by = 'FeatureID')
df.genes=subset(df.1,select=-c(FeatureID))
df.shrink=merge(df.genes,keygenes,by="KO")

df.shrink=df.shrink%>%select(-c("X.x","X.y","metabolism","module","module_description","KO_description"))

df.test=aggregate(x = df.shrink[ , colnames(df.shrink) != "KO"], by = list(df.shrink$KO),FUN = sum)

colnames(df.test)[1] ="KO"
df.analysis=merge(keygenes,df.test,by='KO')


df.analysis=df.analysis[!duplicated(df.analysis$KO), ];

#make biom object which will be converted to qiime table
df.1=df.analysis
df.2=select(df.1,-c(1,3,4,5,6,7))
write.csv(df.2,"countData.csv")
rownames(df.2)=df.2$KO
df.2=select(df.2,-c("KO"))
count=loadMeta("countData.csv",sep="\t")
countMatrix=as.matrix(df.2)

df.3=select(df.1,c(2,3,5,6,7))
rownames(df.3)=df.3$KO
ordg=match(rownames(df.2),rownames(df.3))
df.3=df.3[ordg,]
geneData=AnnotatedDataFrame(df.3)

df.meta=read.csv("metaData.csv",header=TRUE,row.names=1)
ord=match(colnames(df.2),rownames(df.meta))
df.meta=df.meta[ord,]
rownames(df.meta)[nrow(df.meta)]="zymo_s2"
metaData=AnnotatedDataFrame(df.meta)

obj=newMRexperiment(df.2,phenoData=metaData,featureData=geneData)
obj=filterData(obj,present=1,depth=1000);

obj_biom=MRexperiment2biom(obj)
write_biom(obj_biom, biom_file = "table.biom")


