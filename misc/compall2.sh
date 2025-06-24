#!/bin/bash

#echo  $1

FF=`basename $1`
pushd `pwd` >/dev/null

echo $FF

cd $1
       
if [ -x configure ] ; then
    echo "configure:" $FF
    ./configure >config.out 2>config.err
    err=$?
    if [ $err != 0 ] ; then
        echo "Error on configure" $FF
    fi
else 
    if [ -x autogen.sh ] ; then
        echo "autogen:" $FF
        ./autogen.sh >autogen.out 2>autogen.err
        err=$?
        if [ $err != 0 ] ; then
            echo "Error on autogen" $FF
        fi
    
        if [ -x configure ] ; then
            echo "configure:" $FF
            ./configure >config.out 2>config.err
            err=$?
            if [ $err != 0 ] ; then
                echo "Error on configure" $FF
            fi
        fi
    fi       
fi

if [ -f Makefile ] ; then
    echo "make:" $FF
    make -k  >make.out 2>make.err
    err=$?
    if [ $err != 0 ] ; then
        echo "Error on make" $FF
    fi
    
    echo "make install:" $FF
    crypt.pl  ~/.pass | sudo -S make -k install >install.out 2>install.err
    err=$?
    if [ $err != 0 ] ; then
        echo "Error on make install" $FF
    fi
fi

popd >/dev/null
  


