# import sys
# import os
# import re


# def main():
#     argv_len = len(sys.argv)
#     if(argv_len != 2):
#         # read dissassembly file and generate hex code of instruction
#         assert "Usage: python3 main.py <elf file> <mode: -s(single memory(ROM)) -m(seperate ROM & RAM)>\n"

#     # read image and parse segment table
#     image = sys.argv[1]
#     try:
#         mode = sys.argv[2]
#     except:
#         mode = "-s" 
#     cmd = "readelf -S " + image + " > table.txt"
#     os.system(cmd)
#     text_start = 0
#     text_end = 0
#     data_start = 0
#     if mode == '-m':
#         with open("table.txt", 'r') as f:
#             for line in f:
#                 line_content = re.split(r'[;,\s\[\]]\s*', line.lower())
#                 for val in line_content:
#                     if ".text" in val:
#                         text_start = int(line_content[5], 16)
#                         print(".text start address: " + str(text_start) + " 0x" + line_content[5])
#                         text_end = int(line_content[7], 16)
#                         print(".text end address: " + str(text_end) + " 0x" + line_content[7])
#                     if ".data" in val:
#                         data_start = int(line_content[5], 16)
#                         print(".data start address: " + str(data_start) + " 0x" + line_content[5])

#     # parse binary file from elf file
#     bin_file = image + ".bin"
#     cmd = "riscv32-unknown-elf-objcopy -O binary " + image + " " + bin_file
#     os.system(cmd)

#     addr = 0
#     out_text = "Imem.hex"
#     out_data = "Dmem.hex"
#     with open(bin_file,'rb') as f:
#         wt = open(out_text, 'wt')
#         wd = open(out_data, 'wt')
#         content = f.read(os.path.getsize(bin_file))
#         index = 0
#         b0 = 0
#         b1 = 0
#         b2 = 0
#         b3 = 0
#         for b in content:
#             hex_val = b #'{:02x}'.format(b)
#             if index == 0 :
#                 b0 = hex_val
#                 index = index + 1
#             elif index == 1 :
#                 b1 = hex_val
#                 index = index + 1
#             elif index == 2:
#                 b2 = hex_val
#                 index = index + 1
#             elif index == 3:
#                 b3 = hex_val
#                 index = 0
#                 array = []
#                 array.append(b3)
#                 array.append(b2)
#                 array.append(b1)
#                 array.append(b0)
#                 if mode == '-m':
#                     if addr < text_end and addr >= text_start:
#                         wt.write(bytearray(array).hex() + '\n')
#                     elif addr >= data_start:
#                         wd.write(bytearray(array).hex() + '\n')
#                 elif mode == '-s':
#                     wt.write(bytearray(array).hex() + '\n')
#             addr = addr + 1
#     wt.close()
#     wd.close()



# if __name__ == '__main__': main()


import sys
import os
import re


def main():
    argv_len = len(sys.argv)
    if(argv_len != 2):
        # read dissassembly file and generate hex code of instruction
        assert "Usage: python3 main.py <elf file> <mode: -s(single memory(ROM)) -m(seperate ROM & RAM)> <memory width, default: 4-byte>\n"
    print("load_image")
    # read image and parse segment table
    image = sys.argv[1]
    try:
        mode = sys.argv[2]
    except:
        mode = "-s" 
    try:
        mwidth = int(sys.argv[3])
    except:
        mwidth = 16
    cmd = "readelf -S " + image + " > table.txt"
    os.system(cmd)
    text_start = 0
    text_end = 0
    data_start = 0
    if mode == '-m':
        with open("table.txt", 'r') as f:
            for line in f:
                line_content = re.split(r'[;,\s\[\]]\s*', line.lower())
                for val in line_content:
                    if ".text" in val:
                        text_start = int(line_content[5], 16)
                        print(".text start address: " + str(text_start) + " 0x" + line_content[5])
                        text_end = int(line_content[7], 16)
                        print(".text end address: " + str(text_end) + " 0x" + line_content[7])
                    if ".data" in val:
                        data_start = int(line_content[5], 16)
                        print(".data start address: " + str(data_start) + " 0x" + line_content[5])

    # parse binary file from elf file
    bin_file = image + ".bin"
    cmd = "riscv32-unknown-elf-objcopy -O binary " + image + " " + bin_file
    os.system(cmd)

    addr = 0
    out_text = "Imem.hex"
    out_data = "Dmem.hex"
    with open(bin_file,'rb') as f:
        wt = open(out_text, 'wt')
        wd = open(out_data, 'wt')
        content = f.read(os.path.getsize(bin_file))
        index = 0
        count = 0
        byte_array = list()
        for b in content:
            hex_val = b
            if index % mwidth == count:
                byte_array.append(hex_val)
            index = index + 1
            count = count + 1
            
            if count == mwidth:
                # wt.write(bytearray(byte_array[::-1]).hex() + '\n')
                if mode == '-m':
                    if addr < text_end and addr >= text_start:
                        wt.write(bytearray(byte_array[::-1]).hex() + '\n')
                    elif addr >= data_start:
                        wd.write(bytearray(byte_array[::-1]).hex() + '\n')
                elif mode == '-s':
                    wt.write(bytearray(byte_array[::-1]).hex() + '\n')
                byte_array.clear()
                count = 0
        # unalign address
        for i in range(0, mwidth-count):
            byte_array.append(0)
        wt.write(bytearray(byte_array[::-1]).hex() + '\n')
        # b0 = 0
        # b1 = 0
        # b2 = 0
        # b3 = 0
        # for b in content:
        #     hex_val = b #'{:02x}'.format(b)
        #     if index == 0 :
        #         b0 = hex_val
        #         index = index + 1
        #     elif index == 1 :
        #         b1 = hex_val
        #         index = index + 1
        #     elif index == 2:
        #         b2 = hex_val
        #         index = index + 1
        #     elif index == 3:
        #         b3 = hex_val
        #         index = 0
        #         array = []
        #         array.append(b3)
        #         array.append(b2)
        #         array.append(b1)
        #         array.append(b0)
        #         if mode == '-m':
        #             if addr < text_end and addr >= text_start:
        #                 wt.write(bytearray(array).hex() + '\n')
        #             elif addr >= data_start:
        #                 wd.write(bytearray(array).hex() + '\n')
        #         elif mode == '-s':
        #             wt.write(bytearray(array).hex() + '\n')
        #     addr = addr + 1
    wt.close()
    wd.close()



if __name__ == '__main__': main()