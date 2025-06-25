#!/bin/bash

WWW="" ; ONX="no"
SND=/usr/share/sounds/freedesktop/stereo/suspend-error.oga
SSS=0 ; REALS=0 ; BCNT=3 ; CNT=0

function logaction() {
    echo "$(date) -- $1" >>~/alarmlog
}

sleep_until() {
    local target_date target_epoch
    target_date="$1"
    # Calculate the target epoch time
    NOW=$(date "+%s" 2>/dev/null)
    target_epoch=$(date -d "$target_date" "+%s" 2>/dev/null)
    if [ "$target_epoch" == "" ]; then
        echo "Invalid date format for '$1'. Format: 'YYYY-MM-DD HH:MM'."
        exit 1
    fi
    if [ "$target_epoch" -le "$NOW" ] ; then
        echo "Cannot set alarm into the past: $target_date"
        exit 1
    fi
    #repoch=$(date --date @"$target_epoch" +"%Y-%m-%d %H:%M" 2>/dev/null)
    repoch=$(date --date @"$target_epoch" 2>/dev/null)
    # Schedule the wake-up time
    echo "Setting wake to: $repoch"
    sleep 2

    # Put the machine to sleep
    if [ $REALS -eq 0 ] ; then
        sudo systemctl suspend
    fi

    ERRS=$(sudo rtcwake -m "$ONX" -t "$target_epoch" 2>&1)
    ERR=$?
    if [ $ERR -gt 0 ] ; then
        #echo "err $ERR"
        echo "Cannot set wakeup. $ERRS"
        exit 1
    fi
}

sleep_for() {

    local  duration numeric_value unit now

    duration="$1"
    #echo "duration", $duration

    # Extract the numeric value and unit from the duration string

    numeric_value=$(echo "$duration" | grep -oE '[0-9]+')
    unit=$(echo "$duration" | grep -oE '[a-zA-Z]+')

    # Validate numeric value
    if [[ ! "$numeric_value" =~ ^[0-9]+$ ]]; then
        echo "Invalid duration. Please provide a numeric value."
        exit 1
    fi

    # Convert the duration to seconds based on the unit
    case $unit in
    "s")
      sleep_seconds="$numeric_value"
      ;;
    "m")
      sleep_seconds="$((numeric_value * 60))"
      ;;
    "h")
      sleep_seconds="$((numeric_value * 3600))"
      ;;
    "d")
      sleep_seconds="$((numeric_value * 86400))"
      ;;
    *)
      echo "Invalid time unit. $numeric_value Please use 's' (seconds), 'm' (minutes), 'h' (hours), or 'd' (days)."
      exit 1
      ;;
    esac

    now=$(date "+%s" 2>/dev/null)
    ACT=$((now+sleep_seconds))
    repoch=$(date --date @"$ACT" 2>/dev/null)

    echo "Sleeping: $sleep_seconds sec, till: $repoch"
    sleep 2

    # Put the machine to sleep
    if [ $REALS -eq 0 ] ; then
        sudo systemctl suspend
    fi

    ERRS=$(sudo rtcwake -m "$ONX" -s "$sleep_seconds" 2>&1)
    ERR=$?
    if [ $ERR -gt 0 ] ; then
        echo "Cannot set wakeup. $ERRS"
        exit 1
    fi
}

#    echo -e "         -m MODE     Sleep mode: mem disk off no on"

function help() {
    echo -e "Usage: $(basename "$0") [ -v ] [ -u ] [ -s seconds ]"
    echo -e "         -h          Help (this screen)"
    echo -e "         -u          Simulate, do not sleep (for testing)"
    echo -e "         -c BCNT     Number of beeps per section default: 3"
    echo -e "         -d FILE     Sound file to play"
    echo -e "         -s SEC      Sleep SEC seconds"
    echo -e "         -w TIME     Wake at TIME "
    echo -e
    echo -e "For TIME format specs see the 'date' program"

    exit "$1"
}

while getopts ':huc:d:m:s:w:' opt; do
  case "$opt" in
    d)
      SND=$OPTARG
      play "$SND"  2>/dev/null
      ERR=$?
      if [ $ERR -ne 0 ] ; then
        echo "Cannot play sound '$SND'"
        exit 0
      fi
      ;;
    c)
      BCNT=$((OPTARG+0))    ;;
    w)
      WWW=$OPTARG           ;;
    m)
      ONX=$OPTARG           ;;
    s)
      SSS=$OPTARG           ;;
    u)
        REALS=1 ;  ONX="on"  ;;
    h)
      help  0      ;;
    :)
        echo -e "Option '-$OPTARG' needs an argument."
        help 1
       ;;
    ?)
      echo -e "Invalid command option '-$OPTARG'"
      help  1
      ;;
   esac
done

shift $(( OPTIND - 1 ));

#echo mode: $MODE

if [ $((SSS)) -ne 0 ] ; then
    logaction "Sleep for $SSS sec"
    sleep_for "$SSS"s "$REALS"
else
    if [ "$WWW" != "" ] ; then
        logaction "Sleep till $WWW"
        sleep_until "$WWW" "$REALS"
    else
        echo "Must specify sleep length or wake time. "
        help 1;
    fi
fi

logaction  "Wake"

# Allow the system to settle
echo -n "Waking from sleep ... "
sleep 2
echo OK

function doalert() {

    #echo "doalert" $1 $2
    while : ; do
        if [ $CNT -ge $1 ] ; then
            break
        fi
        play "$SND"  >/dev/null 2>&1
        sleep $2
        CNT=$((CNT+1))
    done
}

doalert $((BCNT)) 5
doalert $((BCNT*2)) 1
doalert $((BCNT*3)) 0.1

# EOF
