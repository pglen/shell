#!/bin/bash

# Remove duplicate manuals, keep ones with compressed backing
#echo $1
#ls $1*
cc=`ls $1* | wc | awk -F ' ' {'print $1'}`
if [ $cc -gt 1 ] ; then
    #echo "Moving $1 to $2"
    mv $1 $2
fi
#echo "********************"




