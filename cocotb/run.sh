#!/bin/bash

# COCOTB_ENABLE_PROFILING=1 
time make -j 32 SIM=verilator
# | tee out.log
# 2> out.log