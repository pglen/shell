#!/bin/bash

# Generate a random sequence of chars on stdout

MAXRAND=30 ; CNT=0 ; RANDX=0
stringZ="abcdefghigklmnopqrstuvwxyzABCDEFGHIGKLMNOPQRSTUVWXYZ1234567890"

function help() {
    echo -e "Usage: $(basename $0) [ -n ] [ -r ] [ -h ] [ -c CHARS ] "
    echo -e "           -n          allow spaces, punctuation"
    echo -e "           -p          allow punctuation"
    echo -e "           -x          max random length (default 30)"
    echo -e "           -r          random length (use after -x)"
    echo -e "           -h          help (this screen)"
    echo -e "           -c CHARS    compose from this set"

    exit $1
}

while getopts ':hnprc:x:' opt; do
  case "$opt" in
    n)
      #echo "Processing option 'n'"
      stringZ="abcdefghigklmnopqrstuvwxyzABCDEFGHIGKLMNOPQRSTUVWXYZ 1234567890():/\_+=@#^&"
      ;;
    p)
      #echo "Processing option 'n'"
      stringZ="abcdefghigklmnopqrstuvwxyzABCDEFGHIGKLMNOPQRSTUVWXYZ1234567890():/\_+=@#^&"
      ;;
    c)
      stringZ="$OPTARG"   ;;
    x)
      MAXRAND="$OPTARG"   ;;
    h)
      help 0   ;;
    r)
      RANDX=1  ;;
    ?)
      echo -e "Invalid command option '-$OPTARG'."
      help 1
      ;;
  esac
done

#echo $stringZ
lenx=${#stringZ}

shift "$(($OPTIND-1))"

# Override to random
if [ $RANDX -eq 0 ] ; then
    CNT=$1
    if [ $((CNT)) -eq 0 ] ; then
        CNT=12
    fi
else
    CNT=$((RANDOM % $MAXRAND + 4))
fi

for aa in $(seq 0 $(($CNT-1)))
    do
        mmm=$(($RANDOM % $lenx))
        #echo $aa, $mmm
        echo -n -e "${stringZ:$mmm:1}"
    done
echo