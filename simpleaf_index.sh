#!/bin/bash

# Resources:
#SBATCH --time=0-1:00:00  # DAYS-HOURS:MINUTES:SECONDS
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=16
#SBATCH --mem=10G
#SBATCH --partition=short
#SBATCH --job-name=simpleaf_index
#SBATCH --output=simpleaf_index.%j.out
#SBATCH --error=simpleaf_index.%j.err

# Environment:
#SBATCH --export=NONE

# What to run:
module load gatk/4.6.0.0
module load samtools/1.17

cd /ceph/project/cncb/albrecht

apptainer exec \
  --bind /ceph/project/cncb/albrecht/ensembl \
  --bind /ceph/project/cncb/albrecht/containers \
  /ceph/project/cncb/albrecht/containers/cncb-2.sif \
    bash -c 'export ALEVIN_FRY_HOME=/ceph/project/cncb/albrecht/ensembl/af_home && \
    simpleaf set-paths && \
    simpleaf index \
    --output /ceph/project/cncb/albrecht/ensembl/alevin_index \
    --fasta /ceph/project/cncb/albrecht/ensembl/Drosophila_melanogaster.BDGP6.46.dna.primary_assembly.fa \
    --gtf /ceph/project/cncb/albrecht/ensembl/Drosophila_melanogaster.BDGP6.46.113.gtf.gz \
    --rlen 150 \
    --threads 16 \
    --use-piscem'
