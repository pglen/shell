#!/bin/bash

# Specific to installation
ERRFILE="backup-errors.txt"
DRIVE=LinHD
TARGETDIR=/media/$USER/$DRIVE/home/peterglen
TARGET=$TARGETDIR/

if [ ! -d "$TARGETDIR" ] ; then
	echo "Please plugin and mount $DRIVE drive;"
	exit 1
fi

if [ ! -d "$TARGET" ] ; then
	echo "Please create target dir $TARGET"
	exit 1
fi

echo "Started backup to $TARGET"

# --exclude="/Downloads"          \

shopt -s dotglob

sudo rsync -au  --info=progress2 		        \
                --exclude="_system"             \
                --exclude="_work"               \
                --exclude="_boot"               \
                --exclude="/proc"               \
                --exclude="/sys"                \
                --exclude="./secrets"           \
                --exclude=".trash"              \
                --exclude=".cache"              \
                --exclude=".local"              \
     * $TARGET/

shopt -u dotglob

2>$ERRFILE

# EOF
