	.file	1 "2.c"
	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	fp=xx
	.module	nooddspreg
	.abicalls
	.text
	.align	2
	.globl	main
	.set	nomips16
	.set	nomicromips
	.ent	main
	.type	main, @function
main:
	.frame	$fp,80,$31		# vars= 40, regs= 4/0, args= 16, gp= 8
	.mask	0xc0030000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-80
	sw	$31,76($sp)
	sw	$fp,72($sp)
	sw	$17,68($sp)
	sw	$16,64($sp)
	move	$fp,$sp
	lui	$28,%hi(__gnu_local_gp)
	addiu	$28,$28,%lo(__gnu_local_gp)
	.cprestore	16
	sw	$4,80($fp)
	sw	$5,28($fp)
	lw	$2,%got(__stack_chk_guard)($28)
	lw	$2,0($2)
	sw	$2,60($fp)
	li	$16,5			# 0x5
	li	$17,3			# 0x3
	li	$2,1			# 0x1
	sw	$2,40($fp)
	li	$2,2			# 0x2
	sw	$2,44($fp)
	li	$2,3			# 0x3
	sw	$2,48($fp)
	li	$2,4			# 0x4
	sw	$2,52($fp)
	li	$2,5			# 0x5
	sw	$2,56($fp)
	sw	$0,36($fp)
	b	$L2
	nop

$L3:
	lw	$2,36($fp)
	sll	$2,$2,2
	addiu	$3,$fp,64
	addu	$2,$3,$2
	lw	$2,-24($2)
	addu	$3,$2,$17
	lw	$2,36($fp)
	sll	$2,$2,2
	addiu	$4,$fp,64
	addu	$2,$4,$2
	sw	$3,-24($2)
	lw	$2,36($fp)
	addiu	$2,$2,1
	sw	$2,36($fp)
$L2:
	lw	$2,36($fp)
	slt	$2,$2,$16
	bne	$2,$0,$L3
	nop

	move	$2,$0
	lw	$3,%got(__stack_chk_guard)($28)
	lw	$4,60($fp)
	lw	$3,0($3)
	beq	$4,$3,$L5
	nop

	lw	$2,%call16(__stack_chk_fail)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,__stack_chk_fail
1:	jalr	$25
	nop

$L5:
	move	$sp,$fp
	lw	$31,76($sp)
	lw	$fp,72($sp)
	lw	$17,68($sp)
	lw	$16,64($sp)
	addiu	$sp,$sp,80
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"