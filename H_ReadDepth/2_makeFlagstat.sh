# Generate flagstat files summarizing BAM read counts.
# see 3_makeReadCoverage.sh for details about flagstat files
# Note that some workflows generate flagstat files automatically.
# if flagstat file exists for the BAM, simply copy that file
# Information is optional, necessary for normalizing read depth to get copy number

source ./ReadDepth.config

PLOT_LIST="$BPS_DATA/G_PlotList/dat/TCGA_Virus.PlotList.50K.dat"
DATA_LIST="$BPS_DATA/A_Project/dat/TCGA_Virus.samples.dat"

OUTDD="$OUTD/flagstat"
mkdir -p $OUTDD

function make_flagstat {
    BAR=$1
    BAM=$2

    FLAGSTAT="$BAM.flagstat"  # see if this exists
    OUT="$OUTDD/${BAR}.flagstat"

    if [ -f $FLAGSTAT ]; then
        echo "FLAGSTAT file for $BAR exists."
        echo "Copying to $OUT"
        cp $FLAGSTAT $OUT
    else
        echo "Creating FLAGSTAT for $BAR..."
        samtools flagstat $BAM > $OUT
        echo Written to $OUT
    fi
}

while read l; do
# barcode	bam_path	build_id	data_path

# Skip comments and header
[[ $l = \#* ]] && continue
[[ $l = barcode* ]] && continue

# extract sample names
BAR=`echo "$l" | cut -f 1`
BAM=`echo "$l" | cut -f 2`

#echo Processing flagstat $BAR $BAM

make_flagstat $BAR $BAM

done < $DATA_LIST
