#!/bin/bash

#This script will use the awk and find the ip address caused more 404 errors in log files
#Check if the log file is provided as an argument

if [ -z "$1" ]; then
  echo "Usage: $0 <log_file>"
  exit 1
fi

log_file="$1"

#Check if the log file exists
if test -f $log_file; then
  #Loop through all log files in the log file
    awk '{ if ($11 == 404) print $9 }' $log_file | sort | uniq -c |sort -nr | head -n 5
fi


