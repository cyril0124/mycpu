# Makefile

TOPLEVEL_LANG = verilog
TOPLEVEL = top_tb
MODULE = top_tb

SIM ?= verilator

PRJ_DIR = $(shell pwd)
DUT_DIR = ${PRJ_DIR}/dut
VERILOG_SOURCES = $(shell find ${DUT_DIR} -name "*.v" -or -name "*.sv")
# EXTRA_ARGS += --trace --trace-structs --timescale-override 1ns/1ns  # enable verilaro logging waveform
EXTRA_ARGS += --threads 4 --no-timing

include $(shell cocotb-config --makefiles)/Makefile.sim


profile:
	gprof2dot -f pstats test_profile.pstat | dot -Tpng -o callgraph.png
