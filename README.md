# BPS.TCGA_Virus.Lite 
Example workflows for BreakPoint Surveyor project.  

Comprehensive workflows starting with downloaded data, through processing, and visualization.  See manuscript
for more information.  

Three workflows are represented as git branches:

* `master`: Comprehensive workflow and data for one TCGA virus-positive sample (TCGA-BA-4077-01).
* `1000SV`: Example analysis of discordant reads on publicly available 1000 Genomes sample NA19420
* `Synthetic`: Create and analyze inter-chromosomal breakpoint

Mention FLIPAB=1 here

Performance:

M_RSEM_Expression: 368 seconds.  Includes download of RSEM data.  Can vary length of step 5 by changing number of permutation tests

## Getting Started


### Prerequisites

#### python
Needs to be (currently) 2.7

#### BreakPointSurveyor-Core
Install [BreakPointSurveyor-Core](https://github.com/ding-lab/BreakPointSurveyor-Core) and its prerequisites.  _Required._

#### Tigra-SV

_Optional_.  [Tigra SV site](git clone https://bitbucket.org/xianfan/tigra.git).  To compile, modify Makefile as appropriate, then `make` and `make install`.

`git clone https://bitbucket.org/xianfan/tigra.git`

#### Pindel

_Optional._ [Pindel site](https://github.com/genome/pindel) with installation
instructions.  Note that will need to install
[htslib](https://github.com/samtools/htslib) for both Pindel and Tigra-SV.

#### Perl XML

_Mandatory in_ `Synthetic` _branch._

`cpanm XML::XPath`

#### BWA

[Installation instructions](https://sourceforge.net/projects/bio-bwa/files/).  _Optional_.

#### bcftools

[See instructions here](https://github.com/samtools/bcftools).  Needed for parsing 1000SV VCFs.  _Optional._ 

#### ImageMagick

[See instructions here](https://www.imagemagick.org/script/download.php).  Needed for converting PDF images to PNG.  _Optional._

**TODO** Install this on DC2, make updated PNGs for all output

### Installing BPS Workflow

Install from [GitHub](https://github.com/)

```
git clone --recursive  https://github.com/ding-lab/BreakPointSurveyor-Workflow.git
git checkout <branch>
```

The `1000SV` and `Synthetic` branches can be accessed with `git checkout <branch>` after the clone command.
([Background reading on branches](https://git-scm.com/book/en/v2/Git-Branching-Branches-in-a-Nutshell).)


## Example Workflows and Data Availability

### master branch

Partial data available for TCGA sample TCGA-BA-4077-01 (**provide specifics**).  We do not
provide this dataset, nor the realigned data.

Provide data for steps XXX

#### RNA-Seq Workflow
RNA-Seq RSEM Expression.  Optional, required for expression plot.  Can avoid steps xxx

### 1000SV Branch

**TODO** for each of these, show output

### Synthetic Branch



## Usage
e.g., A_Project/1_...


## Documentation

**TODO** Add manuscript PDF

BPS.TCGA_Virus.Lite contains a series of directories, each of which implements
a stage in the BPS workflow. The order of processing indicated by the stage's letter prefix.  
In general, a given stage may depend on data generated by a preceding stage.
See [BreakPointSurveyor-Core](https://github.com/ding-lab/BreakPointSurveyor-Core) for additional details.

Below are stages associated with the TCGA_Virus.Lite workflow and their description:

* **[A_Reference](A_Reference/README.md)**: Reference-specific analysis and files.
* **[B_ExonGene](B_ExonGene/README.md)**: Generate exon and gene definitions files.
* **[C_Project](C_Project/README.md)**: Create list of BAMs, both realigned WGS and RNA-Seq.  Create BAMs in `Synthetic` branch.
* **[F_PindelRP](F_PindelRP/README.md)**: Run Pindel and process breakpoint predictions.
* **[G_Discordant](G_Discordant/README.md)**: Process realigned BAM file to extract discordant human-virus reads
* **[I_Contig](I_Contig/README.md)**: Create contigs using Tigra-SV and realign them
* **[J_PlotList](J_PlotList/README.md)**: Identify target regions for further processing and visualization
* **[K_ReadDepth](K_ReadDepth/README.md)**: Evaluate read depth in target regions, obtain BAM file statistics for both WGS and RNA-Seq data
* **[L_Expression](L_Expression/README.md)**: Analyze expression in vicinity of integration events using RNA-Seq data. (`master` branch only)
* **[M_RPKM_Expression](M_RPKM_Expression/README.md)**: Analyze expression in vicinity of integration events using TCGA RPKM data. (`master` branch only)
* **[N_DrawBreakpoint](N_DrawBreakpoint/README.md)** Plot breakpoint coordinates from various predictors to breakpoint panel GGP.
* **[O_DrawDepth](O_DrawDepth/README.md)** Create read depth/copy number panel GGP and add breakpoint predictions
* **[P_DrawAnnotation](P_DrawAnnotation/README.md)** Create annotation panel GGP showing genes and exons
* **[Q_DrawHistogram](Q_DrawHistogram/README.md)**: Create histogram panel GGP showing distribution of read depth
* **[T_AssembleBPS](T_AssembleBPS/README.md)**: Assemble GGP panels into BPS structure plot and save as PDF
* **[U_PlotExpression](U_PlotExpression/README.md)**: Create BPS Expression plot based on expression P-values and save as PDF (`master` branch only)

### Output

* [BreakPoint Surveyor Structure Plot](T_AssembleBPS/plots/TCGA-BA-4077-01B-01D-2268-08.AA.chr14.BreakpointSurvey.pdf)
* [BreakPoint Surveyor Expression Plot](U_RPKMBubble/plots/TCGA-BA-4077-01B-01D-2268-08.AA.chr14.FDR.bubble.pdf)


## Authors
Matthew A. Wyczalkowski, m.wyczalkowski@wustl.edu

## License
This software is licensed under the GNU General Public License v3.0

## Acknowledgements
