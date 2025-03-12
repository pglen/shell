#!/bin/bash

echo "mirrorx:, '$1' '$2'"
#exit

if [ -d $1 ] ; then
    #mkdir -p $1
    mkdir -p $2/$1
else
    TARG=$2/$(dirname $1)
    cp -a $1 $TARG 
fi

# EOF
