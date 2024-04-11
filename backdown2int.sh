#!/bin/bash

if [ ! -d /mnt/down/ ] ; then
	echo  Drive on '/mnt/down' not mounted
	sleep 3
	exit 1;
fi

echo Copying downloads to internal dirve
cp -au  ~/Downloads /mnt/down
cp -au  ~/downloads /mnt/down
echo Done
sleep 3
