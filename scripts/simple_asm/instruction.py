from enum import Enum, auto
import textwrap
import re

from util import *

class InstType(Enum):
    R_TYPE = auto()
    I_TYPE = auto()
    S_TYPE = auto()
    B_TYPE = auto()
    U_TYPE = auto()
    J_TYPE = auto()


class Decoder:
    opcode = None
    funct3 = None
    funct7 = None
    rs1 = None
    rs2 = None
    rd = None
    imm = None
    itype = None

    decode_table = {
                #   opcode    funct3  funct7    inst_type
        # RV32I
        'lb'    : [ 0b0000011, 0b000, None     , InstType.I_TYPE  ],
        'lh'    : [ 0b0000011, 0b001, None     , InstType.I_TYPE  ],
        'lw'    : [ 0b0000011, 0b010, None     , InstType.I_TYPE  ],
        'lbu'   : [ 0b0000011, 0b100, None     , InstType.I_TYPE  ],
        'lhu'   : [ 0b0000011, 0b101, None     , InstType.I_TYPE  ],
        'addi'  : [ 0b0010011, 0b000, None     , InstType.I_TYPE  ],
        'slli'  : [ 0b0010011, 0b001, 0b0000000, InstType.I_TYPE  ],
        'slti'  : [ 0b0010011, 0b010, None     , InstType.I_TYPE  ],
        'sltiu' : [ 0b0010011, 0b011, None     , InstType.I_TYPE  ],
        'xori'  : [ 0b0010011, 0b100, None     , InstType.I_TYPE  ],
        'srli'  : [ 0b0010011, 0b101, 0b0000000, InstType.I_TYPE  ],
        'srai'  : [ 0b0010011, 0b101, 0b0100000, InstType.I_TYPE  ],
        'ori'   : [ 0b0010011, 0b110, None     , InstType.I_TYPE  ],
        'andi'  : [ 0b0010011, 0b111, None     , InstType.I_TYPE  ],
        'auipc' : [ 0b0010111, None , None     , InstType.U_TYPE  ],
        'sb'    : [ 0b0100011, 0b000, None     , InstType.S_TYPE  ],
        'sh'    : [ 0b0010011, 0b001, None     , InstType.S_TYPE  ],
        'sw'    : [ 0b0010011, 0b010, None     , InstType.S_TYPE  ],
        'add'   : [ 0b0110011, 0b000, 0b0000000, InstType.R_TYPE  ],
        'sub'   : [ 0b0110011, 0b000, 0b0100000, InstType.R_TYPE  ],
        'sll'   : [ 0b0110011, 0b001, 0b0000000, InstType.R_TYPE  ],
        'slt'   : [ 0b0110011, 0b010, 0b0000000, InstType.R_TYPE  ],
        'sltu'  : [ 0b0110011, 0b011, 0b0000000, InstType.R_TYPE  ],
        'xor'   : [ 0b0110011, 0b100, 0b0000000, InstType.R_TYPE  ],
        'srl'   : [ 0b0110011, 0b101, 0b0000000, InstType.R_TYPE  ],
        'sra'   : [ 0b0110011, 0b101, 0b0100000, InstType.R_TYPE  ],
        'or'    : [ 0b0110011, 0b110, 0b0000000, InstType.R_TYPE  ],
        'and'   : [ 0b0110011, 0b111, 0b0000000, InstType.R_TYPE  ],
        'lui'   : [ 0b0110111, None , None     , InstType.U_TYPE  ],
        'beq'   : [ 0b1100011, 0b000, None     , InstType.B_TYPE  ],
        'bne'   : [ 0b1100011, 0b001, None     , InstType.B_TYPE  ],
        'blt'   : [ 0b1100011, 0b100, None     , InstType.B_TYPE  ],
        'bge'   : [ 0b1100011, 0b101, None     , InstType.B_TYPE  ],
        'bltu'  : [ 0b1100011, 0b110, None     , InstType.B_TYPE  ],
        'bgeu'  : [ 0b1100011, 0b111, None     , InstType.B_TYPE  ],
        'jalr'  : [ 0b1100111, 0b000, None     , InstType.I_TYPE  ],
        'jal'   : [ 0b1101111, None , None     , InstType.J_TYPE  ],
    }

    def inst_get_imm(self, inst_str):
        def imm_decode(str):
            out = None
            if(str.find('0x') != -1):
                out = int(str, base=16)
            elif(str.find('0b') != -1):
                out = int(str, base=2)
            elif( (ord(str[0]) - ord('0')) >= 0 and (ord(str[0]) - ord('0')) <=9 ):
                out = int(str)
            return out

        inst_name = inst_str[0]
        imm = None
        if(list_exist(['lb','lh','lw','lbu','lhu','sb','sh','sw'], inst_name)):
            # lb rd, imm(rs1)
            temp = inst_str[2][0:inst_str[2].find('(')]
            imm = imm_decode(temp)
        elif(list_exist(['addi','slli','slti','sltiu','xori','srli','srai','ori','andi','jalr'], inst_name)):
            # addi rd, rs1, imm
            temp = inst_str[3]
            imm = imm_decode(temp)
        elif(list_exist(['auipc','lui','jal'], inst_name)): 
            # auipc rd, upimm
            temp = inst_str[2]
            imm = imm_decode(temp)
        elif(list_exist(['beq','bne','blt','bge','bltu','bgeu'], inst_name)):
            temp = inst_str[3]
            imm = imm_decode(temp)
        # print(imm)
        return imm
    
    def reg2num(self, reg_str):
        num = None
        if(list_exist(['x0','zero'],reg_str)):
            num = 0
        elif(list_exist(['x1','ra'],reg_str)):
            num = 1
        elif(list_exist(['x2','sp'],reg_str)):
            num = 2
        elif(list_exist(['x3','gp'],reg_str)):
            num = 3
        elif(list_exist(['x4','tp'],reg_str)):
            num = 4
        elif(list_exist(['x5','x6','x7','t0','t1','t2'],reg_str)):
            if(reg_str[0] == 'x'):
                num = int(reg_str[1])
            else:
                num = int(reg_str[1]) + 5
        elif(list_exist(['x8','s0','fp'],reg_str)):
            num = 8
        elif(list_exist(['x9','s1'],reg_str)):
            num = 9
        elif(list_exist(['x10','x11','x12','x13','x14','x15','x16','x17','a0','a1','a2','a3','a4','a5','a6','a7'],reg_str)):
            if(reg_str[0] == 'x'):
                num = int(reg_str[1:])
            else:
                num = int(reg_str[1]) + 10
        elif(list_exist(['x18','x19','x20','x21','x22','x23','x24','x25','x26','x27','s2','s3','s4','s5','s6','s7','s8','s9','s10','s11'],reg_str)):
            if(reg_str[0] == 'x'):
                num = int(reg_str[1:])
            else:
                num = int(reg_str[1:]) + 16
        elif(list_exist(['x28','x29','x30','x31','t3','t4','t5','t6'],reg_str)):
            if(reg_str[0] == 'x'):
                num = int(reg_str[1:])
            else:
                num = int(reg_str[1:]) + 25
        # print(num)
        return num
    
    def inst_get_reg(self, inst_str, reg_type, inst_type):
        out = None
        if(reg_type == 'rd'):
            if(list_exist([InstType.I_TYPE, InstType.U_TYPE, InstType.R_TYPE, InstType.J_TYPE], inst_type)):
                out = self.reg2num(inst_str[1])
        elif(reg_type == 'rs1'):
            if(list_exist([InstType.I_TYPE, InstType.R_TYPE, InstType.S_TYPE], inst_type)):
                i = inst_str[2]
                if(inst_str[2].find('(') != 0):
                    out = self.reg2num(inst_str[2][i.find('(')+1:i.find(')')])
                else:
                    out = self.reg2num(inst_str[2])
            elif(list_exist([InstType.B_TYPE], inst_type)):
                out = self.reg2num(inst_str[1])
        elif(reg_type == 'rs2'):
            if(list_exist([InstType.S_TYPE], inst_type)):
                out = self.reg2num(inst_str[1])
            elif(list_exist([InstType.R_TYPE], inst_type)):
                out = self.reg2num(inst_str[3])
            elif(list_exist([InstType.B_TYPE], inst_type)):
                out = self.reg2num(inst_str[2])
        # print(str(inst_type)+' '+reg_type+' '+str(out))
        return out

    def __init__(self, inst_str):
        inst_name = inst_str[0]
        self.opcode = self.decode_table[inst_name][0]
        self.funct3 = self.decode_table[inst_name][1]
        self.funct7 = self.decode_table[inst_name][2]
        self.itype = self.decode_table[inst_name][3]
        self.imm =  self.inst_get_imm(inst_str)
        self.rs1 = self.inst_get_reg(inst_str,'rs1',self.itype)
        self.rs2 = self.inst_get_reg(inst_str,'rs2',self.itype)
        self.rd = self.inst_get_reg(inst_str,'rd',self.itype)


