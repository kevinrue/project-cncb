#!/bin/bash

# Resources:
#SBATCH --time=0-02:00:00  # DAYS-HOURS:MINUTES:SECONDS
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=12
#SBATCH --mem=10G
#SBATCH --partition=short

# Environment:
#SBATCH --export=NONE

# What to run:
module load bwa/0.7.18

cd /ceph/project/cncb/albrecht

bwa mem \
  -t 12 \
  ensembl/Drosophila_melanogaster.BDGP6.46.dna.primary_assembly.fa \
  /ceph/project/cncb/shared/proj140/analyses/novogene_sequencing/genome/download/X204SC24080649-Z01-F001/01.RawData/Gdna_1/Gdna_1_EKDN240047675-1A_22FVLJLT4_L5_1.fq.gz \
  /ceph/project/cncb/shared/proj140/analyses/novogene_sequencing/genome/download/X204SC24080649-Z01-F001/01.RawData/Gdna_1/Gdna_1_EKDN240047675-1A_22FVLJLT4_L5_2.fq.gz \
   > genome_sequencing/aln-pe.sam
