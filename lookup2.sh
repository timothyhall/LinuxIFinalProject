#!/bin/bash

# lookup2.sh script
# Timothy Hall
# April 25, 2018
# This script will take the list of contacts in datafile and
# display the contacts in order by last name.
# It will then ask whether a user wants to add another entry.
# If yes, it will ask for the entry's name, phone#, address, birthday, & salary
# and then append those to datafile (with proper formatting).
# Lastly, it will sort datafile & display the entry preceded by the line number

clear
# using sort command to sort the contents
# the -k 2 argument specifies the sort to start by the 2nd field of each line
# the space between first & last name separates them into separate fields
printf "Current contents of datafile: \n"
sort -k 2 datafile
echo #blank line for readability

# creating variable "entries" to hold the number of lines in the datafile
entries=$(cat datafile | wc -l)
printf "Number of entries in datafile: $entries\n"

## statement asking if user wants to add an entry
read -p "Would you like to add another entry to datafile? " yn
case $yn in
  [yY][eE][sS]|[yY]) echo "You chose to add an entry.";;
  * ) exit 1;;
esac
echo #blank line

## prompts to get user input & append them to the datafile
read -p "Please enter the person's first and last name: " firstname lastname
read -p "Please enter their phone number: " phone
# the following 2 lines remove any extra characters (like dashes or parentheses)
# and then replaces the hyphens in the correct places
phone=$(echo "$phone" | sed 's/[^0-9]*//g')
phone=$(echo "${phone:0:3}-${phone:3:3}-${phone:6:4}")
read -p "Please enter their address: " address
read -p "Please enter their birthday (m/d/yyyy): " birthday
read -p "Please enter their salary (in dollars): " salary
# using sed to remove any non-digit characters from salary
salary=$(echo "$salary" | sed 's/[^0-9]*//g')

# using echo to expand variables & concat with :: between variables then append to datafile
echo "$firstname $lastname::$phone::$address::$birthday::$salary" >> datafile
printf "$firstname $lastname was added to datafile. "

# sorting datafile by the 2nd field of each line & saving result
sort -k 2 datafile -o datafile
printf "datafile was sorted by last name. Here is your entry: \n"

# searching for first & last name in datafile
# -inF: ignore case, append line number, look in file
grep -inF "$firstname $lastname" datafile
