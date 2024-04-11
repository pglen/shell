#!/bin/bash

# Back up current dir to another drive

if [ `id -u` != 0 ] ; then
    echo "Must be root to run this script."
    exit 1
fi

# Configure target drive

MTARGET=/mnt/down
TARGET=`pwd`

TT=`mount | grep $MTARGET`
#echo $TT

if [ "$TT" == "" ] ; then
        echo "Please mount (or plug in) target drive ($MTARGET)"
        exit 1
fi
        
if [ ! -d $MTARGET ] ; then
        echo "Please mount (or plug in) target drive ($MTARGET)"
        sleep 1
        exit 1
fi

if [ ! -d $MTARGET/$TARGET ] ; then
        echo
        echo "Creating $MTARGET/$TARGET .... ";
        mkdir -p $MTARGET/$TARGET
fi

echo
echo "Copying from:  '`pwd`'"
echo "          to:  '$MTARGET/$TARGET'" 

cp -avu * $MTARGET/$TARGET| wc | awk {'print($1" files copied")'}


