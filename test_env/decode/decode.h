#ifndef DECODE_H
#define DECODE_H

#include "../utils/common.h"

#define OPCODE(inst) GET_BIT_RANGE(inst, 6, 0)
#define FUNCT3(inst) GET_BIT_RANGE(inst, 14, 12)
#define FUNCT7(inst) GET_BIT_RANGE(inst, 31, 25)
#define FUNCT5(inst) GET_BIT_RANGE(inst, 31, 27)
#define FUNCT2(inst) GET_BIT_RANGE(inst, 26, 25)
#define RS1(inst)    GET_BIT_RANGE(inst, 19, 15)
#define RS2(inst)    GET_BIT_RANGE(inst, 24, 20)
#define RD(inst)     GET_BIT_RANGE(inst, 11, 7)
#define IMM_I(inst)  GET_BIT_RANGE(inst, 31, 20)
#define IMM_U(inst)  GET_BIT_RANGE(inst, 31, 12)
#define IMM_S(inst)  GET_BIT_RANGE(inst, 31, 25) << 5 | GET_BIT_RANGE(inst, 11, 7)
#define IMM_SB(inst) GET_BIT_RANGE(inst, 31, 31) << 12 | GET_BIT_RANGE(inst, 7, 7) << 11 | GET_BIT_RANGE(inst, 30, 25) << 5 | GET_BIT_RANGE(inst, 11, 8) << 1

#endif // DECODE_H