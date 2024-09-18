#!/bin/bash
# This will check if the file exists which is given as parameter.
# check if that file has executable permission by passing the filename as a positional parameter


if [ -f "$1" ]; then
    if [ -x "$1" ]; then
        echo "The file '$1' is executable."
    else
        echo "The file '$1' is not executable."
    fi
else
    echo "The file '$1' does not exist."
fi