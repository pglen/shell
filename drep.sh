#!/bin/sh

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


if [ "$1" == "" ] ; then
	echo "usage: drep.sh dirname";
fi

if [ "$1" == "." ] ; then
	exit
fi

#FN="$1"
#echo "helo $1"

pushd `pwd` > /dev/nul

cd "$1"

TOTAL=0
MAXSIZE=0; MAXSIZEN=""
MINSIZE=400000000; MINSIZN=""
NULLS=0;  NULLSN=""

MAXAGE=0
MINAGE=40000000

MAXAGEN=""
MINAGEN=""

# List all files in dir
for AA in *
do
	if [ -f "$AA" ] ; then

		SIZE=`stat "$AA" -c %s`
		((TOTAL+=$SIZE))

		if [ $MAXSIZE  -lt $SIZE ] ; then
			((MAXSIZE=$SIZE));
			MAXSIZEN="$AA"
		fi

		if [ $MINSIZE  -gt $SIZE ] ; then
			if [ $SIZE -ne 0 ] ; then
				((MINSIZE=$SIZE));
				MINSIZEN="$AA"
			fi
		fi

		if [ $SIZE -eq 0 ] ; then
			((NULLS+=1))
			NULLSN+="'`basename "$AA"`' "
		fi

		getage "$AA"
		#echo "file age $AA $HEREY"

		if [ $MAXAGE  -lt $HEREY ] ; then
			((MAXAGE=$HEREY))
			MAXAGEN="$AA"
		fi
		if [ $MINAGE  -gt $HEREH ] ; then
			((MINAGE=$HEREH))
			MINAGEN="$AA"
		fi

	fi
done

((TOTALK=$TOTAL/1024))
((TOTALM=$TOTALK/1024))

echo -e "$TOTAL \t$1"

#echo -e "Directory '$1'"
#echo -e "Total Size:  $TOTAL ($TOTALK KB) ($TOTALM MB)"
#echo -e "Largest file:   $MAXSIZE \t($MAXSIZEN)"
#echo -e "Smallest file:  $MINSIZE \t($MINSIZEN)"
#echo -e "Oldest file (years):    $MAXAGE \t($MAXAGEN) "
#echo -e "Youngest file (hours):  $MINAGE \t($MINAGEN) "
#echo -e "Empty Files:    $NULLS  \t($NULLSN) "

popd >/dev/nul



