# Prioritize Discordant clusters based on number of breakpoints
# The idea is to focus on integration events with the most breakpoints in them.
# this is particularly useful when using techniques like discordant reads high false positive raters

source ./BPS_Stage.config
# Retain top 25 clusters per sample to use to create PlotList
NCLUST=25


U_DATDD="dat.untracked/BPC"
OUTDD="$OUTD/BPC"
mkdir -p $OUTDD

function process {
    BAR=$1

    DAT="$U_DATDD/${BAR}.Discordant-cluster.BPR.dat"
    OUT="$OUTDD/${BAR}.Discordant-prioritized.BPR.dat"

    head -n1 $DAT > $OUT
    grep -v breakpointCount $DAT | sort -k7 -nr | head -n $NCLUST >> $OUT

    echo Written to $OUT
}

while read l; do  # iterate over all barcodes
    [[ $l = \#* ]] && continue
    [[ $l = barcode* ]] && continue

    BAR=`echo $l | awk '{print $1}'`
    process $BAR

done < $SAMPLE_LIST

