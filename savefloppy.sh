# Check if floppy mounted
FLOPPY=`mount | grep fd0`
if [ "$FLOPPY" = "" ] ; then
    echo Floppy not mounted. ; exit
fi
FD=`mount | grep fd0 | cut -d ' ' -f 3`
BN=`pwd`
VER=`basename $BN`
echo  Saving to $FD/$VER
if [ ! -d $FD/$VER ] ; then { mkdir  $FD/$VER } fi
cp -Ru * $FD/$VER
echo Done.

