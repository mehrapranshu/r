#creating a volcano plot for the genes obatined from microarray data analysis 
#data used: GEO Accession: GSE42621
#read file
res <- read.table("rvol.txt", header=TRUE)
head(res)

png("volcano-plot.png")

# Make a basic volcano plot
with(res, plot(log2FoldChange, -log10(pvalue), pch=20, main="GSE42621", xlim=c(-8,8), ylim=c(0,17)))

# Add colored points
# All genes greater than 0 fold
with(subset(res, abs(log2FoldChange)>0), points(log2FoldChange, -log10(pvalue), pch=20, col="orange"))

# All genes greater than .05 pvalue not significant
with(subset(res, pvalue>.05 ), points(log2FoldChange, -log10(pvalue), pch=20, col="black"))

#All gene less than log2fc and less than .05 pvalue are under expressed (green)
with(subset(res, pvalue<.05 & log2FoldChange< -1), points(log2FoldChange, -log10(pvalue), pch=20, col="green"))

#All gene greater than log2fc and less than .05 pvalue are over expressed (red)
with(subset(res, pvalue<.05 & log2FoldChange>1), points(log2FoldChange, -log10(pvalue), pch=20, col="red"))

dev.off()