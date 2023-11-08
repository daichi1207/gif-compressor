#!/bin/bash

if [ "$#" -eq 0 ]; then
    echo "Usage: $0 input_file_name [input_file_name...]"
    exit 1
fi

for input_file in "$@"
do
    if [ ! -f "$input_file" ]; then
        echo "Error: File '$input_file' not found"
        continue
    fi

    output_file="${input_file%.*}_comp.gif"

    gifsicle --optimize=3 --colors 128 --resize=100x100 --delay=4 < "$input_file" > "$output_file"

    if [ $? -eq 0 ]; then
        echo "Compression successful Output file: $output_file"
    else
        echo "Compression failed for $input_file"
    fi
done

