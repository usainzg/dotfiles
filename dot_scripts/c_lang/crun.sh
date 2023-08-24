#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Please provide exactly one file of extension .c"
    exit 1
fi
# Get the file name from the command line argument

filename=$1

# Print the file name
echo "Running $filename"
gcc -o $filename.out $filename --debug && ./$filename
