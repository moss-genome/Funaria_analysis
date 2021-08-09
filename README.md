# Funaria functional analysis

Updated list of other resources used thus far: [Google doc](https://docs.google.com/document/d/10FL7RdmHAUGKW-YVilgvltOUIaDC_zCnbXXRUEyI4NM/edit?usp=sharing)

We set out to analyse the set of uniquely expressed, silenced and differentiated genes between the Haploid/Diploid gametophyte and the sporophyte. We performed functional annotation with EnTAP, and then visualised the genes in networks created by StringDB.

## Process

1. Gathered gene IDs from the lists of DE genes and uniquely silenced genes
2. Ran EnTAP against Physcomitrium patens and Arabidopsis thaliana
3. Used the gene IDs from the output of EnTAP as an input to the StringDB.


# Repeat analysis

We developed a list of repeats with coordinates using repeat modeler and then summarized the proportion of each repeat type and created a circos plot of their location across the genome including per chromosome. 

## Process


1) Run RepeatModeler - Shell script [here](https://docs.google.com/document/d/1lgETHuw_ZBMP0Ky9XdFrlX3yoQZPSBNtIflh-m9mM0s/edit). Results summary [here](https://docs.google.com/document/d/1WRr2AFFCEu0tMKepeJ9-VhJiNRb7WYKFKd6d4owjM0A/edit)
2) Trim the GFF file to only 26 scaffolds (/archive/projects/EBP/Funaria_repeats/repeatmodeler/Funaria_Genome_Scaffold_mask/Funaria_26scaffolds.gff)
3) Summary of types of repeats: 

Proportion and number of unique: 

![image](https://user-images.githubusercontent.com/23173110/126549149-de54fca3-48f4-4d47-8e1c-ddde050e15fa.png)



4) Summary of length of repeats:


![image](https://user-images.githubusercontent.com/23173110/126549351-7f009977-e9b8-4247-9469-36663e880c16.png)
