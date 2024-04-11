#!/bin/bash

removeif()
{
	if [ -z $1 ]; then
		echo "Missing filename";
		return;
	fi

	if [ -f $1 ] ; then
		rm $1;
	fi
}

removeif $1



