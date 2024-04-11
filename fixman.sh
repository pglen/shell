#!/bin/bash

mkdir -p /tmp/oldmans
find /usr/local/man -maxdepth 2 -type f | grep man[0-9] | xargs -i ./fixman2.sh  {} /tmp/oldmans



