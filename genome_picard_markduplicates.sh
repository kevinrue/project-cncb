#!/bin/bash

# Resources:
#SBATCH --time=0-01:00:00  # DAYS-HOURS:MINUTES:SECONDS
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=4G
#SBATCH --partition=short
#SBATCH --job-name=markduplicates
#SBATCH --output=genome_picard_markduplicates.%j.out
#SBATCH --error=genome_picard_markduplicates.%j.err

# Environment:
#SBATCH --export=NONE

# What to run:
module load picard-tools/3.2.0

cd /ceph/project/cncb/albrecht

# see <https://github.com/gatk-workflows/broad-prod-wgs-germline-snps-indels/blob/master/PairedEndSingleSampleWf-fc-hg38.wdl#L1007>
MarkDuplicates \
  -INPUT genome_sequencing/aln-pe.rg.bam \
  -OUTPUT genome_sequencing/aln-pe.rg.dedup.bam \
  -METRICS_FILE genome_sequencing/aln-pe.rg.dedup..metrics.txt \
  -VALIDATION_STRINGENCY SILENT \
  -OPTICAL_DUPLICATE_PIXEL_DISTANCE 2500 \
  -ASSUME_SORT_ORDER "queryname" \
  -CLEAR_DT "false" \
  -ADD_PG_TAG_TO_READS false
