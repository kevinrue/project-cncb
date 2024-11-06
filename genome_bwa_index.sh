#!/bin/bash

# Resources:
#SBATCH --time=0-0:10:00  # DAYS-HOURS:MINUTES:SECONDS
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=5G
#SBATCH --partition=short

# Environment:
#SBATCH --export=NONE

# What to run:
module load bwa/0.7.18

cd /ceph/project/cncb/albrecht/ensembl

bwa index Drosophila_melanogaster.BDGP6.46.dna.primary_assembly.fa
