#!/bin/bash

# Copyright: (C) 2016 iCub Facility - Istituto Italiano di Tecnologia
# Authors: Ugo Pattacini <ugo.pattacini@iit.it>
# CopyPolicy: Released under the terms of the GNU GPL v3.0.

# Dependencies (through apt-get):
# - curl
# - jq

org=easy-peasy-robotics
team=easy-peasy-robotics/web20-participants
curdir=$(pwd)

if [ -d build ]; then
    rm -Rf build
fi
mkdir build && cd build

git clone --depth 1 -b master https://github.com/vvv-school/vvv-school.github.io.git helpers
if [ $? -ne 0 ]; then
    echo "GitHub seems unreachable"
    exit 1
fi

./helpers/scripts/gradebook.sh $org $team "$curdir" "$curdir/build"
