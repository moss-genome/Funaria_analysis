#read in files
temp = list.files(pattern="*_cnt.csv")
myfiles = lapply(temp, read.delim)
raw_counts <- cbind(data.frame(myfiles))

#remove rows that are all 0
raw_counts<- raw_counts[,-c(3,5,7,9,11,13,15,17,19)]
raw_counts_allexpressed <- raw_counts[-which(rowSums(raw_counts[,2:10])==0),]

#count genes
for(i in 1:length(raw_counts_allexpressed$DG1)){
  if(raw_counts_allexpressed[i,2]>0&raw_counts_allexpressed[i,3]>0&raw_counts_allexpressed[i,4]>0){raw_counts_allexpressed$dg[i]=1} else {raw_counts_allexpressed$dg[i]=0}
}

for(i in 1:length(raw_counts_allexpressed$DG1)){
  if(raw_counts_allexpressed[i,5]>0&raw_counts_allexpressed[i,6]>0&raw_counts_allexpressed[i,7]>0){raw_counts_allexpressed$hg[i]=1} else {raw_counts_allexpressed$hg[i]=0}
}

for(i in 1:length(raw_counts_allexpressed$DG1)){
  if(raw_counts_allexpressed[i,8]>0&raw_counts_allexpressed[i,9]>0&raw_counts_allexpressed[i,10]>0){raw_counts_allexpressed$s[i]=1} else {raw_counts_allexpressed$s[i]=0}
}

for(i in 1:length(raw_counts_allexpressed$HG1)){
  if(raw_counts_allexpressed$dg[i]==1&raw_counts_allexpressed$hg[i]==1){raw_counts_allexpressed$hgdg[i]=1} else {raw_counts_allexpressed$hgdg[i]=0}
}

for(i in 1:length(raw_counts_allexpressed$HG1)){
  if(raw_counts_allexpressed$dg[i]==1&raw_counts_allexpressed$s[i]==1){raw_counts_allexpressed$dgs[i]=1} else {raw_counts_allexpressed$dgs[i]=0}
}

for(i in 1:length(raw_counts_allexpressed$HG1)){
  if(raw_counts_allexpressed$hg[i]==1&raw_counts_allexpressed$s[i]==1){raw_counts_allexpressed$hgs[i]=1} else {raw_counts_allexpressed$hgs[i]=0}
}

for(i in 1:length(raw_counts_allexpressed$HG1)){
  if(raw_counts_allexpressed$hg[i]==1&raw_counts_allexpressed$s[i]==1&raw_counts_allexpressed$dg[i]){raw_counts_allexpressed$hgdgs[i]=1} else {raw_counts_allexpressed$hgdgs[i]=0}
}

for(i in 1:length(raw_counts_chromosomes$HG1)){
  if(raw_counts_chromosomes$hg[i]==1|raw_counts_chromosomes$s[i]==1|raw_counts_chromosomes$dg[i]==1){raw_counts_chromosomes$expressed[i]=1} else {raw_counts_chromosomes$expressed[i]=0}
}

for(i in 1:length(raw_counts_chromosomes$HG1)){
  if(raw_counts_chromosomes$hg[i]==1|raw_counts_chromosomes$dg[i]==1){raw_counts_chromosomes$hgdgexpressed[i]=1} else {raw_counts_chromosomes$hgdgexpressed[i]=0}
}

for(i in 1:length(raw_counts_chromosomes$HG1)){
  if(raw_counts_chromosomes$hg[i]==1|raw_counts_chromosomes$dg[i]==1){raw_counts_chromosomes$hgdgexpressed[i]=1} else {raw_counts_chromosomes$hgdgexpressed[i]=0}
}

#generate venn diagram
v.plot <- gplots::venn(raw_counts_allexpressed[12:14])
c.plot <- gplots::venn(raw_counts_allexpressed[12:13])

#read in chromosome gene IDs
chr_ids <- read.csv("stringtie_gene_26scaffolds.txt", header=FALSE, sep= " ")
raw_counts_chromosomes <- raw_counts_allexpressed[raw_counts_allexpressed$ID %in% chr_ids$V1,]

