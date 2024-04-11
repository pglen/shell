#!/bin/bash
for aa in *;
	do
		if [ -d $aa ] ; then
			cd $aa;
			if [ -f Makefile ] ; then
				echo -n "$aa - "
		  		make clean;
			fi
			cd ..;
		fi
	done

