# ***Assignment 02-ASB***
A repository for the second assignment of "Análise de Sequências Biológicas" from the bioinformatics course at the Barreiro Higher School of Technology.

## Description
The objective of this project was to reproduce part of the bioinformatics analysis presented in the paper:

***Exploring the Association Between Cervical Microbiota and HR-HPV Infection Based on 16S rRNA Gene and Metagenomic Sequencing***

The main goal was to analyse cervical microbiome 16S rRNA sequencing data and Metagenomic sequencing and compare microbial diversity between HR-HPV infected and control individuals.

---
## Obtaining the Data
The data used in this work was obtained from the NCBI Sequence Read Archive using the accession numbers PRJNA846153 (for the 16S rRNA sequencing) and PRJNA847258 (for the metagenomic sequencing). 

---
## Required programs
The following list of programs were used during the analysis (installed via conda):
1.	Nextflow v26.04.3 
2.	nf-core/taxprofiler v2.0.0 
3.	Bowtie2 v2.2.4
4.	Kraken2 v2.1.3 
5.	HUMAnN2 v2.8.2
6.	sra-tools v3.4.1
7.	Docker v29.5.2

---
## Workflow for 16S sequencing
### Step 1 - Obtaining the reads
Download the metadata and a .txt file with the accession numbers in NCBI-SRA;

### Step 2 - Downloading the read
Read the accession numbers and download fastq files from them (the reads size can be adjusted at choice in "head" number), the used script is avaiable at:
[01_download_reads.sh](scripts/01_download_reads.sh)

### Step 3 - Generate samplesheet
Creating the samplesshet so nextflow knows which reads need to be readen and where are the files from, used script avaiable at:
[02_create samplesheet.sh](scripts/02_create%20samplesheet.sh)

### Extra - Necessary before proceding
Before following to the next step it is necessary the creation of a file for configuration of the pipeline configs and limits (used CPUs and RAM)
Example in: [custom.config](scripts/custom.config)
The numbers used in the example can be edited according to the host computer especifications.

### Step 4 - Nextflow
Running the nf-core/ampliseq pipeline using nextflow, script at:
[03_run_nextflow.sh](scripts/03_run_nextflow.sh)

---
## Results
To view the results can resort to:
```
python3 -m http.server
```
For visualizing additional graphs, R was used, scripts avaiable at:
[Diferencial_abundance](R_scripts/Diferencial_abundance)
[Taxonomic_assignment](R_scripts/Taxonomic_assignment)
[Venn_graph](R_scripts/Venn_graph)

---
## Workflow for Metagenomics sequencing
### Step 1 - Download the read
Read the accession numbers and download fastq files from them
[obtain_reads](metagenomics_scripts/obtain_reads)


### Step 2 - Generate samplesheet
Create samplesheet as in 16S
[samplesheet.sh](metagenomics_scripts/samplesheet.sh)

### Extra - Necessary before proceding
Before following to the next step it is necessary the creation of a file for configuration of the pipeline configs and limits (used CPUs and RAM)
Example in: [custom.config](metagenomics_scripts/custom.config)
Furthermore is also necessary an aditional file defining the parameters 
Example in: [parameters](metagenomics_scripts/parameters)

### Step 3 - Nextflow-taxprofiller
Scrip used to run taxprofiller:
[taxprofiler](metagenomics_scripts/taxprofiler.sh)

### Step 4 - Humann2
Scrip used to run Humann2:
[humann2](metagenomics_scripts/humann2)
