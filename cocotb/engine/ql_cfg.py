#!/bin/python3
import math
import os

current_path = os.path.dirname(os.path.abspath(__file__))

def gen_qiling_cfg(elf_file, load_addr = 0x0, stack_size = 0x20000, heap_size = 0x20000):
    file_size = os.path.getsize(elf_file)
    fw_size = math.ceil(file_size/0x1000)*0x1000 # 计算固件大小 0x1000对齐
    ram_size = fw_size + stack_size + 0x1000 # 初始分配的内存大小包括 固件和栈空间大小，+0x1000是为了使可用的栈大小与stack_size保持一致
    cfg_str = f"""
    [CODE]
    ram_size = {ram_size}
    entry_point = {load_addr}
    heap_size = {heap_size}
    [MISC]
    current_path = /
    """
    with open(f"{current_path}/profile/ql-config.ql", 'w') as fp:
        fp.write(cfg_str)

if __name__ == "__main__":
    print(f"{current_path}/../tests/rv32i/build/rsort")
    gen_qiling_cfg(f"{current_path}/../tests/rv32i/build/rsort")

# # 指定文件路径
# file_path = "./tests/rv32i/build/rsort"

# # 使用 os.path.getsize() 函数获得文件字节数
# file_size = os.path.getsize(file_path)


# # 加载地址
# load_addr= 0x0 #0x8000000

# # 栈大小
# stack_size = 0x20000

# # 堆大小
# heap_size = 0x20000

# # 计算固件大小 0x1000对齐
# fw_size = math.ceil(file_size/0x1000)*0x1000

# # 初始分配的内存大小包括 固件和栈空间大小，+0x1000是为了使可用的栈大小与stack_size保持一致
# ram_size = fw_size + stack_size + 0x1000

# cfg_str = f"""
# [CODE]
# ram_size = {ram_size}
# entry_point = {load_addr}
# heap_size = {heap_size}
# [MISC]
# current_path = /
# """
# # 保存配置文件
# with open('ql-config.ql', 'w') as fp:
#     fp.write(cfg_str)