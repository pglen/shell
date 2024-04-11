#!/bin/bash
# Call the 'C' pre processor
gcc -x c -E -P  $1 -o $2
