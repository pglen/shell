#!/bin/sh


if [ ! -f "$1" ] ; then
	echo "non file $1";
fi

	#echo $1

	NN=`basename $1`;
#	echo "$NN -> ./html/$NN.html"
	man -H $NN > ./html2/$NN.html





