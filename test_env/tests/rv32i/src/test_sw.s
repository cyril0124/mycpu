addi sp, sp, 0
addi gp, gp, 0
addi x0, x0, 0
addi x0, x0, 0
addi x0, x0, 0
addi x0, x0, 0
addi x1, x1, 100
addi x2, x2, 100
sw x1, 0(x0)
sw x2, 4(x0)
addi x0, x0, 0
addi x0, x0, 0
addi x0, x0, 0
addi x0, x0, 0
addi x0, x0, 0
addi x0, x0, 0
lw  x4, 4(x0)
lw  x3, 0(x0)
sw  x3, 8(x0)
beq x1, x3, pass
addi x0, x0, 0
addi x0, x0, 0
beq x2, x4, pass
 fail: li a0, 0
 li a7, 93
 ecall

 pass: li a0, 42
 li a7, 93
 ecall