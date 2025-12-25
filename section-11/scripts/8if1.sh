#!/bin/bash

read -p "Enter a number: " NUM

echo

if [ $NUM -gt 100 ]
then
   echo "You have entered in IF block."
   sleep 3
   echo "Your number is greater than 100."
   echo
   date
else
   echo "Your number is equal to or less than 100."
fi

echo "Script execution completed successfully."