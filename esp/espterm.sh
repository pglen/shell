#!/bin/bash
source ~/bin/esps2.sh
# This is not configured in the desktop icon (bug?)
#cd /akostar/esp/esp-code/Remote/hand
cd $1
echo  If other user edited, may need to execute 'idf.py fullclean'
echo
echo './doall.sh' will compile and burn a new firmware
echo
exec bash -i
