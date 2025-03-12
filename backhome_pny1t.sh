#!/bin/bash

TARG=pny1t
DDD=/media/peterglen/$TARG/home/peterglen/
ERRFILE=backup-errors-$TARG.txt

if [ ! -d $DDD ] ; then
	echo "Invalid backup target ( ... or mount $DDD)"
	exit
fi
if [ ! -w $DDD/ ] ; then
	echo "Target $DDD not writable"
	exit
fi

cd $HOME
#echo $HOME $(pwd)

if [ "$(pwd)" != "$HOME" ] ; then
    echo "Must start from home directory"
    exit
fi

#exit

echo Started Backup to $DDD
# Copy all except .git .trash, .cache ... etc
rsync -auq --info=progress2 \
	    	--exclude="_system"           \
	    	--exclude="comlin64-lite-000" \
	    	--exclude="comlin64-mod-000"  \
	    	--exclude="comlin64-usb-000"  \
	    	--exclude="comlin64.iso"      \
	    	--exclude=".git"              \
			--exclude=".trash"            \
			--exclude=".cache"            \
			--exclude=".local"            \
     * $DDD/ 2>~/$ERRFILE

cat  $ERRFILE
