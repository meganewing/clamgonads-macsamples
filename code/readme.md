### File Names

naming scheme is `##-description` where ## is the number of the step (step 1 being ran first, step 2 second...) for code relevant to predominant workflow
other files are named descriptively and are extra analyses, older versions of code, example codes from peers, or abandoned chunks.

if multiple versions of same code file (ie. wanting to save a previous version of the code for whatever reason), the ## at the end is the date of last edit on that version

### General Workflow

- `01-RNAseq.Rmd` retireves the raw read files from gannet server
- `02-md5sums.Rmd` checks md5sums for file integrity (this step was skipped)
- `03-fastqc_multiqc.Rmd` runs fastqc and generates multiqc report
- `05-kallisto.Rmd` I apparently forget the number 4 existed.... anyways, runs psuedoalignment of raw reads to transcriptome using kallisto and generates trinity count matrix
- `06-deseq2.Rmd` AND `06-deseq2.html` runs deseq to get list of deg's using trinity count matrix, generates volcano plot and heatmap.
-   - Note that the heatmap for this is weird and should not be paid much attention to. rather, focus on heatmap generated from featurecounts (step 11)
- `07-blast.Rmd` runs BLAST for the transcriptome from ncbi
- `08-join_annotations.Rmd` **final step in kallisto workflow** joins annnotations to DEG output
- `09-SRhisat_alignment.Rmd` **start of hisat workflow** aligns raw reads to genome using hisat, converts sam output to .bam files, and uses feature counts to get a count matrix
- `10-blast_with_cds.Rmd` runs blast for the cds genome from ncbi
- `11-deseq2_with_featurecounts.Rmd` uses featurecounts matrix to run deseq and get a list of DEGs, and generated heatmap of top 25 differentially expressed genes.
- `12-deg_annot_cds.Rmd` **final step of primary hisat workflow** joins cds annotations to DEG output generated in step 11.

#### Extra Stuff
- `13-deg_visualizations.Rmd` code created to try different visualizations for DEGs and play around with the data. didn't yield anything productive.
- `Revigo_BP_TreeMap.r` code to generate tree map of enriched biological processes from Revigo using the DEG associated uniprot accession numbers gained from step 12
- `abandoned_chunks.Rmd` chunks of code that were abandoned for being ineffecient, to buggy (or were me trying different things to debug), or otherwise unneccessary.
- `hisat_alignment-20240416.Rmd` initial (unsuccessful) attempt at hisat
- `ncbireadme.md` and `ncbireadme_ref.md` readmes the came with the ncbi database. not sure why they didn't move with the folder, but I renamed them to not be confused with this subdir readme.
- `readme.md` what you are currently reading
- `zach_03-DESeq2.rmd` an example of deseq code from zach that saved me and helped me debug my own deseq code. 
