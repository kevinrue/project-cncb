#!/bin/bash

# Resources:
#SBATCH --time=0-00:15:00  # DAYS-HOURS:MINUTES:SECONDS
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=12
#SBATCH --mem=10G
#SBATCH --partition=short

# Environment:
#SBATCH --export=NONE

# What to run:
module load samtools/1.17

cd /ceph/project/cncb/albrecht

samtools sort -@ 12 genome_sequencing/aln-pe.bam > genome_sequencing/aln-pe.sorted.bam
