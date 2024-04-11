#!/bin/sh

TB_PATH=`which thunderbird`
# or for MacOSX:
#TB_PATH="/Applications/Thunderbird.app/Contents/MacOS/thunderbird-bin"

MYDATE=`date "+%Y%m%d_%H%M%S"`
NSPR_LOG_MODULES=IMAP:5
NSPR_LOG_FILE=/tmp/thunderbird_${MYDATE}.log
export NSPR_LOG_MODULES NSPR_LOG_FILE

$TB_PATH &
exit $?
