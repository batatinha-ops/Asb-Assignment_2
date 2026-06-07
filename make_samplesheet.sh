#!/bin/bash
DATA_DIR="/home/tiago/metabarcoding/data"
echo "sample, run_accession, instrument_platform, fastq_1, fastq_2" > samplesheet.cs
V
for rl in "$DATA_DIR"/*_1.fastq.gz; do
done
[ -e "$r1" ] || continue
sample=$(basename "$r1" _1.fastq.gz) r2="$DATA_DIR/${sample}_2.fastq.gz"
if [ ! -f "$r2" ]; then
echo "WARNING: missing pair for $sample" >&2 continue
fi
echo "${sample}, ${sample}, ILLUMINA, $r1, $r2" >> samplesheet.csv
