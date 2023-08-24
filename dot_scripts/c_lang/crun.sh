#!/bin/bash

# Get the file name from the command line argument
filename=$1

# Print the file name
echo "Running $filename"
gcc -o $filename.out $filename && ./$filename
