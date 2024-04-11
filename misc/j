#/bin/bash

# Configure target drive
MTARGET=`mount | grep /media/ | head -1 | awk {'print $3'} `
echo  $MTARGET

TT=`mount | grep $MTARGET`
echo $TT

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
        echo "Creating $MTARGET/$TARGET .... ";
        mkdir -p $MTARGET/$TARGET
fi

echo "Copying from:  '`pwd`'"
echo "          to:  '$MTARGET/$TARGET'" 

cp -avu * $MTARGET/$TARGET| wc | awk {'print($1" files copied")'}



