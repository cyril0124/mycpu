	.file	"test-0.c"
	.option nopic
	.attribute arch, "rv32i2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.globl	f
	.section	.sbss,"aw",@nobits
	.align	2
	.type	f, @object
	.size	f, 4
f:
	.zero	4
	.globl	g
	.align	2
	.type	g, @object
	.size	g, 4
g:
	.zero	4
	.globl	y
	.align	2
	.type	y, @object
	.size	y, 4
y:
	.zero	4
	.globl	aaaa
	.section	.srodata,"a"
	.align	2
	.type	aaaa, @object
	.size	aaaa, 4
aaaa:
	.word	10
	.text
	.align	2
	.globl	func
	.type	func, @function
func:
	addi	sp,sp,-32
	sw	ra,28(sp)
	sw	s0,24(sp)
	addi	s0,sp,32
	sw	a0,-20(s0)
	sw	a1,-24(s0)
	lw	a5,-24(s0)
	bge	a5,zero,.L2
	lw	a4,-20(s0)
	lw	a5,-24(s0)
	add	a4,a4,a5
	li	a5,10
	add	a5,a4,a5
	j	.L3
.L2:
	lw	a5,-24(s0)
	addi	a5,a5,-1
	mv	a1,a5
	lw	a0,-20(s0)
	call	func
	mv	a4,a0
	lw	a5,-20(s0)
	add	a5,a4,a5
.L3:
	mv	a0,a5
	lw	ra,28(sp)
	lw	s0,24(sp)
	addi	sp,sp,32
	jr	ra
	.size	func, .-func
	.align	2
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-16
	sw	ra,12(sp)
	sw	s0,8(sp)
	addi	s0,sp,16
	lui	a5,%hi(f)
	li	a4,2
	sw	a4,%lo(f)(a5)
	lui	a5,%hi(g)
	li	a4,3
	sw	a4,%lo(g)(a5)
	lui	a5,%hi(f)
	lw	a4,%lo(f)(a5)
	lui	a5,%hi(g)
	lw	a5,%lo(g)(a5)
	mv	a1,a5
	mv	a0,a4
	call	func
	mv	a4,a0
	lui	a5,%hi(y)
	sw	a4,%lo(y)(a5)
	li	a5,123
	mv	a0,a5
	lw	ra,12(sp)
	lw	s0,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	main, .-main
	.ident	"GCC: (g2ee5e430018) 12.2.0"