v.plot <- gplots::venn(raw_counts_chromosomes[12:14])
c.plot <- gplots::venn(raw_counts_chromosomes[12:13])


#creating gene lists

only_dg <- raw_counts_chromosomes[(which(raw_counts_chromosomes$dg==1&
      raw_counts_chromosomes$hg==0&
      raw_counts_chromosomes$s==0&
      raw_counts_chromosomes$hgdg==0&
      raw_counts_chromosomes$dgs==0&
      raw_counts_chromosomes$hgs==0&
      raw_counts_chromosomes$hgdgs==0)),]
only_dg_ids<- chr_ids[chr_ids$V1 %in% only_dg$ID,]
only_dg_ids<- only_dg_ids[,2]

write.csv(only_dg_ids, "DG_specifics.csv")


only_hg <- raw_counts_chromosomes[(which(raw_counts_chromosomes$dg==0&
                                           raw_counts_chromosomes$hg==1&
                                           raw_counts_chromosomes$s==0&
                                           raw_counts_chromosomes$hgdg==0&
                                           raw_counts_chromosomes$dgs==0&
                                           raw_counts_chromosomes$hgs==0&
                                           raw_counts_chromosomes$hgdgs==0)),]
only_hg_ids<- chr_ids[chr_ids$V1 %in% only_hg$ID,]
only_hg_ids<- only_hg_ids[,2]

write.csv(only_hg_ids, "HG_specifics.csv")

only_s <- raw_counts_chromosomes[(which(raw_counts_chromosomes$dg==0&
                                           raw_counts_chromosomes$hg==0&
                                           raw_counts_chromosomes$s==1&
                                           raw_counts_chromosomes$hgdg==0&
                                           raw_counts_chromosomes$dgs==0&
                                           raw_counts_chromosomes$hgs==0&
                                           raw_counts_chromosomes$hgdgs==0)),]
only_s_ids<- chr_ids[chr_ids$V1 %in% only_s$ID,]
only_s_ids<- only_s_ids[,2]

write.csv(only_s_ids, "S_specifics.csv")

only_hgdg <- raw_counts_chromosomes[(which(raw_counts_chromosomes$dg==1&
                                          raw_counts_chromosomes$hg==1&
                                          raw_counts_chromosomes$s==0&
                                          raw_counts_chromosomes$hgdg==1&
                                          raw_counts_chromosomes$dgs==0&
                                          raw_counts_chromosomes$hgs==0&
                                          raw_counts_chromosomes$hgdgs==0)),]
only_hgdg_ids<- chr_ids[chr_ids$V1 %in% only_hgdg$ID,]
only_hgdg_ids<- only_hgdg_ids[,2]

write.csv(only_hgdg_ids, "hgdg_specifics.csv")

only_hgs <- raw_counts_chromosomes[(which(raw_counts_chromosomes$dg==0&
                                             raw_counts_chromosomes$hg==1&
                                             raw_counts_chromosomes$s==1&
                                             raw_counts_chromosomes$hgdg==0&
                                             raw_counts_chromosomes$dgs==0&
                                             raw_counts_chromosomes$hgs==1&
                                             raw_counts_chromosomes$hgdgs==0)),]
only_hgs_ids<- chr_ids[chr_ids$V1 %in% only_hgs$ID,]
only_hgs_ids<- only_hgs_ids[,2]

write.csv(only_hgs_ids, "hgs_specifics.csv")

only_dgs <- raw_counts_chromosomes[(which(raw_counts_chromosomes$dg==1&
                                            raw_counts_chromosomes$hg==0&
                                            raw_counts_chromosomes$s==1&
                                            raw_counts_chromosomes$hgdg==0&
                                            raw_counts_chromosomes$dgs==1&
                                            raw_counts_chromosomes$hgs==0&
                                            raw_counts_chromosomes$hgdgs==0)),]
only_dgs_ids<- chr_ids[chr_ids$V1 %in% only_dgs$ID,]
only_dgs_ids<- only_dgs_ids[,2]

write.csv(only_dgs_ids, "dgs_specifics.csv")

