#!/bin/bash

# Variable Declaration
PACKAGES="httpd wget unzip"
SVC="httpd"
# URL='https://www.tooplate.com/zip-templates/2098_health.zip'
# ART_NAME='2098_health'
TEMP_DIR="/tmp/webfiles"

# Installing Dependencies
echo "########################################"
echo "Installing packages."
echo "########################################"

sudo yum install $PACKAGES -y > /dev/null
echo

# Start & Enable Service
echo "########################################"
echo "Start & Enable HTTPD Service"
echo "########################################"

sudo systemctl start $SVC
sudo systemctl enable $SVC
echo

# Creating Temp Directory
echo "########################################"
echo "Starting Artifact Deployment"
echo "########################################"

mkdir -p $TEMP_DIR
cd $TEMP_DIR
echo

wget $1 > /dev/null
unzip $2.zip > /dev/null
sudo cp -r $2/* /var/www/html/
echo

# Bounce Service
echo "########################################"
echo "Restarting HTTPD service"
echo "########################################"

systemctl restart $SVC
echo

# Clean Up
echo "########################################"
echo "Removing Temporary Files"
echo "########################################"

rm -rf $TEMP_DIR
echo

sudo systemctl status $SVC
ls /var/www/html/