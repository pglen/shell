#!/bin/bash

AA=`dmidecode -s 2>&1`

for aa in $AA ; do
	#echo "aa=$aa"
	BB=`echo $aa | grep  "-"`
	
	if [[ ("$BB" != "") && ("$BB" != "--") ]] ; then
		CC=`dmidecode -s $BB`
		if [[ "$CC" != " " && "$CC" != "" ]] ; then
			echo "$BB = '$CC'"
		fi
	fi
done

