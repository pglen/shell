#!/bin/bash

DDD=/media/peterglen/wdbackup
TTT=home/peterglen

if [ ! -f $DDD/backup.mark ] ; then
	echo "Insert drive ( ... or mount $DDD) [open in file manager]"
	exit
fi
if [ ! -w $DDD/ ] ; then
	echo "Target $DDD not writable"
	exit
fi

if [ ! -d $DDD/$TTT ] ; then
	mkdir -p $DDD/$TTT
fi

OLDD=$(pwd)
LOG=~/backup-errors-home.txt

cd ~

echo "Backup of home to $DDD/$TTT started ..." 

echo -n "Started Backup on " >>$LOG
date >>$LOG

# Copy all except .git .trash, .cache
EXC='--exclude=".git" --exclude=".trash" --exclude=".cache"'

#rsync -auv $EXC ~/ $DDD/$TTT 
rsync --progress -auqv $EXC ~/ $DDD/$TTT 2>>$LOG | pv -lep 

echo -n "Ended Backup on " >>$LOG
date >>$LOG
cd $OLDD
cat  $LOG
echo Backup Done.


