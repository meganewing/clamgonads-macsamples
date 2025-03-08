# R.Phil Egg Seq
Analysis on R. phil oocyte samples provided by Mac. Based off this [isssue](https://github.com/RobertsLab/resources/issues/1748) 

RNA seq analysis was done thrice: using kallisto , hisat, and STAR. STAR count matrixes were chosen for highest read mapping of the three. 

- `code/` has **code** for analyses
- `data/` has **data** for analyses
- `output/` has any **outputs** or files created during analyes

#### figures saved to main directory
- `heatmap_top25_DEGs.png` heatmap of top 25 differentially expressed genes (from hisat workflow)
- `revigo_treemap.pdf` treemap of enriched biological proccesses (from hisat workflow)

##### Software information
- OS: macOS Monterey (v12.7.4)
- RStudio (via Raven) (v2023.03.0; R v4.2.3)
- Kallisto (Linux)(v0.50.1)
- HiSAT (v2.2.1)
- SamTools (v1.12)
- FastQC (v0.12.1)
- FeatureCounts (Linux)(v2.0.5)
- DESeq2 (v1.38.3)
- BLAST (v2.15.0) 

### RNA seq data: oocytes from manila clams (_Ruditapes philippinarum_) treated for 30 days in acidic (7.35 pH) and non-acidic (7.95 pH) conditions.

 Data courtesy of Mackenzie Gavery (NOAA). 

### Data Location
All RNA seq raw data files can be found [here](https://gannet.fish.washington.edu/mewing0/Man_clam_raw/)

  - The `R1` or `R2` in the file names correspond to the read ends
  - Naming schemes for read files can be found in methods writeup linked above (table 1).

### General Workflow
File names for the project are generally formatted `step#-description` for kallisto workflow. Additional workflow with hisat has similar naming scheme, though does not start back at step 1 and rather continues forward from the kallisto workflow. ie: `09- SRhisat_alignment.Rmd` is the start of the hisat workflow.

Old file names / draft code names have leading numbers of date for which the file was created and/or are descriptively named (eg. 1126-exampleheatmap.rmd would be a draft heatmap code that was created on 11/26).

More workflow information available in the `code/` readme
