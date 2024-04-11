cd ~/secret
. ./conf.sh

sudo ./mount.sh

if [ $? != 0 ] ; then
    echo "Cannot mount secret on  $MOUNTPOINT"
 else
    echo "Secret drive mounted on $MOUNTPOINT"
    sleep 2
fi



