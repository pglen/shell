#!/bin/bash
if [ "$1" == "" ] ; then
        echo "Usage: ./lookfor.sh needle haystack_wildcard"
        exit
fi
echo "Looking for:" \"$1\" in \"$2\"
find main -name "$2" -exec grep -H "$1" {} \;
find ../common/v001 -name "$2" -exec grep -H "$1" {} \;



