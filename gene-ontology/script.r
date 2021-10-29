#Load clusterProfiler, DOSE, enrichplot, org.Hs.eg.db and call it. 
library(clusterProfiler)
library(DOSE)
library(enrichplot)
library(org.Mm.eg.db) # Genome wide annotation for Mouse, primarily based on mapping using Entrez Gene identifiers.

# reading Random_GeneList.csv file
df = read.delim("gene-list.txt", header = TRUE)
gs <- df[,1] #It takes entire element of 1st column

#Biological Id Translator
gsentrez <- bitr(gs, fromType = "ACCNUM", toType = "ENTREZID", OrgDb = org.Mm.eg.db) 

#enrichGO for GO enrichment analysis
goBP <- enrichGO( gene = gsentrez[[2]], OrgDb = org.Mm.eg.db, ont = "BP", pvalueCutoff = 0.05, pAdjustMethod = "fdr")

#plot
barplot(goBP, showCategory=10, title = "GO Biological Processes")
