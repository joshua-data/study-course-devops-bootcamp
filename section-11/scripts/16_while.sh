#!/bin/bash

counter=2

while true; do
   echo "Looping..."
   echo "Value of counter is $counter."
   counter=$(( $counter * 2 ))
   sleep 1
done

echo "out of the loop"