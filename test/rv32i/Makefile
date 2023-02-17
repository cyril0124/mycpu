TOP_PRJ_DIR := /home/cyril/workspace/riscv/mycpu
SCRIPT_DIR := ${TOP_PRJ_DIR}/scripts
TOP_BUILD_DIR := ${TOP_PRJ_DIR}/build
mod = MyCpu
mill_mod = MyCPU
PACKAGE = mycpu

PRJ_DIR := $(shell pwd)
BUILD_DIR := $(PRJ_DIR)/build
SRC_DIR := ${PRJ_DIR}/src
CFG_FILE := cfg.txt

# configure test program for single test(test)
prog := add

CC := riscv32-unknown-elf-gcc
OBJDUMP := riscv32-unknown-elf-objdump
QEMU := qemu-riscv32

SRCS := $(shell find $(SRC_DIR) -name '*.c' -or -name '*.s')
OBJS := $(SRCS:$(SRC_DIR)/%.s=$(BUILD_DIR)/%.o)
TARGET := ${SRCS:${SRC_DIR}/%.s=${BUILD_DIR}/%}
LSTO := ${SRCS:${SRC_DIR}/%.s=${BUILD_DIR}/%.o.lst}
LST := ${SRCS:${SRC_DIR}/%.s=${BUILD_DIR}/%.lst}
LOGS := ${SRCS:${SRC_DIR}/%.s=${BUILD_DIR}/%.log}

PROG := ${SRCS:${SRC_DIR}/%.s=%} # all of the test case in this directory

default: test-all

test-all: build objdump qemu-sim json_config_init 
	$(foreach p,$(PROG), cd ${TOP_PRJ_DIR}/test; python3 ${SCRIPT_DIR}/json_config/main.py -a ${p}.log ${BUILD_DIR} 42)
# 	run test
	- cd ${TOP_PRJ_DIR}; mill -j 8 ${mill_mod}.test.testOnly ${PACKAGE}.${mod}Test | tee "${TOP_BUILD_DIR}/${mod}Test.log"
	- cp ${TOP_BUILD_DIR}/${mod}Test.log ${TOP_PRJ_DIR}/temp
	- cp ${shell find ${TOP_PRJ_DIR}/test_run_dir -name '${mod}.vcd'} ${TOP_PRJ_DIR}/temp

test: build objdump qemu-sim json_config_init
# 	set test case configuration file for MyCpuTest.scala to read
	- cd ${TOP_PRJ_DIR}/test; python3 ${SCRIPT_DIR}/json_config/main.py -a ${prog}.log ${BUILD_DIR} 42
# 	run test
	- cd ${TOP_PRJ_DIR}; mill -j 8 ${mill_mod}.test.testOnly ${PACKAGE}.${mod}Test | tee "${TOP_BUILD_DIR}/${mod}Test.log"
	- cp ${TOP_BUILD_DIR}/${mod}Test.log ${TOP_PRJ_DIR}/temp
	- cp ${shell find ${TOP_PRJ_DIR}/test_run_dir -name '${mod}.vcd'} ${TOP_PRJ_DIR}/temp

build: ${TARGET} objdump

objdump: ${LST} ${LSTO}

qemu-sim: ${LOGS}

json_config_init:
	cd ${TOP_PRJ_DIR}/test; python3 ${SCRIPT_DIR}/json_config/main.py -i 


${LOGS}: ${TARGET}
	- $(QEMU) -d nochain,cpu,in_asm -singlestep -D $@ $<

${LST}: ${TARGET}
	$(OBJDUMP) -d $< > $@

${LSTO}: $(OBJS)
	$(OBJDUMP) -d $< > $@


$(TARGET): $(OBJS)
	$(CC) -O0 -nostdlib -nostdinc -T $(SRC_DIR)/link.ld $< -o $@

$(OBJS): $(SRCS)
	$(CC) -O0 -c $< -o $@


clean:
	rm -rf ${BUILD_DIR}/*

.PHONY: clean objdump build test qemu-sim test json_config_init test-all