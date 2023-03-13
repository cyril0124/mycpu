TOP_PRJ_DIR := /home/cyril/workspace/riscv/mycpu
SCRIPT_DIR := ${TOP_PRJ_DIR}/scripts

PRJ_DIR := ${shell pwd}
SRC_DIR := ${PRJ_DIR}/src
BUILD_DIR := ${PRJ_DIR}/build

RISCV_PREFIX ?= /usr/software/riscv/bin/riscv32-unknown-elf-
RISCV_GCC ?= $(RISCV_PREFIX)gcc
RISCV_GCC_OPTS ?= -static -mcmodel=medany -fvisibility=hidden -nostdlib -nostartfiles
RISCV_OBJDUMP ?= $(RISCV_PREFIX)objdump --disassemble-all
RISCV_OBJCOPY ?= $(RISCV_PREFIX)objcopy

SRCS := $(shell find $(SRC_DIR) -name '*.c' -or -name '*.s')
OBJS := $(SRCS:$(SRC_DIR)/%.s=$(BUILD_DIR)/%.o)
TARGETS := ${SRCS:${SRC_DIR}/%.s=${BUILD_DIR}/%}
DUMPS := ${SRCS:${SRC_DIR}/%.s=${BUILD_DIR}/%.dump}

all: ${TARGETS} ${DUMPS}

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.s
	$(RISCV_GCC) -c $< -o $@

$(BUILD_DIR)/%: $(BUILD_DIR)/%.o
	$(RISCV_GCC) $(RISCV_GCC_OPTS) -T $(PRJ_DIR)/link.ld $< -o $@
# add test case configuration file
	- cd ${TOP_PRJ_DIR}/test_env/tests; python3 ${SCRIPT_DIR}/json_config/main.py -a $(@F).bin ${BUILD_DIR} 42

$(BUILD_DIR)/%.dump: $(BUILD_DIR)/%
	$(RISCV_OBJDUMP) $< > /$@
	$(RISCV_OBJCOPY) -O verilog $< $<.verilog
	$(RISCV_OBJCOPY) -O binary $< $<.bin


RV32UI_P_DIR := ${PRJ_DIR}/rv32ui-p
RV32UI_P_DUMPS := $(shell find $(RV32UI_P_DIR) -name '*.dump')
RV32UI_P_TGT := $(RV32UI_P_DUMPS:$(RV32UI_P_DIR)/%.dump=$(RV32UI_P_DIR)/%)
RV32UI_P_BIN := $(RV32UI_P_DUMPS:$(RV32UI_P_DIR)/%.dump=$(RV32UI_P_DIR)/%.bin)

rv32ui-p: json_clean ${RV32UI_P_BIN}

${RV32UI_P_DIR}/%.bin: ${RV32UI_P_DIR}/%
	$(RISCV_OBJCOPY) -O binary $< $<.bin
	- cd ${TOP_PRJ_DIR}/test_env/tests; python3 ${SCRIPT_DIR}/json_config/main.py -a $(@F) ${RV32UI_P_DIR} 42

json_clean:
	cd ${TOP_PRJ_DIR}/test_env/tests; python3 ${SCRIPT_DIR}/json_config/main.py -i

clean: json_clean
	rm -rf ${BUILD_DIR}/*
	rm -rf ${RV32UI_P_BIN}


