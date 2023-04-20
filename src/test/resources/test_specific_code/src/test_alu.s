addi x0, x0, 0
addi x0, x0, 0
addi x1, x2, 10
addi x3, x4, 20 
addi x3, x5, 30 # WAW
addi x0, x0, 0
addi x0, x0, 0
addi x3, x5, 33
addi x3, x6, 40 # WAW
addi x3, x5, 41 # WAW
addi x0, x0, 0 
addi x0, x0, 0
addi x7, x3, 50 
addi x3, x8, 60 # WAR
addi x0, x0, 0 
addi x0, x0, 0
addi x9, x8, 70
addi x8, x10, 80 # WAR
addi x10, x11, 81 # WAR
addi x0, x0, 0 
addi x0, x0, 0
addi x12, x10, 90
addi x13, x12, 91 # RAW
addi x0, x0, 0 
addi x0, x0, 0
addi x12, x10, 92
addi x13, x12, 93 # RAW
addi x14, x13, 94 # RAW
addi x0, x0, 0 
addi x0, x0, 0
addi x0, x0, 0 
addi x0, x0, 0
addi x0, x0, 0 
addi x0, x0, 0
addi x0, x0, 0 
addi x0, x0, 0
