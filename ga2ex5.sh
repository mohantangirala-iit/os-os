#!/bin/bash
# Using a while loop this will create directories in /tmp directory.
# Directory name
dir_name="/tmp"

declare -a targetnames=($(cat $1))

len=${#targetnames[@]}
i=0
while [ $i -lt $len ]; do
  # Remove leading and trailing whitespaces
  targetnames[$i]=${targetnames[$i]##*( )}

   #Check if the directory exists
   if [ -d "$dir_name/${targetnames[$i]}" ]; then
        echo "Directory already exists: $dir_name/${targetnames[$i]}"
        echo "$dir_name/${targetnames[$i]}" >> duplicates.txt
    else
        echo "Directory created: $dir_name/${targetnames[$i]}"
        mkdir "$dir_name/${targetnames[$i]}"
        echo "Directory created: $dir_name/${targetnames[$i]}"
        # Check if the directory creation was successful
        if [ $? -ne 0 ]; then
            echo "Failed to create directory: $dir_name/${targetnames[$i]}"
        fi
   fi
  let i++
done
