sw x1, 0(x0)
lw x3, 0(x0)
csrw mtvec, x0
csrwi mtvec, 4
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
ecall
addi x0, x0, 0
addi x0, x0, 0
addi x0, x0, 0
addi x0, x0, 0
