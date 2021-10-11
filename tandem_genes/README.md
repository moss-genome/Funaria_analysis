# Assessing tandem genes in the chromosomes

Procedure:

1. Clustered genes in each scaffold using usearch, with a percentage identity of 98%
2. We strictly followed the definition of tandem gene arrays: A DNA structure in which a gene and associated sequences are repeated in an immediately adjacent position: This resulted in a total number of tandem genes, tandem_genes.txt.
3. Based off of our lists of genes that were either uniquely or differentially expressed, I created two scripts, makegff.sh and makegff_tandem_gff.sh that created gff files for each gene that is in a gene cluster, and is uniquely expressed, or differentially expressed.

Description | Number
-- | --
Total number of genes | 37426
Total number of tandem genes* | 378
Total number of arrays | 123

* This is by first dividing the genome into 26 scaffolds (chromosomes), 
and then performing usearch on the individual scaffolds.

## Counting the genes that are uniquely expressed and that are in gene clusters

Description | Number of genes | (%) genes | Number of arrays | (%) arrays | More than two genes expressed in array
-- | -- | -- | -- | -- | --
DG_specifics | 6 | 1.6 | 4 | 3.17 | 2 (77, 113)
HG_DG_specifics | 29 | 7.67 | 15 | 12.19 | 13 (1,2,4,5,6,7,19,21,75,80,100,102,123)
HG_S_specifics | 19 | 5.03 | 13 | 6 (4,5,6,7,78,114)
HG_specifics | 16 | 4.23 | 11 | 5 (4,5,6,7,55)
S_DG_specifics | 6 | 1.6 | 4 | 2 (65, 98)
S_specifics | 18 | 4.76 | 12 | 9.75 | 7 (2,4,5,6,7, 28, 112) 

## Counting the differentially expressed genes and that are in gene clusters

**For DG_vs_S**

Description | Number of genes | (%) genes | Number of arrays | (%) arrays | More than two genes expressed in array
-- | -- | -- | -- | -- | --
2_4_downregulated | 8 | 2.11 | 7 | 5.7 | 3 (71, 96, 123)   
2_4_upregulated | 5 | 1.32 | 4 | 3.25 | 1 (7)
above4fold_downregulated | 19 | 5.02 | 13 | 10.57 | 7 (19, 41, 72, 75, 80, 102, 113)
above4fold_upregulated | 8 | 2.11 | 7 | 5.7 | 3 (22, 36, 114) 

**For HG_vs_DG**

Description | Number of genes | (%) genes | Number of arrays | (%) arrays | More than two genes expressed in array
-- | -- | -- | -- | -- | --
2_4_downregulated | 8 | 2.11 | 7 | 5.7 | 3 (20, 36, 123)
2_4_upregulated | 2 | 0.53 | 1 | 0.81 | 1 (2)
above4fold_downregulated | 2 | 0.53 | 1 | 0.81 | 1 (22)
above4fold_upregulated | 2 | 0.53 | 1 | 0.81 | 1 (41)

**For HG_vs_S**

Description | Number of genes | (%) genes | Number of arrays | (%) arrays | More than two genes expressed in array
-- | -- | -- | -- | -- | --
2_4_downregulated | 19 | 5.02 | 14 | 11.38 | 7 (10,20,35,92,96,101,106)
2_4_upregulated | 8 | 2.11 | 7 | 5.7 | 3 (28, 36, 114)
above4fold_downregulated | 21 | 5.56 | 11 | 8.94 | 9 (17,19,42,72,80,100,102,113,123)
above4fold_upregulated | 4 | 1.06 | 3 | 2.44 | 1 (49) 
