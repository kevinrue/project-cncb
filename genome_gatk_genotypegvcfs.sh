#!/bin/bash

# Resources:
#SBATCH --time=0-12:00:00  # DAYS-HOURS:MINUTES:SECONDS
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=5G
#SBATCH --partition=short
#SBATCH --job-name=gatk_haplotypecaller_3L
#SBATCH --output=genome_gatk_haplotypecaller_3L.%j.out
#SBATCH --error=genome_gatk_haplotypecaller_3L.%j.err

# Environment:
#SBATCH --export=NONE

# What to run:
module load gatk/4.6.0.0

cd /ceph/project/cncb/albrecht

# see <https://gatk.broadinstitute.org/hc/en-us/articles/360037057852-GenotypeGVCFs>
gatk GenotypeGVCFs \
     -R ensembl/Drosophila_melanogaster.BDGP6.46.dna.primary_assembly.fa \
     -V genome_sequencing/aln-pe.rg.dedup.sorted.all.gvcf \
     -O genome_sequencing/aln-pe.final.vcf
