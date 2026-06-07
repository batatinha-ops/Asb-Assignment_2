#!/bin/bash

cat data/accession_numbers_16S.txt > samples.txt

sed 's/$/_1.fastq.gz/' samples.txt | \
sed 's|^|./trimmed/|' > fastq1.txt

sed 's/$/_2.fastq.gz/' samples.txt | \
sed 's|^|./trimmed/|' > fastq2.txt

paste samples.txt fastq1.txt fastq2.txt | \
sed '1s/^/sample\tfastq_1\tfastq_2\n/' > samplesheet.tsv
