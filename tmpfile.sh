#!/bin/bash

TMPNAME="$(mktemp -p /root/logs -t backup.XXXXXXX)"
echo $TMPNAME
rm $TMPNAME

