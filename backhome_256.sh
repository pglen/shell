#!/bin/bash

#DDD=/media/peterglen/ubu_1T/home/peterglen/
DDD=/media/peterglen/7B43-015C/

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
# Copy all except .git .trash, .cache ... etc.

rsync -auq --exclude=".git" --exclude=".trash" --exclude=".cache" --exclude=".local" \
     --exclude="Download" --exclude="down" --exclude=".local"  --exclude="rpi"  \
     --exclude=".espressif" --exclude="win11" --exclude="qemu" --exclude=".android" \
     --exclude=".kicad" --exclude=".gradle" --exclude=".Videos" --exclude=".cache" \
     --exclude=".debian_386" \
     * $DDD/ 2>~/backup-errors_256.txt

cat  backup-errors_256.txt

# EOF
