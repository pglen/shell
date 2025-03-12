#!/bin/bash

function helpme {
      echo -e "Usage: $(basename $0) [ -c start ] [ -v ]"
      echo " options:"
      echo "        -v        -- verbose (add more -v options for more printout)"
      echo "        -c sec    -- countdown sec"
      echo "        -x prog   -- execute 'prog' after countdown"
}

CCC=0

while getopts "vhc:x:" opt;
do
  case "$opt" in
    v)
      VERBOSE=$(($VERBOSE+1))
      ;;
    x)
      EXECX=$OPTARG
      #if [ ! -x $EXECX ] ; then
      #  echo "Not an executable:" "$EXECX"
      #  exit 1
      #fi
      ;;
    t)
      TTT=$((TTT+1))
      ;;
    c)
      CCC=$OPTARG
      ;;
    h)
      helpme
      exit
     ;;
    ?)
        #echo -e "Invalid command option. $1"
        exit 1
      ;;
   esac
done

#trapfunc() {
#    echo "trap called"
#}
#trap  trapfunc 0

countdown() {

    if [ "$1" = "" ] ; then
        set -- $1 60
    fi

    start="$(( $(date '+%s') + $1))"

    while [ $start -ge $(date +%s) ]; do
        time="$(( $start - $(date +%s) ))"
        printf '      %s\r' "$(date -u -d "@$time" +%H:%M:%S)"
        sleep 0.1             ;
    done
}

stopwatch() {
    start=$(date +%s)
    while true; do
        TIMEX="$(( $(date +%s) - $start))"
        MS=$(date +%N | cut -b 1-1)
        #printf '%s %d\r' "$(date -u -d "@$time" +%H:%M:%S)" "$ms"
        printf '      %s %s\r' "$(date -u -d "@$TIMEX" +%H:%M:%S)" $MS
        sleep 0.05
    done
}

if [ $CCC -ne 0 ] ; then
    if [ $(($VERBOSE)) -gt 0 ] ; then
        echo Countdown from: $CCC
    fi
    countdown $CCC
    if [ "$EXECX" != "" ] ; then
        $EXECX
    fi
else
    if [ $(($VERBOSE)) -gt 0 ] ; then
        echo "Stopwatch started."
    fi
    stopwatch
fi

# EOF
