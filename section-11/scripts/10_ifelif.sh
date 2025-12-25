#!/bin/bash

value=$(ip addr show | grep -v LOOPBACK | grep -ic mtu)

if [ $value -eq 1 ]
    then echo "1 active newtork interface found."
elif [ $value -gt 1 ]
    then echo "Multiple active network interfaces found."
else
    echo "No active network interface found."
fi