#!/bin/bash

# lookup.sh script
# Timothy Hall
# April 27, 2018
# This script will take the list of contacts in datafile and output
# the contacts in order by last name.

# set -e will exit the script if a command exits with a non-zero status.
set -e

#if else statement to check if datafile is available
if [ -e datafile ]
then
  echo "Here are the contacts of datafile sorted by last name:"
else
  echo "datafile not found"
  exit 1
fi

echo #blank line for readability

# using sort command to sort the contents
# the -k 2 argument specifies the sort to start by the 2nd field of each line
# the space between first & last name separates them into separate fields for sort
sort -k 2 datafile
echo

# creating variable "entries" to hold the number of lines/entries in the datafile
entries=$(cat datafile | wc -l)
printf "number of entries in datafile: $entries\n"

while true; do
  read -p "Would you like to add an entry to datafile?" yn
  case $yn in
    []
