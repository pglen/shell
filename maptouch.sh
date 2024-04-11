#!/bin/bash
# Map touch to display 1
DID=$(xinput list --id-only "eGalax Inc. eGalaxTouch EXC3188-1515-06.00.00")
xinput map-to-output $DID eDP-1

