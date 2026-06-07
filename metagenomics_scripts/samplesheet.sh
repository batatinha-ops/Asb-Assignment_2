#!/bin/bash

echo "sample,run_accession,instrument_platform,fastq_1,fastq_2" > samplesheet.csv
for r1 in "$DATA_DIR"/*_1.fastq.gz; do
[ -e "$r1" ] || continue
sample=$(basename "$r1" _1.fastq.gz)
r2="$DATA_DIR/${sample}_2.fastq.gz"
if [ ! -f "$r2" ]; then
echo "WARNING: missing pair for $sample" >&2
continue
if
echo "${sample},${sample},ILLUMINA,$r1,$r2" >> samplesheet.csv
done
