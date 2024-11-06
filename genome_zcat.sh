# all input files downloaded from https://ftp.ensembl.org/pub/release-113/fasta/drosophila_melanogaster/dna/

cd /ceph/project/cncb/albrecht/ensembl

zcat \
  Drosophila_melanogaster.BDGP6.46.dna.primary_assembly.2L.fa.gz \
  Drosophila_melanogaster.BDGP6.46.dna.primary_assembly.2R.fa.gz \
  Drosophila_melanogaster.BDGP6.46.dna.primary_assembly.3L.fa.gz \
  Drosophila_melanogaster.BDGP6.46.dna.primary_assembly.3R.fa.gz \
  Drosophila_melanogaster.BDGP6.46.dna.primary_assembly.4.fa.gz \
  Drosophila_melanogaster.BDGP6.46.dna.primary_assembly.mitochondrion_genome.fa.gz \
  Drosophila_melanogaster.BDGP6.46.dna.primary_assembly.X.fa.gz \
  Drosophila_melanogaster.BDGP6.46.dna.primary_assembly.Y.fa.gz \
  > Drosophila_melanogaster.BDGP6.46.dna.primary_assembly.fa
