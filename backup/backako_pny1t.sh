#!/bin/bash

TARG=pny1t
DDD=/media/peterglen/$TARG/home/peterglen/
ERRFILE=~/backup-ako-errors-$TARG.txt

if [ ! -d $DDD ] ; then
	echo "Invalid backup target ( ... or mount $DDD)"
	exit
fi
if [ ! -w $DDD/ ] ; then
	echo "Target $DDD not writable"
	exit
fi

cd /akostar

if [ "$(pwd)" != "/akostar" ] ; then
    echo "Must start from akostar directory"
    exit
fi

echo Started Akostar Backup ...
# Copy all except .git .trash, .cache
rsync -auq --exclude=".git" --exclude=".trash" --exclude=".cache" \
			--exclude=".local" \
     * $DDD/ 2> ERRFILE

cat  ERRFILE
