#!/bin/bash

# lookup1.sh script
# Timothy Hall
# April 25, 2018
# This script will take the list of contacts in datafile and
# display the them in order by last name.

echo "Here are the contacts of datafile sorted by last name:"
echo #blank line for readability

# using sort command to sort the contents
# the -k 2 argument specifies the sort to start by the 2nd field of each line
# the space between first & last name separates them into separate fields for sort
sort -k 2 datafile
echo

# creating variable "entries" to hold the number of lines/entries in the datafile
entries=$(cat datafile | wc -l)
printf "number of entries in datafile: $entries\n"
