#!/bin/bash

DDD=/storage/backup/akostar/
if [ ! -d $DDD ] ; then
	echo "$DDD not mounted"
	exit
fi

TTT=/akostar/esp

if [ ! -d $TTT ] ; then
	echo "$TTT not mounted"
	exit
fi

cd  $TTT

#cp -au * $DDD/akostar/esp
rsync -auq --exclude=".git/" --exclude=".trash" --exclude=".cache" . $DDD >~/backup_errors.txt

#shutdown
