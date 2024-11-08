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

# see <https://github.com/gatk-workflows/gatk4-germline-snps-indels/blob/master/haplotypecaller-gvcf-gatk4.wdl#L209>
intervals=(2L 2R 3L 3R 4 mitochondrion_genome X Y)

input_files=""
for interval in ${intervals[@]}; do
    input_files += "-I genome_sequencing/aln-pe.rg.dedup.sorted.${interval}.gvcf "
done

gatk SortVcf \
     ${input_files} \
     -O genome_sequencing/aln-pe.rg.dedup.sorted.all.gvcf

## The manual way:
# gatk SortVcf \
#      -I genome_sequencing/aln-pe.rg.dedup.sorted.2L.gvcf \
#      -I genome_sequencing/aln-pe.rg.dedup.sorted.2R.gvcf \
#      -I genome_sequencing/aln-pe.rg.dedup.sorted.3L.gvcf \
#      -I genome_sequencing/aln-pe.rg.dedup.sorted.3R.gvcf \
#      -I genome_sequencing/aln-pe.rg.dedup.sorted.4.gvcf \
#      -I genome_sequencing/aln-pe.rg.dedup.sorted.mitochondrion_genome.gvcf \
#      -I genome_sequencing/aln-pe.rg.dedup.sorted.X.gvcf \
#      -I genome_sequencing/aln-pe.rg.dedup.sorted.Y.gvcf \
#      -O genome_sequencing/aln-pe.rg.dedup.sorted.all.gvcf
