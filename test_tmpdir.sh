#!/bin/bash

# Resources:
#SBATCH --time=0-00:1:00  # DAYS-HOURS:MINUTES:SECONDS
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=2G
#SBATCH --partition=short
#SBATCH --job-name=test
#SBATCH --output=test_tmpdir.%j.out
#SBATCH --error=test_tmpdir.%j.err

# Environment:
#SBATCH --export=NONE

# What to run:
#module load gatk/4.6.0.0

echo $TMPDIR
ls -lh $TMPDIR
