#!/bin/bash

DDD=/media/peterglen/ubu_1T/home/peterglen/

if [ ! -d $DDD ] ; then
	echo "Invalid backup target ( ... or mount $DDD)"
	exit
fi
if [ ! -w $DDD/ ] ; then
	echo "Target $DDD not writable"
	exit
fi

if [ "$(pwd)" != "/home/peterglen" ] ; then
    echo "Must start from home directory"
    exit
fi

echo Started Backup ...
# Copy all except .git .trash, .cache
rsync -auq --exclude=".git" --exclude=".trash" --exclude=".cache" --exclude=".local" \
     * $DDD/ 2>~/backup-errors-1t.txt

cat  backup-errors.txt


