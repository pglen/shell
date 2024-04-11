#!/bin/bash

#SSS=~/
DDD=peterglen@192.168.2.104:/home/peterglen

#if [ ! -d $DDD ] ; then
#	echo "Insert jump drive (or open in file manager)"
#	exit
#fi

#if [ ! -f $DDD/key.gpg ] ; then
#	echo "Mount remote )"
#	exit
#fi

rsync -aruv --exclude=".git/" --exclude=".trash/" --exclude=".cache/"  \
		--exclude=".config/" --exclude="Desktop/" --exclude="Download/"  \
			$DDD/* ~/

