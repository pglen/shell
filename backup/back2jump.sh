#!/bin/bash

DDD=/media/peterglen/akoback

if [ ! -d $DDD ] ; then
	echo "Insert jump drive ( ... or open it in file manager)"
	exit
fi

#shopt -s dotglob

#cp -au `ls -A | grep -v Downloads`  $DDD/ubu-home 2>~/backup-errors.txt
#echo Results in  backup_errors.txt
# Copy all except downloaded files, trash, cache
#rsync -auq --exclude="Downloads/" --exclude=".trash" --exclude=".cache" . $DDD/ubu-home 2>~/backup-errors.txt
cd ~
rsync -auv --exclude="Downloads/" --exclude=".trash" --exclude=".cache" \
  --exclude ".mozilla" --exclude ".local" --exclude ".ccache"   . $DDD/ubu-home 

#shopt -u dotglob
#shutdown


