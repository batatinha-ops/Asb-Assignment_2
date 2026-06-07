#!/bin/bash

nextflow run nf-core/ampliseq \
    -profile docker \
    -c config/custom.config \
    --input samplesheet.tsv \
    --metadata data/metadata.tsv \
    --FW_primer "CCTAYGGGRBGCASCAG" \
    --RV_primer "GGACTACNNGGGTATCTAAT" \
    --otu_cluster_identity 0.97 \
    --outdir results 
