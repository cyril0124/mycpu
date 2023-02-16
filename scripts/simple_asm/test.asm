lbu x1, 0(x0)
lb x2, 0(x0)
lw x3, 2(x0)
sw x3, 0(x0)
lb x5, 4(x0)
lw x10, 0(x0)
addi x20, x8, 100 // another comment
sh x2, 12(x4)
jal x30, 0
beq a2, x3, 120
add x0, x1, x2
auipc x0, 0x34000 // this is a comment