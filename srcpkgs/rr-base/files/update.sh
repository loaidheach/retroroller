#/usr/bin/env bash

if update -y ; then
    printf "\n*** SUCCESS ***"
else
    printf "\n*** FAILED ***"
fi 

sleep 2
