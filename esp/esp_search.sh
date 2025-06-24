#!/bin/bash
find /akostar/esp/esp-idf/components/ -name "*.h" -exec grep -H "$1" {} \;