only_house <- raw_counts_chromosomes[(which(raw_counts_chromosomes$dg==1&
                                            raw_counts_chromosomes$hg==1&
                                            raw_counts_chromosomes$s==1&
                                            raw_counts_chromosomes$hgdg==1&
                                            raw_counts_chromosomes$dgs==1&
                                            raw_counts_chromosomes$hgs==1&
                                            raw_counts_chromosomes$hgdgs==1)),]
only_house_ids<- chr_ids[chr_ids$V1 %in% only_house$ID,]
only_house_ids<- only_house_ids[,2]

write.csv(only_house_ids, "house_specifics.csv")


HG_S_DE <- read.csv("../HG_S_DE_fold.txt", sep = '\t')
HG_S_DE_filter <- dplyr::filter(HG_S_DE, padj < 0.05)
for(i in 1:length(HG_S_DE_filter$gene_id..Stringtie.)){
  if (HG_S_DE_filter$log2FoldChange[i]>4){
    HG_S_DE_filter$count[i]=1
  } else if(HG_S_DE_filter$log2FoldChange[i]>2 & HG_S_DE_filter$log2FoldChange[i]< 4){
    HG_S_DE_filter$count[i]=2
  } else if(HG_S_DE_filter$log2FoldChange[i]> -4 & HG_S_DE_filter$log2FoldChange[i]< -2){
    HG_S_DE_filter$count[i]=3
  } else if(HG_S_DE_filter$log2FoldChange[i]< -4){
    HG_S_DE_filter$count[i]=4
  } else {HG_S_DE_filter$count[i]=0}
}

DG_S_DE <- read.csv("../DG_S_DE_fold.txt", sep = '\t')
DG_S_DE_filter <- dplyr::filter(DG_S_DE, padj < 0.05)
for(i in 1:length(DG_S_DE_filter$gene_is..Stringtie.)){
  if (DG_S_DE_filter$log2FoldChange[i]>4){
    DG_S_DE_filter$count[i]=4
  } else if(DG_S_DE_filter$log2FoldChange[i]>2 & DG_S_DE_filter$log2FoldChange[i]< 4){
    DG_S_DE_filter$count[i]=3
  } else if(DG_S_DE_filter$log2FoldChange[i]> -4 & DG_S_DE_filter$log2FoldChange[i]< -2){
    DG_S_DE_filter$count[i]=2
  } else if(DG_S_DE_filter$log2FoldChange[i]< -4){
    DG_S_DE_filter$count[i]=1
  } else {DG_S_DE_filter$count[i]=0}
}

HG_DG_DE <- read.csv("../HG_DG_DE_fold.txt", sep = '\t')
HG_DG_DE_filter <- dplyr::filter(HG_DG_DE, padj < 0.05)
for(i in 1:length(HG_DG_DE_filter$gene_id..Stringtie.)){
  if (HG_DG_DE_filter$log2FoldChange[i]>4){
    HG_DG_DE_filter$count[i]=1
  } else if(HG_DG_DE_filter$log2FoldChange[i]>2 & HG_DG_DE_filter$log2FoldChange[i]< 4){
    HG_DG_DE_filter$count[i]=2
  } else if(HG_DG_DE_filter$log2FoldChange[i]> -4 & HG_DG_DE_filter$log2FoldChange[i]< -2){
    HG_DG_DE_filter$count[i]=3
  } else if(HG_DG_DE_filter$log2FoldChange[i]< -4){
    HG_DG_DE_filter$count[i]=4
  } else {HG_DG_DE_filter$count[i]=0}
}

up_table <- as.data.frame(HG_S_DE_filter[which(HG_S_DE_filter$count==1),1])
up_table_2 <- as.data.frame(DG_S_DE_filter[which(DG_S_DE_filter$count==1),1])
colnames(up_table) <- "ID"
colnames(up_table_2) <- "ID"
up_regu <- dplyr::inner_join(up_table,up_table_2)

