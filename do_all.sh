#!/bin/bash

./genpages.sh

#dos2unix main/*.html
#dos2unix main/*.c
#dos2unix main/*.h

make flash monitor ESPPORT=/dev/ttyUSB0 ESPBAUD=256000






