#!/bin/bash

#DDD=/media/peterglen/akoback
DDD=/mnt/backup

if [ ! -f $DDD/backup.mark ] ; then
	echo "Insert jump drive ( ... or mount $DDD)"
	exit
fi
if [ ! -w $DDD/ ] ; then
	echo "Target $DDD not writable"
	exit
fi

echo Started Backup ...
# Copy all except .git .trash, .cache
rsync -auq --exclude=".git" --exclude=".trash" --exclude=".cache" . $DDD/ 2>~/backup-errors.txt
cat  backup-errors.txt	


