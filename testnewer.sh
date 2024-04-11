#/bin/bash

echo File test: lookfor.sh forever.sh
isnewer.py lookfor.sh forever.sh
if [ $? == 0 ] ; then
    echo First file is not newer
else
    echo First file is newer
fi

echo File test: forever.sh lookfor.sh 
isnewer.py  forever.sh lookfor.sh
if [ $? == 0 ] ; then
    echo First file is not newer
else
    echo First file is newer
fi