class Instruction:
    inst_str = ""
    decoder = None
    itype = None

    def __init__(self, inst_str):
        self.inst_str = inst_str
        self.decoder = Decoder(inst_str)
        self.itype = self.decoder.itype
        
    def to_binary(self, to_one_line = False, format_save = False):
        def fill(num, width):
            out = get_bin(0,width)
            if(num != None):
                out = get_bin(num,width)
            return out
        out = ['0b']
        if(self.decoder.itype == InstType.R_TYPE):
            out.append(fill(self.decoder.funct7,7))
            out.append(fill(self.decoder.rs2,5))
            out.append(fill(self.decoder.rs1,5))
            out.append(fill(self.decoder.funct3,3))
            out.append(fill(self.decoder.rd,5))
            out.append(fill(self.decoder.opcode,7))
            # print(out)
        elif(self.decoder.itype == InstType.I_TYPE):
            out.append(fill(self.decoder.imm,12))
            out.append(fill(self.decoder.rs1,5))
            out.append(fill(self.decoder.funct3,3))
            out.append(fill(self.decoder.rd,5))
            out.append(fill(self.decoder.opcode,7))
            # print(out)
        elif(self.decoder.itype == InstType.S_TYPE):
            out.append(fill(self.decoder.imm,12)[::-1][5:12][::-1])
            out.append(fill(self.decoder.rs2,5))
            out.append(fill(self.decoder.rs1,5))
            out.append(fill(self.decoder.funct3,3))
            out.append(fill(self.decoder.imm,12)[::-1][0:5][::-1])
            out.append(fill(self.decoder.opcode,7))
            # print(out)
        elif(self.decoder.itype == InstType.B_TYPE):
            out.append(fill(self.decoder.imm,13)[::-1][12][::-1] + fill(self.decoder.imm,12)[::-1][5:11][::-1])
            out.append(fill(self.decoder.rs2,5))
            out.append(fill(self.decoder.rs1,5))
            out.append(fill(self.decoder.funct3,3))
            out.append(fill(self.decoder.imm,13)[::-1][1:5][::-1] + fill(self.decoder.imm,12)[::-1][11][::-1])
            out.append(fill(self.decoder.opcode,7))
            # print(out)
        elif(self.decoder.itype == InstType.U_TYPE):
            out.append(fill(self.decoder.imm,32)[::-1][12:32][::-1])
            out.append(fill(self.decoder.rd,5))
            out.append(fill(self.decoder.opcode,7))
            # print(out)
        elif(self.decoder.itype == InstType.J_TYPE):
            out.append(fill(self.decoder.imm,32)[::-1][20][::-1] + fill(self.decoder.imm,32)[::-1][1:11][::-1] + fill(self.decoder.imm,32)[::-1][11][::-1] + fill(self.decoder.imm,32)[::-1][12:20][::-1])
            out.append(fill(self.decoder.rd,5))
            out.append(fill(self.decoder.opcode,7))
            # print(out)

        if(format_save):
            return ' '.join(out[1:])

        # concatenate string
        bin_str = ''.join(out[1:])

        # bit_num check
        assert(len(bin_str) == 32)

        # print(out)
        # print(real_out)

        real_out = None
        if(to_one_line == True):
            real_out = bin_str # one line binary code output
        else:
            temp_str = re.split(r'[;,\s]\s*', textwrap.fill(bin_str,8))
            real_out = temp_str # split 32-bit inst binary code to 4 parts, each part contains 8-bit(1 byte)
        
        # ! another way to generate hex string (to_string)
        # t = int(bin_str,base=2)
        # s = "%08x"%(t)
        # print(s)
        return real_out

    def to_hex(self, to_one_line = False, prefix = False):
        hex_str = None

        # get one line binary code str
        bin_str = self.to_binary(to_one_line=True)
        # split 32-bit inst binary code to 8 parts, each part contains 4-bit since 4-bit code can express one hex code
        temp_str = re.split(r'[;,\s]\s*', textwrap.fill(bin_str,4))
        # convert every 4-bit binary code to one hex code
        temp_str2 = [hex(int(s,base=2))[2:] for s in temp_str]

        if(to_one_line == True):
            hex_str = '0x' + ''.join(temp_str2) if(prefix == True) else ''.join(temp_str2)
        else:
            if(prefix == True):
                hex_str = [('0x' + temp_str2[i] + temp_str2[i+1]) for i in range(len(temp_str2)) if i%2 ==0 ]
            else:
                hex_str = [(temp_str2[i] + temp_str2[i+1]) for i in range(len(temp_str2)) if i%2 ==0 ]
        
        # print(hex_str)
        return hex_str
    