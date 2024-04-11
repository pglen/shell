if [ "$1" == "" ] ; then
    #echo empty
    pp=0
else
    pp=$1
fi

make flash monitor ESPPORT=/dev/ttyUSB$pp ESPBAUD=512000



