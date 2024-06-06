### Outputs
Where outputs from code are directed or moved to

- `fastQC-output/` subdirectory containing fastqc outputs for each sample **AND** multiqc subdirectory
- `kallisto/` subdirectory of kallisto outputs for each sample
- `0513-DEG.tab` list of DEGs generated on 05/13/2024 from hisat workflow
- `1213-DEG.tab` list of DEGs generated on 12/13/2023 from kallisto workflow
- `DEG_Blast_Full_Results.tab` joined list of blast results and DEGs from **kallisto workflow** (`1213-DEG.tab`)
- `DEG_annotations.tab` subset of `DEG_Blast_Full_Results.tab` including just gene id, geneName, baseMean, log2FoldChange, pvalue, padj
- `DEG_blast_cds_full` joined list of blast results and DEGs from **hisat workflow** (`0513-DEG.tab`)
- `GCF_026571515.1.tab`
- 
