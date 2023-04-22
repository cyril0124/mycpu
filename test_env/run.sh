#!/bin/bash
curr_dir=$(dirname $(readlink -f "$0"))
dut_log="dut.log"

cd build
rm *.vcd *.fst *.fst.hier
make -j 16
echo ${curr_dir}/$dut_log
time ./mycpu_test 2> ${curr_dir}/$dut_log  | tee ../out.log 
