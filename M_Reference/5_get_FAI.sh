# Obtain FAI file. (Details: https://www.biostars.org/p/11523/#11524 )

# Distributed with FAI file for GRCh37-lite-build37 reference

OUT="dat/GRCh37-lite.fa.fai"

function get_fai {
scp linus300:/gscmnt/ams1102/info/model_data/2869585698/build106942997/all_sequences.fa.fai $OUT
}

# alternatively, could just make soft link to file on local disk
function link_fai {
ln -s /gscmnt/ams1102/info/model_data/2869585698/build106942997/all_sequences.fa.fai $OUT
}

get_fai
# link_fai