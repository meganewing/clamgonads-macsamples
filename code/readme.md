### File Names

naming scheme is `##-description` where ## is the number of the step (step 1 being ran first, step 2 second...) for code relevant to predominant workflow
other files are named descriptively and are extra analyses, older versions of code, example codes from peers, or abandoned chunks.

if multiple versions of same code file (ie. wanting to save a previous version of the code for whatever reason), the ## at the end is the date of last edit on that version

### General Workflow

- `01-RNAseq.Rmd` retireves the raw read files from gannet server
- `02-md5sums.Rmd` checks md5sums for file integrity (this step was skipped)
- `03-fastqc_multiqc.Rmd` runs fastqc and generates multiqc report
- `05-kallisto.Rmd` I apparently forget the number 4 existed.... anyways, runs psuedoalignment to transcriptome using kallisto and generates trinity count matrix
- `06-deseq2.Rmd` AND `06-deseq2.html` runs deseq to get list of deg's using trinity count matrix, generates volcano plot and heatmap.
-   - Note that the heatmap for this is weird and should not be paid much attention to. rather, focus on heatmap generated from featurecounts (step 11)
- `07-blast.Rmd` runs BLAST for the transcriptome
- `08-join_annotations` **final step in kallisto workflow** joins annnotations to DEG output
- `09-SRhisat_alignment` **start of hisat workflow** 

