#!/bin/sh

TARGET=/mnt/data/pgsrc
HERE=`pwd`

#if [ "$UID" != "0" ] ; then
#	echo Only root can do that; 
#	exit;
#fi

if [ ! -d $TARGET ] ; then
    echo Target dir $TARGET  does not exost
    exit
fi

echo Backing up from $HERE to $TARGET
cp -au * $TARGET
