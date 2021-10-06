#!/bin/bash
#SBATCH --job-name=usearch
#SBATCH --mail-type=ALL
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -c 8
#SBATCH --mem=10G
#SBATCH -o %x_%j.out
#SBATCH -e %x_%j.err
#SBATCH --partition=general
#SBATCH --qos=general

module load usearch
module load seqtk

mkdir scaffold_mRNA_1

seqtk subseq /projects/EBP/Wegrzyn/Moss/Funaria/Funaria_Genome_Scaffold/Funaria_hygrometrica.cds.fa genes.txt > scaffold_1.fa
usearch -clusters scaffold_mRNA_1/c_ -cluster_fast scaffold_1.fa -id 0.98 -centroids scaffold_1_clusters.fasta -uc clusters.uc
