#!/bin/bash
for aa in *;  do
if [ -d $aa ] ; then 
    chmod ugo+x $aa; 
fi ;  
done
