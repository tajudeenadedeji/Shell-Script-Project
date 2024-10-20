#!/bin/bash

USER="deji"

for host in `cat hosts`
do
    echo
    echo "###############################"
    echo "connecting to $host"
    echo "Pushing the shell script to $host"
    scp multios.sh $USER@$host:/tmp/
    echo "Executing the shell script on $host"
    ssh $USER@$host sudo /tmp/multios.sh
    ssh $USER@$host sudo rm -rf /tmp/multios.sh
    echo "###############################"
done
