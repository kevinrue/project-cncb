#!/bin/bash

# Resources:
#SBATCH --time=0-0:01:00  # DAYS-HOURS:MINUTES:SECONDS
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=10G
#SBATCH --partition=short
#SBATCH --job-name=gatk_index
#SBATCH --output=genome_gatk_index.%j.out
#SBATCH --error=genome_gatk_index.%j.err

# Environment:
#SBATCH --export=NONE

# What to run:
module load gatk/4.6.0.0
module load samtools/1.17

cd /ceph/project/cncb/albrecht

# see <https://gatk.broadinstitute.org/hc/en-us/articles/360035531652-FASTA-Reference-genome-format>
gatk CreateSequenceDictionary -R ensembl/Drosophila_melanogaster.BDGP6.46.dna.primary_assembly.fa
samtools faidx ensembl/Drosophila_melanogaster.BDGP6.46.dna.primary_assembly.fa
