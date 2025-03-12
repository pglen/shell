#!/bin/bash

if [ "$1" == "" ] ; then
    echo Find and list versions of file. Sort it by date.
    echo Usage: getfver.sh filename
    exit
fi

#date -d @%Y '+%Y-%m-%d %H:%M'

locate $1 | xargs stat -c "%Y %s %n" | sort -n | awk \
            '{ printf("%s %s %s %s\n", strftime("%Y:%m:%d %H:%M", $1),\
                         $2, $3, $4);}'
