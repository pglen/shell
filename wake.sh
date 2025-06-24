
#sleep_until() {
#  local target_date="$1"
#  local target_epoch
#
#  # Calculate the target epoch time
#  target_epoch=$(date -d "$target_date" "+%s" 2>/dev/null || date -j -f "%Y-%m-%d %H:%M" "$target_date" "+%s" 2>/dev/null)
#
#  if [[ -n $target_epoch ]]; then
#    # Put the machine to sleep
#    sudo systemctl suspend
#
#    # Schedule the wake-up time
#    sudo rtcwake -m no -t "$target_epoch"
#  else
#    echo "Invalid date format. Please use a format like 'next Monday 08:00' or 'YYYY-MM-DD HH:MM'."
#  fi
#}

sleep_until() {
  local target_date="$1" target_epoch

    # Calculate the target epoch time
    target_epoch=$(date -d "$target_date" "+%s" 2>/dev/null)
    #echo "epoch:" "$target_epoch"
    repoch=$(date  --date @"$target_epoch" +"%Y-%m-%d %H:%M" 2>/dev/null)

    if [[ -n $target_epoch ]]; then
        # Put the machine to sleep
        #sudo systemctl suspend

        # Schedule the wake-up time
        echo "Setting wake to: " $repoch
        sudo rtcwake -m on -t "$target_epoch" 1>/dev/null 2>&1
        ERR=$?
        if [ $ERR -gt 0 ] ; then
            #echo "err $ERR"
            echo "Cannot set wakeup to $repoch"
            exit 1
        fi

  else
        echo "Invalid date format. Please use a format like 'next Monday 08:00' or 'YYYY-MM-DD HH:MM'."
  fi
}

sleep_until "2025-06-25 1:12"


sleep_for() {
  local duration="$1"

  # Extract the numeric value and unit from the duration string
  local numeric_value=$(echo "$duration" | grep -oE '[0-9]+')
  local unit=$(echo "$duration" | grep -oE '[a-zA-Z]+')

  # Validate numeric value
  if [[ ! "$numeric_value" =~ ^[0-9]+$ ]]; then
    echo "Invalid duration. Please provide a numeric value."
    return 1
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
      echo "Invalid time unit. Please use 's' (seconds), 'm' (minutes), 'h' (hours), or 'd' (days)."
      return 1
      ;;
  fi

  # Put the machine to sleep
  #sudo systemctl suspend

  # Schedule the wake-up time
  sudo rtcwake -m no -s "$sleep_seconds"
}

#sleep_for "2h30m"

# EOF
