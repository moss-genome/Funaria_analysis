#!/bin/bash
#SBATCH --job-name=subset
#SBATCH -o %x%j.out
#SBATCH -e %x%j.err
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH --cpus-per-task=20
#SBATCH --partition=general
#SBATCH --qos=general
#SBATCH --mem=100G
grep -f 2-4fold_downregulated.txt gene_IDs.txt > 2-4fold_downregulatedgrep.txt
awk '{print $2}' 2-4fold_downregulatedgrep.txt > 2-4fold_downregulatedgrep_protein.txt
grep -f 2-4fold_downregulatedgrep_protein.txt ../mart_export_no_empty.txt > 2-4fold_downregulatedgrep_protein_string.txt
awk '{print $3}' 2-4fold_downregulatedgrep_protein_string.txt > 2-4fold_downregulated_final.txt
