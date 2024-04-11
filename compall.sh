#!/bin/bash

$cnt=1
echo Compiling all in a loop
# Specify a non empty arg to install as well
while [ 1 = 1 ] ;  do
    echo Compile iteration $cnt
    find . -maxdepth 2 -type d -exec compall6.sh {} $1 \;
    $cnt=$(($cnt+1))
done


