#!/bin/bash

DDD=/media/peterglen/back500

if [ ! -f $DDD/backup.mark ] ; then
	echo "Insert drive ( ... or mount $DDD) [open in file manager]"
	exit
fi
if [ ! -w $DDD/ ] ; then
	echo "Target $DDD not writable"
	exit
fi

OLDD=$(pwd)
LOG=~/backup-errors-akostar.txt

cd ~/Documents

echo "Backup started ..." 

echo -n "Started pg Backup on " >>$LOG
date >>$LOG

# Copy all except .git .trash, .cache
rsync -auq --exclude=".git" --exclude=".trash" --exclude=".cache" \
	* $DDD/Documents/ 2>>$LOG

echo -n "Ended Backup on " >>$LOG
date >>$LOG
cd $OLDD
cat  $LOG
echo Backup Done.


