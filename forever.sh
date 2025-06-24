#!/bin/bash

CNT=0 ; WWW=0.05  ; VERB=0 ; ERRX=0

function help() {
    echo -e "Usage: $(basename $0) [ -v ] [ -e ] [ -w seconds ]"
    echo -e "       -v          verbose, show counter"
    echo -e "       -e          exit if error"
    echo -e "       -h          help (this screen)"
    echo -e "       -w SEC      wait seconds between loops  (float is OK) "

    exit
}

while getopts ':hevw:' opt; do
  case "$opt" in
    w)
      WWW=$OPTARG
      ;;
    h)
      help
      ;;
    e)
      ERRX=1
      ;;
    v)
      VERB=$((VERB+1))
      ;;
    :)
        echo -e "Option '-$OPTARG' needs an argument."
        help
       ;;
    ?)
      echo -e "Invalid command option '-$OPTARG'"
      help
      ;;
   esac
done

shift $(( OPTIND - 1 ));

while true; do
    #echo $1 - pass $cnt
    CNT=$(($CNT + 1))

    if [ $VERB -ge 1 ] ; then
        echo "Loop count: $CNT"
    fi

    $1 $2 $3 $4 $5 $6 $7 $8 $9;
    ERR=$?
    if [ $ERRX -ne 0 ] ; then
        echo qq
        if [ $ERR -ne 0 ] ; then
            break;
        fi
    fi

    sleep $WWW
done

# EOF
