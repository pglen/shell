#/bin/bash

 if [ -d "$1" ] ; then 
    #echo In directory $1
     cd "$1";
        if [ -f Makefile ] ; then 
	 #echo Makefile in "$1"
          make clean; 
        fi      
     cd ..;  
   fi 

