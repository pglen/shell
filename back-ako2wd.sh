#!/bin/bash

DDD=/media/peterglen/wdbackup

if [ ! -f $DDD/backup.mark ] ; then
	echo "Insert drive ( ... or mount $DDD) [open in file manager]"
	exit
fi
if [ ! -w $DDD/ ] ; then
	echo "Target $DDD not writable"
	exit
fi

if [ ! -d $DDD/akostar ] ; then
	mkdir -p $DDD/akostar
fi

OLDD=$(pwd)
LOG=~/backup-errors-akostar.txt

cd /akostar

echo "Backup started ..." 

echo -n "Started akostar Backup on " >>$LOG
date >>$LOG

# Copy all except .git .trash, .cache
rsync -auq --exclude=".git" --exclude=".trash" --exclude=".cache" /akostar/* $DDD/akostar 2>>$LOG

echo -n "Ended Backup on " >>$LOG
date >>$LOG
cd $OLDD
cat  $LOG
echo Backup Done.


