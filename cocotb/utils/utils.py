import numpy as np

RED = '\033[31m'
RESET = '\033[0m'

uint32 = lambda value: np.uint32(value)


def riscv_reg_name(reg_num):
    if 0 <= reg_num <= 31:
        if reg_num == 0:
            return "zero"
        elif 1 <= reg_num <= 2:
            return f"ra" if reg_num == 1 else f"sp"
        elif 3 <= reg_num <= 4:
            return f"gp" if reg_num == 3 else f"tp"
        elif 5 <= reg_num <= 7:
            return f"t{reg_num - 5}"
        elif 8 <= reg_num <= 9:
            return f"s{reg_num - 8 + 1}"
        elif 10 <= reg_num <= 17:
            return f"a{reg_num - 10}"
        elif 18 <= reg_num <= 27:
            return f"s{reg_num - 18 + 3}"
        elif 28 <= reg_num <= 31:
            return f"t{reg_num - 28 + 3}"
    else:
        raise ValueError("Input should be between 0 and 31.")
    

def report_int_regs(regs):
    for i in range(0, 31):
        print('{:<20}'.format(f"{riscv_reg_name(i)} / x{i} = {'{:#08x}'.format(regs[i])}"),end=" ")
        if (i+1) % 4 == 0: 
            print()
    print('\n')

def log(str='', end='\n', verbose = False):
    verbose and print(str, end=end)

def compare_int_regs(dut_int_regs, engine_int_regs, verbose = True):
    all_same = True
    for i in range(0, 31):
        if dut_int_regs[i] != engine_int_regs[i]:
            all_same = False
            print('{:<40}'.format(f"{riscv_reg_name(i)} / x{i} = {'{:#08x}'.format(engine_int_regs[i])}" + " <==> " + RED + 'm {:#08x}'.format(dut_int_regs[i]) + RESET), end=" ")
            print()
        else:
            log('{:<40}'.format(f"{riscv_reg_name(i)} / x{i} = {'{:#08x}'.format(engine_int_regs[i])}" + "<==>" + f"m {'{:#08x}'.format(dut_int_regs[i])}"), end=" ", verbose=verbose)
        if (i+1) % 4 == 0:
            log(verbose=verbose)
    log('\n', verbose=verbose)
    verbose and all_same and log("int reg all same!", verbose=verbose)
    if all_same == False:
        assert False, RED + "error while doing int reg compare!" + RESET
        return 0
    else:
        return 1