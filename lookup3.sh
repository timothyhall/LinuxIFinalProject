#!/bin/bash

# lookup.sh script
# Timothy Hall
# April 27, 2018
# This script will take the list of contacts in datafile and output
# the contacts in order by last name.

# set -e will exit the script if a command exits with a non-zero status.
set -e
clear

#if else statement to check if datafile is available
if [ ! -e datafile ]
then
  echo "datafile not found"
  exit 1
fi

## functions for use in the the select statement below
function addentry () {
  read -p "Please enter the person's first and last name: " firstname lastname
  read -p "Please enter their phone number: " phone
  ## the following 2 lines remove any extra characters (like dashes or parentheses)
  ## and then adds back the hyphens in the correct places
  phone=$(echo "$phone" | sed 's/[^0-9]*//g')
  phone=$(echo "${phone:0:3}-${phone:3:3}-${phone:6:4}")
  read -p "Please enter their address: " address
  read -p "Please enter their birthday (m/d/yyyy): " birthday
  read -p "Please enter their salary (in dollars): " salary
  salary=$(echo "$salary" | sed 's/[^0-9]*//g')
}

function deleteentry () {
  #statements
  read -p "What person would you like to delete? " firstname lastname

}

function viewentry () {
  #statements
  echo "Here are the contacts of datafile sorted by last name:"
  # using sort command to sort the contents
  # the -k 2 argument specifies the sort to start by the 2nd field of each line
  # the space between first & last name separates them into separate fields for sort
  sort -k 2 datafile #> datafile
  #cat -n datafile
}

echo "Available operations: \n"
# menu to select options
while true; do
  PS3="What would you like to do with the datafile: "
select option in \
  'Add entry' \
  'Delete entry' \
  'View entry' \
  'Exit'
do
  case $REPLY in
    1) addentry ;;
    2) deleteentry ;;
    3) viewentry ;;
    4) exit 1 ;;
    *) printf "invalid selection\n";;
  esac
done
done

# creating variable "entries" to hold the number of lines/entries in the datafile
entries=$(cat datafile | wc -l)
printf "number of entries in datafile: $entries\n"

# read -p "Would you like to add another entry to datafile? " yn
case $yn in
  [yY][eE][sS]|[yY]) echo "You chose to add an entry.";;
  * ) exit 1;;
esac


echo "$firstname $lastname::$address::$birthday::$salary" >> datafile

sort -k 2 datafile
