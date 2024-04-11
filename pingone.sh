#!/bin/bash

ping -c 1 -W .2 $1 > /dev/null
err=$?
#echo err $err
if [ "$err" == "0" ]; then
	echo connection $1 alive
	#beep; beep; beep; beep
fi
#echo -n -e \\b\\b\\b\\b\\b\\bno conn
#echo -n -e \\rNo connection at $(date)
