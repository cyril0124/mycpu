#!/bin/bash

cd build
rm *.vcd *.fst *.fst.hier
make -j 16
./mycpu_test | tee ../out.log
