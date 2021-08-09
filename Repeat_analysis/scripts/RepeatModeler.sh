#!/bin/bash
#SBATCH --job-name=RepeatModeler
#SBATCH -o %x%j.out
#SBATCH -e %x%j.err
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH --cpus-per-task=20
#SBATCH --partition=general
#SBATCH --qos=general
#SBATCH --mem=100G

module unload perl/5.28.0
module load perl/5.24.0
export PERL5LIB=/UCHC/PublicShare/szaman/perl5/lib/perl5/
module load RepeatModeler/2.01
module load genometools/1.6.1
module load mafft/7.471
export LTRRETRIEVER_PATH=/labs/Wegrzyn/annotationtool/software/LTR_retriever
module load cdhit/4.8.1
module load ninja/0.95

org=/projects/EBP/Wegrzyn/Moss/Funaria/Funaria_Genome_Scaffold

BuildDatabase -name Funaria $org/Funaria_hygrometrica.fa

nohup RepeatModeler -database Funaria -pa 20 -LTRStruct
