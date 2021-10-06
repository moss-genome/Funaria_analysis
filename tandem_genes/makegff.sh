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

for f in */ ; do
        cd "$f"
        echo "$f"
        cat *.txt ../genes.txt >> ../genes.txt
        cd ..
done

grep -wf genes.txt /core/projects/EBP/Wegrzyn/Moss/Funaria_ENTAP_ppatens/Funaria_hygrometrica.mRNA.gff3 > DG_specifics.gff3
