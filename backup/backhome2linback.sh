#!/bin/bash

if [ ! -d /media/linback/home/peterglen/ ] ; then
	echo  External drive LINBACK is not mounted
	sleep 3
	exit 1;
fi

echo Copying home to external dirve
cp -au  ~/* /media/linback/home/peterglen/
echo Done
sleep 10
