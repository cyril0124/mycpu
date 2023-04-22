# top_tb.py
import os
import random
import numpy as np

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import FallingEdge, RisingEdge

from utils import *
from engine.ql_engine import *

import PySimpleGUI as sg
import time
import threading

# Settings for you to modify are the size of the element, the circle width & color and the font for the % complete
GRAPH_SIZE = (100 , 100)          # this one setting drives the other settings
CIRCLE_LINE_WIDTH, LINE_COLOR = 20, 'yellow'
TEXT_FONT = 'Courier'


# Computations based on your settings above
TEXT_HEIGHT = GRAPH_SIZE[0]//4
TEXT_LOCATION = (GRAPH_SIZE[0]//2, GRAPH_SIZE[1]//2)
TEXT_COLOR = LINE_COLOR


def update_meter(graph_elem, percent_complete):
    """
    Update a circular progress meter
    :param graph_elem:              The Graph element being drawn in
    :type graph_elem:               sg.Graph
    :param percent_complete:        Percentage to show complete from 0 to 100
    :type percent_complete:         float | int
    """
    graph_elem.erase()
    arc_length = percent_complete/100*360+.9
    if arc_length >= 360:
        arc_length = 359.9
    graph_elem.draw_arc((CIRCLE_LINE_WIDTH, GRAPH_SIZE[1] - CIRCLE_LINE_WIDTH), (GRAPH_SIZE[0] - CIRCLE_LINE_WIDTH, CIRCLE_LINE_WIDTH),
                    arc_length, 0, 'arc', arc_color=LINE_COLOR, line_width=CIRCLE_LINE_WIDTH)
    percent = percent_complete
    graph_elem.draw_text(f'{percent:.0f}%', TEXT_LOCATION, font=(TEXT_FONT, -TEXT_HEIGHT), color=TEXT_COLOR)



def test(ql_cpu_state):
    # 初始化窗口布局
    layout = [
        [sg.Text('Register')],
        [sg.Multiline('', size=(60, 10), key='-REGISTERS-')],
        [sg.Text('PC')],
        [sg.Multiline('', size=(60, 10), key='-PC-')],
        [sg.Button('update info'), sg.Button('exit'),],
        [sg.Graph(GRAPH_SIZE, (0,0), GRAPH_SIZE, key='-GRAPH-')],
    ]

    # 创建窗口
    window = sg.Window('Simulation Info', layout, finalize=True)

    total_count = 10661
    # 进入事件循环
    while True:
        window['-REGISTERS-'].update(f"{random.randint(0, 100)}")
        window['-PC-'].update(hex(ql_cpu_state.pc))
        update_meter(window['-GRAPH-'], ql_cpu_state.inst_count/total_count*100)
        event, values = window.read(timeout=0)
        # 处理事件
        if event == sg.WIN_CLOSED or event == 'exit' or ql_cpu_state.inst_count >= total_count - 10:
            break
        # elif event == 'update info':
        #     # TODO: 在这里添加更新寄存器和PC指针信息的代码
        #     # 获取寄存器信息和PC指针信息
        #     registers = [1,2,3,45] # get_registers()
        #     pc = [0x04] # get_pc()

        #     # 更新窗口显示
        #     window['-REGISTERS-'].update(registers)
        #     window['-PC-'].update(pc)
    # 关闭窗口
    window.close()

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
ql = QlEngine(f"{current_path}/tests/rv32i/build/{image}.bin", image, verbose=False)

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

    thread = threading.Thread(target=test, args=(ql.cpu_state,), daemon=True)
    # thread.start()
    cycles = 0
    try:
        for _ in range(10000*200):
            ql.cpu_state.inst_count = ql.inst_count
            cycles = cycles + 1
            if dut_inst_commit.value == 1:
                print(f"pc ==> {hex(ql.cpu_state.pc)}")    
                # dut._log.info(f"pc ==> {hex(ql.cpu_state.pc)}") 
                if ql.step() == 1:
                    raise
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
        # thread.join()


@cocotb.test()
async def cpu_running_test(dut):
    load_image(f"{current_path}/tests/rv32i/build/{image}")
    await cpu_running(dut)

