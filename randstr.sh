#!/bin/bash

# Generate a random sequence of chars on stdout

stringZ="abcdefghigklmnopqrstuvwxyzABCDEFGHIGKLMNOPQRSTUVWXYZ1234567890"

cnt=$1

while getopts 'nc:hr' opt; do
  case "$opt" in
    n)
      #echo "Processing option 'n'"
      stringZ="abcdefghigklmnopqrstuvwxyzABCDEFGHIGKLMNOPQRSTUVWXYZ 1234567890():/\_+=@#^&"
      ;;

    c)
      arg="$OPTARG"
      echo "Processing option 'c'" $arg
      ;;

    h)
      echo "use: randstr [-n] length"
      exit 0
      ;;

    r)
      cnt=$(($RANDOM % 25+4))
      #echo "rand len" $cnt
      ;;

    ?)
      echo -e "Invalid command option."
      echo -e "Usage: $(basename $0) [-n -r -h -] maxlen"
      exit 1
      ;;
  esac
done

#echo $stringZ
lenx=${#stringZ}
#echo $lenx

shift "$(($OPTIND -1))"

for aa in $(seq 0 $(($cnt-1)))
    do
        mmm=$(($RANDOM % $lenx))
        #echo $aa, $mmm
        echo -n -e "${stringZ:$mmm:1}"
    done
echo