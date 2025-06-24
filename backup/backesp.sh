#!/bin/bash

DDD=/media/peterglen/akoback/
if [ ! -d $DDD ] ; then
	echo "Insert jump drive (or open in file manager)"
	exit
fi

cd  /ubu/akostar/esp

#cp -au * $DDD/akostar/esp
rsync -auq --exclude=".git/" --exclude=".trash" --exclude=".cache" . $DDD/akostar/esp

#shutdown
