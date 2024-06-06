### Outputs
Where outputs from code are directed or moved to

- `fastQC-output/` subdirectory containing fastqc outputs for each sample **AND** multiqc subdirectory
- `kallisto/` subdirectory of kallisto outputs for each sample

#### Kallisto workflow outputs
- `1213-DEG.tab` list of DEGs generated on 12/13/2023 from kallisto workflow
- `DEG_Blast_Full_Results.tab` joined list of blast results and DEGs from `1213-DEG.tab`
- `DEG_annotations.tab` subset of `DEG_Blast_Full_Results.tab` including just gene id, geneName, baseMean, log2FoldChange, pvalue, padj
- `GCF_026571515.1.tab` full blast results from kallisto workflow (blast with transcriptome). large file. did not mean to push.
- `clam_GO_annotations.csv` and `clam_GO_annotations.tab` same same but different file formats. blast results for degs in kallisto workflow with uniprot accession numbers isolated in new column
- `kallisto.isoform.TPM.not_cross_norm.runTMM.R` kallisto output
- `kallisto.isoform.counts.matrix` trinity count matrix from kallisto
- `kallisto.matrix.tab` trinity count matrix from kallisto saved as .tab file
  

#### HiSAT workflow outputs
- `0513-DEG.tab` list of DEGs generated on 05/13/2024 from hisat workflow
- `DEG_blast_cds_full` joined list of blast results and DEGs from `0513-DEG.tab`
- `cds_from_genomic_headers.txt` intermediate file used when pulling gene id's from blast results
- `clam_GO_annotations_cds_0514.csv` blast results for degs in hisat workflow with uniprot accession numbers isolated in new column
- `goterm_annot_id.csv` trying to link which uniprot accession numbers are associated with each go term. non important file, just playing around
- `heatmap_top25_DEGs.png` heatmap of top 25 genes generated as part of hisat workflow / from featurecounts matrix with deseq
- `log_counts_top.csv` counts of top 25 DEG for each sample
- 



