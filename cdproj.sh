#!/bin/bash

if [ "$1" == "" ] ; then
    echo "Usage: cdproj target_dir"
    exit 1
fi

if [ ! -d $1 ] ; then
    echo "Usage: cdproj target_dir - target dir must exist"
    exit 2
fi

CURR=`find $1 -maxdepth 1 -type d -name "*[0-9]*" |  sort -n | tail -1`
#CURR=`find $1 -maxdepth 1 -type d -name "$1-[0-9]*" |  sort -n | tail -1`
echo "Changing dir to '$CURR'"
cd $CURR


