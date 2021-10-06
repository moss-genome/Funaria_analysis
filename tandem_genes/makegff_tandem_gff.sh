#!/bin/bash
#SBATCH --job-name=makegff
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 16
#SBATCH --partition=general
#SBATCH --qos=general
#SBATCH --mail-type=END
#SBATCH --mem=50G
#SBATCH -o makegff_%j.out
#SBATCH -e makegff_%j.err

grep -wf /core/projects/EBP/Wegrzyn/Moss/Funaria_ENTAP_ppatens/tandem_gene/tandem.txt HG_DG_specifics.gff3 > HG_DG_tandem_specifics.gff3
