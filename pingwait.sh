#!/bin/bash

function pwait
{
    cnt=0
    while true; do
        #echo $1 - pass $cnt
        cnt=$(($cnt + 1))
        $1 $2 $3 $4 $5 $6 $7 $8 $9   >/dev/null 2>&1
        if  [ "$?" -eq "0" ]; then
        	echo The connection to \'$6\' is alive at `date`
        	beep; beep; beep
            break;
        fi
        sleep 30
    done
}

pwait ping -c 1 -W .2 $1

