#!/bin/bash

# Resources:
#SBATCH --time=0-01:00:00  # DAYS-HOURS:MINUTES:SECONDS
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=2G
#SBATCH --partition=short
#SBATCH --job-name=addreadgroup
#SBATCH --output=genome_picard_addreadgroup.%j.out
#SBATCH --error=genome_picard_addreadgroup.%j.err

# Environment:
#SBATCH --export=NONE

# What to run:
module load picard-tools/3.2.0

cd /ceph/project/cncb/albrecht

AddOrReplaceReadGroups \
  -I genome_sequencing/aln-pe.bam \
  -O genome_sequencing/aln-pe.rg.bam \
  -RGID 1 \
  -RGLB lib1 \
  -RGPL ILLUMINA \
  -RGPU unit1 \
  -RGSM Gdna_1
