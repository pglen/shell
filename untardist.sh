#!/bin/bash

find . -name *.tgz -exec untar2.sh {} \;
find . -name *.tar.gz -exec untar2.sh {} \;
find . -name *.bz2  -exec untar2.sh {} \;
find . -name *.xz  -exec untar2.sh {} \;




