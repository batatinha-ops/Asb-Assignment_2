#!/bin/bash

while read accn; do

    echo "Downloading $accn..."

    fasterq-dump ${accn}

    head -n 8000 ${accn}_1.fastq | gzip > trimmed/${accn}_1.fastq.gz
    rm ${accn}_1.fastq

    head -n 8000 ${accn}_2.fastq | gzip > trimmed/${accn}_2.fastq.gz
    rm ${accn}_2.fastq

done < data/accession_numbers_16S.txt
