#!/bin/sh
if [ $UID != 0 ] ; then echo Only root can do that; exit; fi
if [ ! -d /mnt/root ] ; then  
    echo Mounting remote
    mount action:/usr /mnt; set aa=1; 
fi
echo Started dircopy.pl
dircopy.pl -v /mnt/root/pgsrc
if [ $aa=1 ] ; then
    echo Unmounting remote
    umount /mnt; 
fi
echo Done.