#!/bin/bash

cd ../../images/overlap-outline/_gif

for l in {A..Z}
do
    echo "gif-ifying $l"
    magick convert *\_$l\_*.png _gifs/overlap-outline_$l.gif
done
