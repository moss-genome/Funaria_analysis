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
grep -f HG_S_specifics_ids.txt gene_IDs.txt > HG_S_specifics_ids_grep.txt
awk '{print $2}' HG_S_specifics_ids_grep.txt > HG_S_specifics_ids_arabi_proteins.txt
grep -f HG_S_specifics_ids_arabi_proteins.txt mart_export_no_empty.txt > HG_S_specifics_ids_arabi_string.txt
awk '{print $2}' HG_S_specifics_ids_arabi_string.txt > HG_S_specifics_ids_arabi_string_final.txt
