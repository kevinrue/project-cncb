#!/bin/bash

# Resources:
#SBATCH --time=0-12:00:00  # DAYS-HOURS:MINUTES:SECONDS
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=5G
#SBATCH --partition=short
#SBATCH --job-name=gatk_haplotypecaller_4
#SBATCH --output=genome_gatk_haplotypecaller_4.%j.out
#SBATCH --error=genome_gatk_haplotypecaller_4.%j.err

# Environment:
#SBATCH --export=NONE

# What to run:
module load gatk/4.6.0.0

cd /ceph/project/cncb/albrecht

# see <https://github.com/gatk-workflows/gatk4-germline-snps-indels/blob/master/haplotypecaller-gvcf-gatk4.wdl#L209>
interval="4"

gatk HaplotypeCaller \
     -R ensembl/Drosophila_melanogaster.BDGP6.46.dna.primary_assembly.fa \
     -I genome_sequencing/aln-pe.rg.dedup.sorted.bam \
     -L ${interval} \
     -O genome_sequencing/aln-pe.rg.dedup.sorted.${interval}.gvcf \
     -contamination 0 \
     -G StandardAnnotation -G StandardHCAnnotation -G AS_StandardAnnotation \
     -GQB 10 -GQB 20 -GQB 30 -GQB 40 -GQB 50 -GQB 60 -GQB 70 -GQB 80 -GQB 90 \
     -ERC GVCF \
     -bamout genome_sequencing/aln-pe.rg.dedup.sorted.${interval}.bamout.bam
