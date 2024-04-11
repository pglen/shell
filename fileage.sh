#!/bin/bash

# -------------------------------------------------------------------------
# Initialize options

YOPT=0; FOPT=0; WOPT=0
POPT=0;

getage()
{
	#echo "stating  '$1'";

	declare -i NOW=`date +%s`
	declare -i AGE=`stat -c %Y "$1"`

	if [ "$AGE" == "0" ] ; then
		#echo err: "$?" $NOW $AGE
		(())
	fi

	((HERE=$NOW-$AGE))
	((HEREM=$HERE/60))
	((HEREH=$HEREM/60))
	((HERED=$HEREH/24))
	((HEREMM=$HERED/30))
	((HEREY=$HEREMM/12))
}

printage()

{
	if [ "$YOPT" == "0" ] ; then
		echo -e "$1\t$HEREY years\t$HERED days\t$HEREH hours\t$HEREM minutes"
	fi
	if [ "$YOPT" == "1" ] ; then
		if [ "$FOPT" == "1" ] ; then echo -ne "$1\t"; fi
		echo -n "$HEREY"
		if [ "$POPT" == "1" ] ; then echo -ne "\t$1 "; fi
		echo
	fi
	if [ "$YOPT" == "2" ] ; then
		if [ "$FOPT" == "1" ] ; then echo -ne "$1\t"; fi
		echo -n "$HERED"
		if [ "$POPT" == "1" ] ; then echo -ne "\t$1 "; fi
		echo
	fi
	if [ "$YOPT" == "3" ] ; then
		if [ "$FOPT" == "1" ] ; then echo -ne "$1\t"; fi
		echo -n "$HEREM"
		if [ "$POPT" == "1" ] ; then echo -ne "\t$1 "; fi
		echo
	fi
	if [ "$YOPT" == "4" ] ; then
		if [ "$FOPT" == "1" ] ; then echo -ne "$1\t"; fi
		echo -n "$HEREMM"
		if [ "$POPT" == "1" ] ; then echo -ne "\t$1 "; fi
		echo
	fi
	if [ "$YOPT" == "5" ] ; then
		if [ "$FOPT" == "1" ] ; then echo -ne "$1\t"; fi
		echo -n "$HEREH"
		if [ "$POPT" == "1" ] ; then echo -ne "\t$1 "; fi
		echo
	fi
}

usage()
{
	echo "usage: $0 [-dymMhf] filename";
    echo "options: d=days y=years m=months"
    echo "M=minutes h=hours f=show filename (PRE)";
    echo "options: s=show filename  (POST) "
}

if [ "$1" == "" ] ; then
   	usage; exit;
fi

while getopts ":ydmMfhs" OPT

do
    #echo "got option="$OPT
    case $OPT in
    	w) ((WOPT=1));;
    	f) ((FOPT=1));;
    	s) ((POPT=1));;
    	y) ((YOPT=1));;
    	d) ((YOPT=2));;
    	M) ((YOPT=3));;
    	m) ((YOPT=4));;
    	h) ((YOPT=5));;

    	?) usage; exit;
    	;;
    esac
done

shift $(($OPTIND - 1))

while [ "$1" != "" ]
do
	#echo proc: $1
	if [ -f "$1" ] ; then
		getage "$1"
		printage "$1"
	fi
	shift

done

# Fails with filenames that contain spaces

#for FF in $*
#do
#	getage "$FF"
#	printage $FF
#done


