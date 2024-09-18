#!/bin/bash
#a shell script that redirects the content of roster.txt into an array, uses a for loop to cycle through the array's contents, and then uses the command to make a directory for each name listed in the array in your home directory, echo a message telling the user the path of the directory just created


# Redirect the content of roster.txt into an array
roster=($(cat roster.txt))


# Loop through the array's contents
for name in "${roster[@]}"; do

    # Create a directory for each name in your home directory
    mkdir -p $HOME/$name
    # Echo a message telling the user the path of the directory just created
    echo "Directory created for $name: $HOME/$name"

#list the content of the home directory to show the success of the script,

ls -l $HOME

done