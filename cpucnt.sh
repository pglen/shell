#!/bin/bash

cat /proc/cpuinfo | grep processor | wc | awk '{print $1}'
