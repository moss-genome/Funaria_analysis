# Assessing tandem genes in the chromosomes

Procedure:

1. Clustered genes in each scaffold using usearch, with a percentage identity of 98%
2. We strictly followed the definition of tandem gene arrays: A DNA structure in which a gene and associated sequences are repeated in an immediately adjacent position: This resulted in a total number of tandem genes, tandem_genes.txt.
3. Based off of our lists of genes that were either uniquely or differentially expressed, I created two scripts, makegff.sh and makegff_tandem_gff.sh that created gff files for each gene that is in a gene cluster, and is uniquely expressed, or differentially expressed.

Description | Number
-- | --
Total number of genes | 37426
Total number of tandem genes* | 378

* This is by first dividing the genome into 26 scaffolds (chromosomes), 
and then performing usearch on the individual scaffolds.

## Counting the genes that are uniquely expressed and that are in gene clusters

Description | Number
-- | --
DG_specifics | 6
HG_DG_specifics | 36
HG_S_specifics | 19
HG_specifics | 18
S_DG_specifics | 6
S_specifics | 20

## Counting the differentially expressed genes and that are in gene clusters

**For DG_vs_S**

Description | Number
-- | --
2_4_downregulated | 8
2_4_upregulated | 11
above4fold_downregulated | 51
above4fold_upregulated | 44

**For HG_vs_DG**

Description | Number
-- | --
2_4_downregulated | 8
2_4_upregulated | 2
above4fold_downregulated | 2
above4fold_upregulated | 2

**For HG_vs_S**

Description | Number
-- | --
2_4_downregulated | 25
2_4_upregulated | 11
above4fold_downregulated | 22
above4fold_upregulated | 10
