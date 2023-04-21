start:
    addi x0, x0, 0
    addi x0, x0, 0
    addi x1, x0, 0x10
    addi x2, x0, 0x10
    addi x3, x0, 0x20
    beq x1, x2, jump_0
    addi x0, x0, 0
    addi x0, x0, 0
jump_0:
    beq x2, x3, start
    jal start
