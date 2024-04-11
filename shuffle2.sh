#!/bin/bash
    
    echo Processing $1
    mkdir -p $1
    for aa in $1*; do
        #echo $aa $1
        mv $aa $1
    done
    echo 
    
    #find . -type d -name $1* -maxdepth 1
    
    



