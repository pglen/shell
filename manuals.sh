#!/bin/sh

	find  /usr/bin -type f -print0 | xargs -L1 -I {} -0 ./mans.sh {}





