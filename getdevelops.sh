#!/bin/bash

TARGET=/home/peterglen/.gvfs/c\ on\ bluestar/

if [ ! -d "$TARGET" ] ; then
    echo Target dir does not exist or not mounted
    exit
fi

cp -au "$TARGET"/develop pgsrc
cp -au "$TARGET"/develop2 pgsrc
cp -au "$TARGET"/develop3 pgsrc
