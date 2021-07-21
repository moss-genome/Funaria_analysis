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
element	number	total	proportion
copia 	 67	    495	  0.135354
gypsy	   92   	495	  0.185859
helitron 15	    495	  0.030303
unknown	305	    495	  0.616162
4) Summary of length of repeats:
Type  	             Length	          Total	         Proportion
DNA/Kolobok-H	        83733	          113490427.2	   0.000737798
DNA/Zisupton	        31265	          113490427.2	   0.000275486
RC/Helitron	          1694599	        113490427.2	   0.014931647
rRNA	                176104	        113490427.2	   0.001551708
Simple_repeats	      28120	          113490427.2	   0.000247774
SINE?	                52760	          113490427.2	   0.000464885
snRNA	               35734	          113490427.2	   0.000314864
  tRNA	              115561	        113490427.2	   0.001018244
unknown	              9530951	        113490427.2	   0.08398022
LTR/Copia	           60956975	      113490427.2	   0.53711116
LTR/Gypsy	           40784625.2	    113490427.2	   0.359366214




