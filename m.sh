#!/bin/bash

# List local mounts
FSL=`mount | grep "/dev/sd[a-z]"  |  awk {'print $1'}`
#echo  $FSL

TOT=0; TOTF=0

echo	"Dev             Mount             Total(G)      Free(G)   Free(%)"
echo    "-----------------------------------------------------------------"

# Get sizes
for AA in $FSL; do

    #echo $AA

    # Produce a short form
    if [ ${#AA} -gt 10 ] ; then
        AAA=${AA:$((${#AA}-10))}
    else
    	AAA=$AA
    fi
    echo  -ne $AAA "\t"

    MP=`mount | grep $AA |  awk {'print $3'}`

    if [ ${#MP} -lt 8 ] ; then
	   MPP=`echo -n $MP "\t"`
    else
	   MPP=$MP
    fi

    if [ ${#MPP} -gt 14 ] ; then
	   MPPP=${MPP:0:14}
    else
	   MPPP=$MPP
    fi

    echo -ne  $MPPP "\t  "

    BB=`stat -f $MP | grep "Block size" | awk {'print $3'}`
    SS=`stat -f $MP | grep Blocks | awk {'printf "%8.0f",  $3'}`
    FF=`stat -f $MP | grep Blocks | awk {'printf "%8.0f",  $7'}`

    SSS=`echo $(($SS*$BB)) | awk {'printf "%8.02f", $0/1000000000'}`
    TOT=$(($TOT+$SS*$BB/1000))

    FFF=`echo $(($FF*$BB)) | awk {'printf "%8.02f", $0/1000000000'}`
    TOTF=$(($TOTF+$FF*$BB/1000))

    #echo "ffff $FFFF bbb $BBB"

    #PPP=`echo $(($FFFF $BBB)) | awk {'printf "%8.02f", $1 / $2'}`
    PPP=`echo $FFF " " $SSS | awk {'printf ("%8.02f", 100 * $1 / $2)'}`

    echo -ne $SSS "\t"
    echo -e $FFF "\t" $PPP%

done
echo    "-----------------------------------------------------------------"

TTT=`echo $(($TOT)) | awk {'printf "%-8.02f", $0/1000000'}`
TTTF=`echo $(($TOTF)) | awk {'printf "%-8.02f", $0/1000000'}`
TTTP=`echo $TOT " " $TOTF | awk {'printf "%-8.02f", 100*$2/$1'}`

echo "    Total Space: " $TTT "G Total Free:  " $TTTF "G  " $TTTP%
echo



