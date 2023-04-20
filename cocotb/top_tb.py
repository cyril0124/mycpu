# top_tb.py
import os
import random
import numpy as np

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import FallingEdge, RisingEdge

from utils import *
from engine.ql_engine import *
# from cocotb.log import SimLog
# logger = SimLog(__name__)
current_path = os.path.dirname(os.path.abspath(__file__))

def load_image(elf_file='', mwidth = 16):
    script_path = os.path.abspath(f"{current_path}/../scripts/load_image")
    image_path = os.path.abspath(f"{current_path}/../src/main/resources")
    cmd = f"python3 {script_path}/main.py {elf_file} -s {mwidth}"
    os.system(cmd)
    os.system(f"rm {image_path}/Imem.hex")
    os.system(f"cp {current_path}/Imem.hex {image_path}/Imem.hex")

# Debug: 
# method 1
#   from remote_pdb import RemotePdb; rpdb = RemotePdb("127.0.0.1", 4000)
#   rpdb.set_trace()  # <-- debugger stops execution after this line
#   <your code line>  # <-- next statement being evaluated by the interpreter
#   telnet 127.0.0.1 4000
# method 2
#   can be access via VSCode's Debug 
#   https://github.com/microsoft/debugpy
#   import debugpy
#   debugpy.listen(5678)
#   debugpy.wait_for_client() 
#   breakpoint()

image = 'median'
dut_cpu_state: CPUState = CPUState(0)
ql = QlEngine(f"{current_path}/tests/rv32i/build/{image}.bin", verbose=False)

# get chisel signal
def get_signal(dut, str):
    temp = str.replace('.', '_').replace('(', '_').replace(')_', '_').replace(')','')
    return getattr(dut, temp)

async def cpu_running(dut):
    clock = Clock(dut.clock, 2, units="us")  # Create a 10us period clock on port clk
    cocotb.start_soon(clock.start())  # Start the clock
    await RisingEdge(dut.clock)  # Wait for at least one clock cycle

    dut.io_in_start.value = 1
    dut.reset.value = 1
    await RisingEdge(dut.clock)
    dut.reset.value = 0
    
    dut_inst_commit = dut.io_out_state_instState_commit
    dut_int_regs = [get_signal(dut, f"io.out.state.intRegState.regState({reg_id})") for reg_id in range(0, 32)] # signal alias
    dut_inst = dut.io_out_state_instState_inst
    dut_pc = dut.io_out_state_instState_pc

    cycles = 0
    try:
        for _ in range(10000*200):
            cycles = cycles + 1
            if dut_inst_commit.value == 1:
                # dut.core_inst.val.value = 1 # cycles + dut_cpu_state.pc + 1
                # if cycles % 1000 == 1:
                #     print("1000 cycles pass..")
                print(f"pc ==> {hex(ql.cpu_state.pc)}")    
                # dut._log.info(f"pc ==> {hex(ql.cpu_state.pc)}") 
                if ql.step() == 1:
                    raise
                # dut_cpu_state.int_regs = [getattr(dut, f"io_out_state_intRegState_regState_{reg_id}").value.integer for reg_id in range(0, 32)]
                dut_cpu_state.int_regs = [dut_int_regs[reg_id].value.integer for reg_id in range(0, 32)] # higher performance writting style using signal alias
                dut_cpu_state.inst = dut_inst.value.integer
                dut_cpu_state.pc = dut_pc.value.integer
                # report_int_regs(dut_cpu_state.int_regs)
                compare_int_regs(dut_cpu_state.int_regs, ql.cpu_state.int_regs, verbose = False)
            await FallingEdge(dut.clock)
    except:
        ipc: float = ql.inst_count / cycles
        cpi: float = 1 / ipc
        print(f"inst num: {ql.inst_count} cycles: {cycles} ipc: {ipc:.2f} cpi: {cpi:.2f}")
        # print(f"{dut.core_inst.count.value.integer}")


@cocotb.test()
async def cpu_running_test(dut):
    load_image(f"{current_path}/tests/rv32i/build/{image}")
    await cpu_running(dut)

