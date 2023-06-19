#!/bin/bash

# (c) 2023, drmats
# BSD-3-Clause




if [ $# -ne 2 ]; then
    echo "Usage: $(basename $0) [IN-DIR] [OUT-DIR]"
    exit 2
fi

ind=$1
outd=$2

if ! [ -d "$outd" ]; then mkdir "$outd"; fi

for file in "$ind"/*; do
    base=$(basename "$file");
    minbase="./$outd/$base";
    echo -ne "."
    if ! [ -f "$minbase" ]; then
        convert \
            -strip \
            -interlace Plane \
            -gaussian-blur 0.05 \
            -quality 85% \
            "$file" \
            -resize 512x512 \
            ./"$outd"/"$base";
    fi
done

echo ""
