#!/bin/bash

pushd `pwd` >/dev/null

cd `dirname $1`
tar xf `basename $1`

popd >/dev/null


