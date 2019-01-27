	.file	1 "4.c"
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
	.frame	$fp,24,$31		# vars= 8, regs= 4/0, args= 0, gp= 0
	.mask	0xc0030000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-24
	sw	$31,20($sp)
	sw	$fp,16($sp)
	sw	$17,12($sp)
	sw	$16,8($sp)
	move	$fp,$sp
	li	$2,2			# 0x2
	beq	$17,$2,$L3
	nop

	li	$2,3			# 0x3
	beq	$17,$2,$L4
	nop

	li	$2,1			# 0x1
	b	$L2
	nop

$L3:
	li	$2,2			# 0x2
	sw	$2,4($fp)
	nop
	srl	$2,$16,31
	addu	$2,$2,$16
	sra	$2,$2,1
	move	$3,$2
	lw	$2,4($fp)
	slt	$2,$3,$2
	bne	$2,$0,$L21
	nop

	lw	$2,4($fp)
	teq	$2,$0,7
	div	$0,$16,$2
	mfhi	$2
	nop
	b	$L21
	nop

$L4:
	li	$2,-2147483648			# 0xffffffff80000000
	ori	$2,$2,0x1
	and	$2,$16,$2
	bgez	$2,$L12
	nop

	addiu	$2,$2,-1
	li	$3,-2			# 0xfffffffffffffffe
	or	$2,$2,$3
	addiu	$2,$2,1
$L12:
	move	$3,$2
	li	$2,1			# 0x1
	bne	$3,$2,$L2
	nop

	addiu	$31,$16,1
$L18:
	li	$16,2			# 0x2
	b	$L13
	nop

$L16:
	teq	$16,$0,7
	div	$0,$31,$16
	mfhi	$2
	beq	$2,$0,$L23
	nop

	addiu	$16,$16,1
$L13:
	slt	$2,$16,$31
	bne	$2,$0,$L16
	nop

	b	$L20
	nop

$L23:
	nop
$L20:
	addiu	$31,$31,1
	b	$L18
	nop

$L21:
	nop
$L2:
	move	$2,$0
	move	$sp,$fp
	lw	$31,20($sp)
	lw	$fp,16($sp)
	lw	$17,12($sp)
	lw	$16,8($sp)
	addiu	$sp,$sp,24
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"
