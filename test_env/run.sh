#!/bin/bash

cd build
rm *.vcd
make -j 16
./mycpu_test | tee ../out.log
