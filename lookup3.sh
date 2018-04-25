#!/bin/bash

# lookup3.sh script
# Timothy Hall
# April 25, 2018
# This script is to view & edit "datafile".
# It will:
  # 1: check if datafile exists & if read/write is permitted.
  # 2: if yes, displays a menu of options & asks what the user would like to do.
  # 3: Options include: add entry, delete entry, view entry, exit.

clear

#if else statement to check if datafile is available
if [ ! -w datafile ]
then
  printf "datafile cannot found or $USER does not have read/write permissions.\n"
  # exit 1: general error
  exit 1
fi

#######################################################
# functions for use in the the select statement below #
#######################################################

## displayoptions: shows the list of operations available
function displayoptions () {
  printf "Available operations: \n"
  echo "[1] Add entry"
  echo "[2] Delete entry"
  echo "[3] View entry"
  echo "[4] Exit"
}

## addentry: get input from user and append info to datafile
function addentry () {
  read -p "Please enter the person's first and last name: " firstname lastname
  # if statement to check if person already exists
  if grep -iq "$firstname $lastname" datafile; then
    printf "$firstname $lastname is already in the datafile.\n\n"
    return 1;
  fi
  read -p "Please enter their phone number (including area code): " phone
  # using sed to remove any extra characters (like dashes/parentheses)
  # and then replace the dashes in the correct places
  phone=$(echo "$phone" | sed 's/[^0-9]*//g')
  phone=$(echo "${phone:0:3}-${phone:3:3}-${phone:6:4}")
  read -p "Please enter their address (street, city, state zip): " address
  read -p "Please enter their birthday (m/d/yyyy): " birthday
  read -p "Please enter their salary (in dollars): " salary
  # using sed to remove any non-digit characters (like $) from salary
  salary=$(echo "$salary" | sed 's/[^0-9]*//g')

  # using echo to expand variables & concat with :: between, then append to file
  echo "$firstname $lastname::$phone::$address::$birthday::$salary" >> datafile
  printf "\n$firstname $lastname was added to datafile. Here is the entry: \n"
  # -inF: ignore case, append line number, look in file
  grep -inF "$firstname $lastname" datafile
  echo
}

## deleteentry: will ask user who will be deleted, check if entry exists.
## If no, display error. If yes, remove the entry.
function deleteentry () {
  read -p "Who would you like to remove (first and last name)? " firstname lastname
  # -iq: ignore case, quiet (no output to display)
  if grep -iq "$firstname $lastname" datafile; then
    # sed -i: edit file in place (write directly to file)
    sed -i "/$firstname $lastname/d" datafile
    printf "$firstname $lastname was removed from datafile.\n"
  else
    printf "$firstname $lastname could not be found.\nPlease try again.\n"
  fi
}

## viewentry: searches datafile for given entry and displays any match
function viewentry () {
  read -p "Which entry would you like to view (first and last name): " firstname lastname
# -iq: ignore case, quiet (no output to display)
  if grep -iq "$firstname $lastname" datafile; then
    # -inF: ignore case, append line number, look in file
    grep -inF "$firstname $lastname" datafile
  else
    printf "$firstname $lastname could not be found. Please try again.\n"
  fi
}

#######################################################
# menu to display options and get selection from user #
# and calls the function corresponding to each option #
#######################################################
while true; do
  displayoptions
  read -p "Please select an option: " option
# case statement to run the user-selected option
  case $option in
    1) addentry ;;
    2) deleteentry ;;
    3) viewentry ;;
    4) exit 0 ;; # exits with success
    *) printf "Invalid entry, try again.\n";;
  esac

  read -p "Would you like to select an option again (yes/no)? " yn
  case $yn in
  [yY][eE][sS]|[yY]) echo ;;
  *) exit 0 ;;
  esac
done

# a list of exit codes can be found at
# http://www.tldp.org/LDP/abs/html/exitcodes.html
