#!/bin/bash

#This script will use sed to uncomment a required commented line and update the value
config_name="bind-address"
config_value="0.0.0.0"
#Check if the first argument is provided
if [ -z "$1" ]; then
    echo "Please provide the path to the configuration file as an argument."
    exit 1
else 
    sed -i -e '/bind-address/{s/127.0.0.1/0.0.0.0/; s/^#//;}' $1
fi
