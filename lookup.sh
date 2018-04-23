#!/bin/bash

# lookup.sh script
# Timothy Hall
# April 27, 2018
# This script will take the list of contacts in datafile and output
# the contacts in order by last name.
set -e

if [ -e datafile ]
then
  echo "datafile found"
else
  echo "datafile not found"
  exit 1
fi
