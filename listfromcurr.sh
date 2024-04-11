#!/bin/sh


	if [ "$1" == "" ] ; then
		echo "usage: listfromcurr.sh filename"
	fi

find . -name $1 -printf "%-40p \t%6s %c\n"


