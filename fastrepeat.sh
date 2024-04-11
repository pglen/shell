#!/bin/bash

cnt=0
while true; do
    echo $1 - pass $cnt
    cnt=$(($cnt + 1))
    $1 $2 $3 $4 $5 $6 $7 $8 $9;
    if  [ "$?" -ne "0" ]; then
        break;
    fi
    sleep .1
done


