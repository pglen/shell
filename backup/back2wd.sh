#!/bin/bash

DDD=/media/peterglen/wdbackup

if [ ! -f $DDD/backup.mark ] ; then
	echo "Insert drive ( ... or mount $DDD)"
	exit
fi
if [ ! -w $DDD/ ] ; then
	echo "Target $DDD not writable"
	exit
fi

cd ~
mkdir -p $DDD/home/peterglen

echo Started Backup ...
echo "Backup started" >~/backup-errors.txt
date >>~/backup-errors.txt
# Copy all except .git .trash, .cache
rsync -auq --exclude=".trash" --exclude=".cache" ~/* $DDD/home/peterglen 2>>~/backup-errors.txt
echo "Backup done" >>~/backup-errors.txt
date >>~/backup-errors.txt
cat  backup-errors.txt
echo Backup Done.


