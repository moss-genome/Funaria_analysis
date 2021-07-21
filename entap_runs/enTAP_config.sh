#!/bin/bash
#SBATCH --job-name=entap
#SBATCH --mail-user=vidya.vuruputoor@uconn.edu
#SBATCH --mail-type=ALL
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -c 8
#SBATCH --mem=40G
#SBATCH -o entap_%j.out
#SBATCH -e entap_%j.err
#SBATCH --partition=general
#SBATCH --qos=general

module load anaconda/2.4.0
module load perl/5.30.1
module load diamond/0.9.25
module load interproscan/5.25-64.0  

/labs/Wegrzyn/EnTAP/EnTAP_v0.10.7/EnTAP/EnTAP --config -t 8 --ini entap_config_0.10.7.ini -d Physcomitrium_patens.Phypa_V3.pep.all.fa -d plant_refseq.fa



