#!/bin/bash
nextflow run nf-core/taxprofiler \
    -profile docker \
    -c custom.config \
    -params-file params.yaml \
    -resume
