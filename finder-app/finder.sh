#!/bin/bash

# Check if the required arguments are provided
if [ $# -ne 2 ]; then
    echo "Usage: $0 <filesdir> <searchstr>"
    exit 1
fi

filesdir="$1"
searchstr="$2"

# Check if filesdir exists and is a directory
if [ ! -d "$filesdir" ]; then
    echo "$filesdir is not a directory or does not exist"
    exit 1
fi
num_files=0
num_matches=0
# Function to search for the string in files recursively
for file in "$filesdir"/*; do
	if [ -f "$file" ]; then
		((num_files++))
		matches=$(grep -c "$searchstr" "$file")
		((num_matches+=matches))
	fi
done
echo "$num_files num_matchs"
echo "The number of files are $num_files and the number of matching lines are $num_matches"

