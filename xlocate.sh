#!/bin/bash
plocate -r $1 | xargs stat -c "%y %s %n"
