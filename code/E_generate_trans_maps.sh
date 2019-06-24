#!/bin/bash

cd ../images/bw
for f in bw_*.png
do
    echo "Processing $f"
    magick convert $f -fuzz 50% -transparent white ../trans/${f/bw_/trans_}
done

cd ../outline
for f in outline_*.png
do
    echo "Processing $f"
    magick convert $f -fuzz 50% -transparent white ../trans-outline/${f/outline_/trans-outline_}
done
