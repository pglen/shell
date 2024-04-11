#!/bin/bash

aa=`pwd`; bb=`basename $aa`; err=0

#echo  $1 $bb

pushd `pwd` >/dev/null

if [ -z $1 ] ; then
    #echo "Assuming current dir: '$bb'"
    FF=$bb
 else
    FF=`basename $1`
    echo $FF
    cd $1 >/dev/null 2>&1
    
    if [ $? != 0 ] ; then
        echo Cannot change dir to $1
        popd >/dev/null
        exit
    fi
fi

# ------------------------------------------------------------------------
# Cycle on make-config-autoconf

while [ 1 = 1 ] ;  do

    if [ -f Makefile ] ; then
        echo "make:" $FF
        make -k  >make.out 2>make.err
        err=$?
        if [ $err != 0 ] ; then
            echo "Error on make" $FF
            tail make.err
        fi
        echo "make install:" $FF
        crypt.pl  ~/.pass | sudo -S make -k install >install.out 2>install.err
        err=$?
        if [ $err != 0 ] ; then
            echo "Error on make install" $FF
            tail install.err
        fi
        break
     fi
      
     # Configure if not conf-ed
     if [ -x configure ] ; then
        echo "configure:" $FF
        if [ -f confcom ] ; then
            cc=`cat confcom`
        else 
            cc=""
        fi
        ./configure $cc >config.out 2>config.err
        err=$?
        if [ $err != 0 ] ; then
            echo "Error on configure" $FF
            tail config.out
            break
        fi
        continue
     fi
     
     # Automake if needed
     if [ -x autoconf.sh ] ; then
        ./autoconf.sh >auto.out 2>auto.err
        err=$?
        if [ $err != 0 ] ; then
            echo "Error on autoconf" $FF
            tail auto.err
            break
        fi
     continue
     fi
done
    
popd >/dev/null

exit $err