down_table <- as.data.frame(HG_S_DE_filter[which(HG_S_DE_filter$count==2),1])
down_table_2 <- as.data.frame(DG_S_DE_filter[which(DG_S_DE_filter$count==2),1])
colnames(down_table) <- "ID"
colnames(down_table_2) <- "ID"
down_regu <- dplyr::inner_join(down_table,down_table_2)

HG_DG_24up <- HG_DG_DE_filter[which(HG_DG_DE_filter$count==2),1]
HG_DG_24up_filter <- chr_ids[which(HG_DG_24up%in%chr_ids$V1),2]
HG_DG_above4up <- HG_DG_DE_filter[which(HG_DG_DE_filter$count==1),1]
HG_DG_above4up_filter <- chr_ids[which(HG_DG_above4up%in%chr_ids$V1),2]
HG_DG_24down <- HG_DG_DE_filter[which(HG_DG_DE_filter$count==3),1]
HG_DG_24down_filter <- chr_ids[which(HG_DG_24down%in%chr_ids$V1),2]
HG_DG_above4down <- HG_DG_DE_filter[which(HG_DG_DE_filter$count==4),1]
HG_DG_above4down_filter <- chr_ids[which(HG_DG_above4down%in%chr_ids$V1),2]

write.table(HG_DG_24up_filter, "DE_IDs/HG_DG/HG_DG_24up.txt")
write.table(HG_DG_above4up_filter, "DE_IDs/HG_DG/HG_DG_above4up.txt")
write.table(HG_DG_24down_filter, "DE_IDs/HG_DG/HG_DG_24down.txt")
write.table(HG_DG_above4down_filter, "DE_IDs/HG_DG/HG_DG_above4down.txt")

HG_S_24up <- HG_S_DE_filter[which(HG_S_DE_filter$count==2),1]
HG_S_24up_filter <- chr_ids[which(HG_S_24up%in%chr_ids$V1),2]
HG_S_above4up <- HG_S_DE_filter[which(HG_S_DE_filter$count==1),1]
HG_S_above4up_filter <- chr_ids[which(HG_S_above4up%in%chr_ids$V1),2]
HG_S_24down <- HG_S_DE_filter[which(HG_S_DE_filter$count==3),1]
HG_S_24down_filter <- chr_ids[which(HG_S_24down%in%chr_ids$V1),2]
HG_S_above4down <- HG_S_DE_filter[which(HG_S_DE_filter$count==4),1]
HG_S_above4down_filter <- chr_ids[which(HG_S_above4down%in%chr_ids$V1),2]

write.table(HG_S_24up_filter, "DE_IDs/HG_S/HG_S_24up.txt")
write.table(HG_S_above4up_filter, "DE_IDs/HG_S/HG_S_above4up.txt")
write.table(HG_S_24down_filter, "DE_IDs/HG_S/HG_S_24down.txt")
write.table(HG_S_above4down_filter, "DE_IDs/HG_S/HG_S_above4down.txt")

DG_S_24up <- DG_S_DE_filter[which(DG_S_DE_filter$count==2),1]
DG_S_24up_filter <- chr_ids[which(DG_S_24up%in%chr_ids$V1),2]
DG_S_above4up <- DG_S_DE_filter[which(DG_S_DE_filter$count==1),1]
DG_S_above4up_filter <- chr_ids[which(DG_S_above4up%in%chr_ids$V1),2]
DG_S_24down <- DG_S_DE_filter[which(DG_S_DE_filter$count==3),1]
DG_S_24down_filter <- chr_ids[which(DG_S_24down%in%chr_ids$V1),2]
DG_S_above4down <- DG_S_DE_filter[which(DG_S_DE_filter$count==4),1]
DG_S_above4down_filter <- chr_ids[which(DG_S_above4down%in%chr_ids$V1),2]

write.table(DG_S_24up_filter, "DE_IDs/S_DG/S_DG_24up.txt")
write.table(DG_S_above4up_filter, "DE_IDs/S_DG/S_DG_above4up.txt")
write.table(DG_S_24down_filter, "DE_IDs/S_DG/S_DG_24down.txt")
write.table(DG_S_above4down_filter, "DE_IDs/S_DG/S_DG_above4down.txt")

#sanity checks

