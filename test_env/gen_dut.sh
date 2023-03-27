#!/bin/bash

cd build/
make clean
cd ..
cd ..
make rtl mod=Core

cd scripts/extract_verilog_module
pwd
rm Core.v
rm -rf output/*
cp ../../build/Core.v .
python3 main.py Core.v

rm ../../test_env/dut/rtl/*
cp output/* ../../test_env/dut/rtl
cp /home/cyril/workspace/riscv/mycpu/src/main/resources/*.v ../../test_env/dut/rtl
