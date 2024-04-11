#!/bin/bash

#echo  $1

FF=`basename $1`
pushd `pwd` >/dev/null

echo $FF

cd $1

if [ -f Makefile ] ; then
    echo "clean:" $FF
    make -k  clean >clean.out 2>clean.err
    err=$?
    if [ $err != 0 ] ; then
        echo "Error on make clean" $FF
    fi
    rm "BUILDOK" >/dev/null 2>&1
fi
       
popd >/dev/null
       



