#!/bin/bash

USR="devops"

for HOST in $(cat remhosts); do

   echo
   echo "###########################################################"
   echo "Connecting to $HOST"
   echo "Pushing Script to $HOST"
   scp multios_websetup.sh $USR@$HOST:/tmp/
   echo "Executing Script on $HOST"
   ssh $USR@$HOST "sudo /tmp/multios_websetup.sh"
   ssh $USR@$HOST sudo rm -rf /tmp/multios_websetup.sh
   echo "###########################################################"
   echo

done