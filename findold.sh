#!/bin/sh

if [ "$1" == "" ] ; then
	#echo "usage: findold.sh filename"
	FNAME="."
else
	FNAME="$1"
fi

#	find . $FNAME -printf "%-40p \t%6s %c\n" -exec ./fileage.sh -d '{}' \;
	find  $FNAME -print0 | xargs -0 -L 1 -I {} fileage.sh -ys "{}"

