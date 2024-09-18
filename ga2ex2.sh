#!/bin/bash
# a shell script to cat the content of the roster.txt file into an array named: ROSTERARRAY and echo the 2nd element of the array


# read the content of the roster.txt file into an array named ROSTERARRAY
ROSTERARRAY=( $(cat roster.txt) )
echo $ROSTERARRAY