#!/bin/bash

# Check if 3 parameters are provided
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <param1> <param2> <param3>"
    exit 1
fi

# Append parameters to roster.txt
echo "$1" >> roster.txt
echo "$2" >> roster.txt
echo "$3" >> roster.txt
