#!/bin/bash

rm /home/cyril/workspace/riscv/mycpu/src/main/resources/Imem.hex.txt.bak
cp /home/cyril/workspace/riscv/mycpu/src/main/resources/Imem.hex.txt /home/cyril/workspace/riscv/mycpu/src/main/resources/Imem.hex.txt.bak
rm /home/cyril/workspace/riscv/mycpu/src/main/resources/Imem.hex.txt
cp /home/cyril/workspace/riscv/mycpu/scripts/simple_asm/test_out /home/cyril/workspace/riscv/mycpu/src/main/resources/Imem.hex.txt
