#!/bin/bash
WID=`xdotool search --name "Mozilla Firefox" | head -1`
xdotool windowactivate --sync $WID 
xdotool key --clearmodifiers F5
