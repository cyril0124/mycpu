#!/bin/bash

mkdir build
cd build
rm *.vcd
cmake .. -DTRACE=1 -DTHREAD=16 -DCMAKE_BUILD_TYPE=Debug
make -j 16
./mycpu_test | tee ../out.log
