# Assessing tandem genes in the chromosomes

Procedure:

1. Clustered genes in each scaffold using usearch, with a percentage identity of 98%
2. We strictly followed the definition of tandem gene arrays: A DNA structure in which a gene and associated sequences are repeated in an immediately adjacent position: This resulted in a total number of tandem genes, tandem_genes.txt.
3. Based off of our lists of genes that were either uniquely or differentially expressed, I created two scripts, makegff.sh and makegff_tandem_gff.sh that created gff files for each gene that is in a gene cluster, and is uniquely expressed, or differentially expressed.

Description | Number
-- | --
Total number of genes | 30494
Total number of tandem genes* | 378
% of tandem genes | 0.012

* This is by first dividing the genome into 26 scaffolds (chromosomes), 
and then performing usearch on the individual scaffolds.

## Counting the genes that are uniquely expressed and that are in gene clusters

Description | Number of genes | Total no. of genes | (%) genes 
-- | -- | -- | -- 
DG_specifics | 15 | 621 | 0.024 
HG_DG_specifics | 50 | 913 | 0.055 
HG_S_specifics | 13 | 523 | 0.025
HG_specifics | 11 | 330 | 0.034 
S_DG_specifics | 16 | 1552 | 0.01 
S_specifics | 27 | 2081 | 0.013 

## Counting the differentially expressed genes and that are in gene clusters

**For DG_vs_S**

Description | Number of genes | Total no. of genes | (%) genes
-- | -- | -- | -- 
2_4_downregulated | 27 | 1781 | 0.015
2_4_upregulated | 25 | 1207 | 0.021
above4fold_downregulated | 25 | 1207 | 0.021
above4fold_upregulated |  17 | 855 | 0.02

**For HG_vs_DG**

Description | Number of genes | Total no. of genes | (%) genes 
-- | -- | -- | -- 
2_4_downregulated | 17 | 501 | 0.034
2_4_upregulated | 17 | 515 | 0.033
above4fold_downregulated | 3 | 100 | 0.03
above4fold_upregulated | 6 | 194 | 0.031

**For HG_vs_S**

Description | Number of genes | Total no. of genes | (%) genes | 
-- | -- | -- | -- 
2_4_downregulated | 26 | 1785 | 0.015
2_4_upregulated | 31 | 2496 | 0.013
above4fold_downregulated | 17 | 743 | 0.023
above4fold_upregulated | 25 | 1805 | 0.014
