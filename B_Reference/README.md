# Reference

*Reference-specific analysis and files.*

This directory contains gene and exon definitions based on Ensembl releases 75 and 84 which are
used for gene/exon annotation plots, as well as a workflow to recreate it for other Ensembl versions.
This workflow is necessary only if gene/exon definitions need to be recreated for other Ensembl
versions or references.

* `dat/genes.ensXX.bed` contains gene definitions
* `dat/exons.ensXX.bed` contains exon definitions

Workflow parses Ensemble GTF file directly to pull out genes and exons.  Details of the selection process
are in `GTFFilter.py`.  They are ad hoc and vary according to ensembl version.  There may be better and
more standard ways to obtain gene and exon definitions, which would replace the work here.

We also provide a script called `src/TLAExamine.R` (see `x.5_examine_GTF.sh`)
which conveniently examines GTF files by expanding the attributes column into
multiple columns.  It is useful for debugging and understanding these files better.

`2_get_merged_exon_bed.sh` and `3_get_gene_bed.sh` are production scripts which extract genes and exons
    from GTF file.  These need to be run just once and then the resulting features file can be used
    for downstream applications.

Steps starting with x are optional or may be necessary only for certain ensembl releases (including release 84)