options(stringsAsFactors = FALSE) # this just always seems to help me. 
library("goseq")
library("dplyr")

resdata <- read.table("final_jg_sort.txt", header=FALSE,sep ="\t")
gene.data <- integer(length=length(resdata$V1))

names(gene.data) <- resdata$V1
topSDG <- read.table("gene_ids_SDG.txt", header=FALSE,sep ="\t")
topSDG_ids <- topSDG$V1
#names(gene.data) <- topSDG$V1

AbdUp <- topSDG_ids
#upregulated genes
for (item in AbdUp) {
  i <- which(names(gene.data)==item)
  gene.data[i] <- 1
}
table(gene.data)
genes.list <- na.omit(gene.data)

#gene.data <- filter(topSDG,V1 %in% names(gene.data))

feature.lengths <- read.table("final_gene_lengths.txt", header=FALSE, sep=" ")
#feature.lengths <- feature.lengths[,c(1,3)]
cat.map <- read.table("GOseq.txt", header=FALSE, sep="\t")
GoCats <- cat.map[,c(1,3)]

length(AbdUp) == table(gene.data)[2]

genes.length.data <- filter(feature.lengths,V1 %in% names(gene.data))
genes.bias.data <- genes.length.data$V2
names(genes.bias.data) <- genes.length.data$V1

#look at end of python script
pwf <- nullp(genes.list,bias.data=genes.bias.data,plot.fit = FALSE)

GO.wall <- goseq(pwf, gene2cat = GoCats, method = "Wallenius", use_genes_without_cat = FALSE)

library(dplyr)
sorted.GO <- arrange(GO.wall, GO.wall$over_represented_pvalue) 

sorted.GO
sorted.GO[,c(1,6)]


chart <- GO.wall %>% 
  top_n(10, wt=-over_represented_pvalue) %>% 
  mutate(hitsPerc=numDEInCat*100/numInCat) %>% 
  ggplot(aes(x=hitsPerc, 
             y=term, 
             colour=over_represented_pvalue, 
             size=numDEInCat)) +
  geom_point() +
  expand_limits(x=0) +
  labs(x="Hits (%)", y="GO term", colour="p value", size="Count")

ggsave("plot.png", chart)
