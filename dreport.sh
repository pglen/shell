#!/bin/sh

if [ "$1" == "." ] ; then
	DNAME=`pwd`
elif [ "$1" == "" ] ; then
	#echo "usage: findold.sh filename"
	DNAME=`pwd`
else
	DNAME="$1"
fi

	#find  $DNAME -maxdepth 0 -type d -print0 | xargs -L1 -I {} -0 ./drep.sh {}
	find  $DNAME -type d -print0 | xargs -L1 -I {} -0 ./drep.sh {}





