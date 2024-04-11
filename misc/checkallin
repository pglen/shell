#!/bin/sh
# check all into cvs as one go ----

# get sorted list of dirs
qq=`ls $1 | sort`

for aa in $qq ; do
    if [ -d $aa ];then
	# parse 
	com=`echo $aa | cut -f 1 -d "-"`
	ver=`echo $aa | cut -f 2 -d "-"`
	ver2=`echo $ver | tr "." "\-"`
	# doit
	cd $aa
	echo Checking in -- $com -- $ver2
	#cvs -d :ext:petergl@action:/usr/cvs import -d -m "init" $com  "PeterGlen" "V$ver2" 
	cd ..
    fi
done

