#!/bin/bash

# Build everything two deep

find . -maxdepth 2 -type d -exec compall4.sh {} \; | tee build.out



