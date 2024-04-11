#!/bin/bash

BACK=new2g

if [ ! -d /media/peterglen/new2g/home/peterglen/ ] ; then
	echo  External drive new2g is not mounted
	sleep 3
	exit 1;
fi

echo Copying home to external drive new2g
#cp -au  ~/* /media/peterglen/new2g/home/peterglen/

rsync -au --exclude .git/ \
--fake-super -v  ~/*  /media/peterglen/new2g/home/peterglen

echo Done
sleep 10
