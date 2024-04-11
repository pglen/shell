# Check if zip mounted
ZIP=`mount | grep /zip`
if [ "$ZIP" = "" ] ; then
    echo Zip drive not mounted. ; exit
fi
ZP=`mount | grep /zip | cut -d ' ' -f 3`
BN=`pwd`
VER=`basename $BN`
echo  Saving to $ZP/$VER
if [ ! -d $ZP/$VER ] ; then { mkdir  $ZP/$VER } fi
cp -Rud * $ZP/$VER
echo Done.
