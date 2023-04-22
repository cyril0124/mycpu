start:
    addi x0, x0, 0
    addi x0, x0, 0
    addi x11, x0, 0x111
    sw x11, 0(x0)
    lw x12, 0(x0)
    addi x1, x0, 0x10
    addi x2, x0, 0x10
    addi x3, x0, 0x20
    addi x6, x0, 0x03
    addi x4, x4, 0x01
    beq x4, x6, jump_0
    beq x1, x2, jump_1
    addi x0, x0, 0
    addi x0, x0, 0
jump_0:
    addi x5, x0, 0x10
    addi x4, x0, 0x0
    jal start
jump_1:
    beq x2, x3, start
    jal start
