#!/bin/bash
for aa in *; 
 do 
   if [ -d $aa ] ; then 
    echo In directory $aa
     cd $aa;
	if [ -f Makefile ] ; then 
     	  make clean; 
	fi	
     cd ..;  
   fi 
 done

