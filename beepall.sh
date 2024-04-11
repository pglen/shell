#!/bin/bash

# Attach alarms to this one
beep
play /usr/share/sounds/sound-icons/start &
notify-send -t 0 \
    "Alarm from timer: '$1'
    $(date)"
    zenity --info --text="Alarm \'$1\'
    $(date)"&
