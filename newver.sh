#!/bin/bash

CURR=`find . -maxdepth 1 -type d | awk -F '-' {'print $2'} |  sort -n | tail -1`
PRE=`find . -maxdepth 1 -type d  | awk -F '-'  {'print $1'} |  sort -n | tail -1`
NNN=`echo $CURR | awk  {'printf "%03d\n", $0+1'}`

echo Making $PRE-$NNN

mkdir $PRE-$NNN
cp -a $PRE-$CURR/* $PRE-$NNN






