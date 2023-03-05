#!/bin/python3

import sys
import re

from instruction import Instruction

abs_path = '/home/cyril/workspace/riscv/mycpu/scripts/simple_asm/'

def code_write(code_str, comment, wf, with_comment = False):
    typ = type(code_str)
    if(typ == list):
        for code in code_str:
            # print(code,file=wf)
            print(code, file=wf, end='')
        print(file=wf)
    elif(typ == str):
        print(code_str,file=wf,end='')
    if(with_comment):
        print(' // '+ comment,file=wf)


# TODO: support label => implementation of [symbol table]
def main():
    argv_len = len(sys.argv)
    print(argv_len)

    # Usage error
    if(argv_len != 3+1):
        print("Usage: \n\t./simple_asm.py <asm file> <out file> <out_format:'hex' or 'bin'>\n")
        assert False, "argument expect 3, got " + str(argv_len-1)

    # get file name and format type
    asm_file = sys.argv[1]
    out_file = sys.argv[2]
    out_format = sys.argv[3]

    with open(abs_path + out_file, 'wt') as wf:
        rwf = open(abs_path + out_file + '.read', 'wt')
        print('Readable version of ['+out_file+'] :',file=rwf)
        with open(abs_path + asm_file,'rt') as f:
            print("read from ["+asm_file+"]...")
            inst_addr = 0

            for line in f:
                # read and parse input str
                temp_line = re.split(r'[;,\s]\s*', line.lower())

                # comment line
                if(temp_line[0] == '//' or temp_line[0] == '#'):
                    continue

                inst_str = list()
                if(temp_line.count('//') != 0): # has comment
                    inst_str = temp_line[0:temp_line.index('//')] # reduce comment of the whole instruction string
                elif(temp_line.count('#') != 0): # has comment
                    inst_str = temp_line[0:temp_line.index('#')] # reduce comment of the whole instruction string
                else: # without comment
                    # reduce '\n'
                    if(temp_line.count('') != 0):
                        inst_str = temp_line[0:temp_line.index('')]
                    else:
                        inst_str = temp_line
                
                # instruction parse and decode
                print(inst_str)
                inst = Instruction(inst_str)

                assert out_format == 'bin' or out_format == 'hex', "code format error"
                # write output file
                code = inst.to_binary() if(out_format == 'bin') else inst.to_hex(to_one_line=False,prefix=False) if(out_format == 'hex') else ''
                # code_reverse = code[::-1]
                code_reverse = code
                print(code_reverse)
                code_write(code_reverse,line[:-1],wf,with_comment=False)
                
                # readable version of generate output file
                # code_r = inst.to_binary() if(out_format == 'bin') else inst.to_hex(to_one_line=True,prefix=True) if(out_format == 'hex') else ''
                code_write(
                        str( '    '
                            + "0x%04X: "%(inst_addr)
                            + str(inst.to_hex(to_one_line=True,prefix=True)) 
                            + ' [' + str(inst.to_binary(format_save=True)) + '] \t' 
                            + str(inst.itype.name)
                            ), \
                        comment = line[:-1], \
                        wf = rwf, \
                        with_comment=True
                )
                
                inst_addr = inst_addr + 4
            print()
        rwf.close()
    

if __name__ == '__main__': main()



