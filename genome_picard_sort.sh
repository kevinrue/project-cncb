#!/bin/bash

# Resources:
#SBATCH --time=0-01:00:00  # DAYS-HOURS:MINUTES:SECONDS
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=4G
#SBATCH --partition=short
#SBATCH --job-name=genome_picard_sort
#SBATCH --output=genome_picard_sort.%j.out
#SBATCH --error=genome_picard_sort.%j.err

# Environment:
#SBATCH --export=NONE

# What to run:
module load picard-tools/3.2.0

cd /ceph/project/cncb/albrecht

# see <https://github.com/gatk-workflows/broad-prod-wgs-germline-snps-indels/blob/master/PairedEndSingleSampleWf-fc-hg38.wdl#L761>
SortSam \
  -INPUT genome_sequencing/aln-pe.rg.dedup.bam \
  -OUTPUT genome_sequencing/aln-pe.rg.dedup.sorted.bam \
  -SORT_ORDER coordinate \
  -CREATE_INDEX true \
  -CREATE_MD5_FILE true \
  -MAX_RECORDS_IN_RAM 300000
