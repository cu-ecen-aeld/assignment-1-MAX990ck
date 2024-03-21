#!/bin/bash

# Check if the required arguments are provided
if [ $# -ne 2 ]; then
    echo "Usage: $0 <writefile> <writestr>"
    exit 1
fi

writefile="$1"
writestr="$2"

#path=$( echo ${writefile%/*} )
#file=$( echo ${writefile##*/} )
#echo $path
#echo $file
# Create the directory path if it doesn't exist
mkdir -p "$(dirname "$writefile")"

# Write the string to the file, overwriting if it already exists
echo "$writestr" > "$writefile"

# Check if the file was created successfully
if [ $? -ne 0 ]; then
    echo "Error: Could not create the file $writefile"
    exit 1
else
    echo "Content has been successfully written to $writefile"
fi

