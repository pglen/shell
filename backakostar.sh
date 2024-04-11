#!/bin/bash

DDD=/media/peterglen/akoback/
if [ ! -d $DDD ] ; then
	echo "Insert jump drive (or open in file manager)"
	exit
fi

TTT=/akostar/esp

if [ ! -d $TTT ] ; then
	echo "$TTT not mounted"
	exit
fi

cd  $TTT

#cp -au * $DDD/akostar/esp
rsync -auq --exclude=".git/" --exclude=".trash" --exclude=".cache" . $DDD/akostar/esp

#shutdown
