#!/bin/python3
import os
import sys
from pathlib import Path
from qiling import Qiling
from qiling.const import QL_VERBOSE
from unicorn.riscv_const import *

import numpy as np

from .ql_cfg import gen_qiling_cfg

sys.path.append(str(Path(__file__).resolve().parent.parent))
from utils import *

current_path = os.path.dirname(os.path.abspath(__file__))

class CPUState:
    def __init__(self, pc):
        self.pc = pc
        self.int_regs = [None] * 32 # np.zeros(32, dtype=np.uint32)#
        self.inst = None
        self.inst_count = 0


class QlEngine:
    def __init__(self, bin_file, reset_pc = 0x0, verbose = False):
        self.load_image(bin_file)
        self._ql = Qiling(code = self.binary_data,  archtype='RISCV', ostype="blob", profile=f"{current_path}/profile/ql-config.ql", verbose = QL_VERBOSE.DEFAULT)
        self.cpu_state = CPUState(reset_pc)
        self.inst_count = 0
        self.image = bin_file
        self._verbose = verbose
        self.reg_init()
    
    def reg_init(self):
        off = UC_RISCV_REG_X0
        for i in range(0, 32):
            self._ql.arch.regs.write(off + i, 0)

    def _log(self, str='', end='\n'):
        self._verbose and print(str, end=end)

    def load_image(self, bin_file):
        name_without_suffix = os.path.splitext(bin_file)[0]
        print(f"bin file is {name_without_suffix}")
        gen_qiling_cfg(f"{name_without_suffix}")
        with open(f'{bin_file}', 'rb') as f:
            self.binary_data = f.read()
    
    def reset(self, bin_file, reset_pc = 0x0, verbose = False):
        self._ql = None
        self.__init__(bin_file, reset_pc, verbose)

    def stop(self):
        self._ql.stop()

    def step(self, n = 1):
        try:
            self._log(f"pc ==> {hex(self.cpu_state.pc)}")
            self._ql.emu_start(begin = self.cpu_state.pc, end = len(self.binary_data), count = n)
            self.cpu_state.pc = self._ql.arch.regs.arch_pc
            self.inst_count = self.inst_count + 1
            self.read_regs_all()
            # if self.cpu_state.pc == 0x27a0 or self.cpu_state.pc == 0x2930:
            #     raise
            if self.cpu_state.pc == 0x265c:
                raise
            return 0
        except:
            print(f"TERMINATE!!! ==> inst_count: {self.inst_count}")
            return 1

    def read_reg(self, reg_id):
        return self._ql.arch.regs.read(reg_id)

    def read_regs_all(self):
        offset = UC_RISCV_REG_X0
        # read all int regs
        self._log("---------------------int regs--------------------")
        for i in range(0, 31):
            self.cpu_state.int_regs[i] = self.read_reg(offset + i)# self._ql.arch.regs.read(offset + i)
            self._log('{:<20}'.format(f"{riscv_reg_name(i)} / x{i} = {'{:#08x}'.format(self.cpu_state.int_regs[i])}"),end=" ")
            if i % 4 == 0: 
                self._log()
        self._log("\n")

if __name__ == "__main__":
    print(f"{current_path}/../tests/rv32i/build/rsort")
    ql = QlEngine(f"{current_path}/../tests/rv32i/build/rsort.bin")
    while ql.step() != 1:
        # print(hex(ql.pc))
        pass
