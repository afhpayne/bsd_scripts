#!/bin/sh

STATE=$(mixer | awk 'NR==1{print substr($7,1,3)}')
if [ $STATE != "100" ]
then
    mixer vol 100 > /dev/null 2>&1
else
    mixer vol 0 > /dev/null 2>&1
fi
