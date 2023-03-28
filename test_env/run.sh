#!/bin/bash

cd build
rm *.vcd *.fst
make -j 16
./mycpu_test | tee ../out.log
