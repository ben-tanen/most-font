#!/bin/bash

cd ../images/bw_maps
for f in bw_map_*.png
do
    echo "Processing $f"
    magick convert $f -fuzz 50% -transparent white ../trans_maps/${f/bw_map_/trans_map_}
done