#!/bin/bash

# (c) 2023, drmats
# BSD-3-Clause




if [ $# -ne 1 ]; then
    echo "Usage: $(basename $0) [DIR]"
    exit 2
fi

d=$1

if [ -f "$d"/index.txt ]; then rm "$d"/index.txt; fi

ls -1 "$d"/*.jpg | while IFS= read -r line; do
    basename "$line" >> "$d"/index.txt;
done
