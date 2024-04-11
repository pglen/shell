#!/bin/sh

TARGET=/media/32G_SANDISK

if [ ! -d $TARGET ] ; then
    echo Jump drive not inserted.
    exit
fi
cp -au * $TARGET/pgsrc
