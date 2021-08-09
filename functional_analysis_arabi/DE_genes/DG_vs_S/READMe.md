The initial fold txt file is in /projects/EBP/Wegrzyn/Moss/Funaria/Funaria_Genome_Scaffold/gene_ids/DE/HG_vs_DG/
The file name is DE_fold.txt

To get the patens gene ID, you'll have to manipulate the geneIDs from the 2nd column of this file.

Start with awk '{print $2, $4}' DE_fold.txt.
Look into this file, and use this expression (if using vim): :s/^.*\(jg[0-9]\)/\1/

You'd end up with the patens gene IDs with the log2foldchanges.
