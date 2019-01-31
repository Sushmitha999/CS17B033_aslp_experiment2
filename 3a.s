	.file	1 "3.c"
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
	.frame	$fp,16,$31		# vars= 0, regs= 3/0, args= 0, gp= 0
	.mask	0x40030000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-16     #add immediate unsigned $sp<-$sp-16
	sw	$fp,12($sp)         #store word [$sp+12]<-$fp
	sw	$17,8($sp)          #[$sp+8]<-$17
	sw	$16,4($sp)
	move	$fp,$sp
	li	$16,1			# 0x1
	li	$17,1			# 0x1
	b	$L2             #branch to $L2
	nop                 #no operation

$L5:
	teq	$17,$0,7        #trap exception if equal
	div	$0,$16,$17      #$0<-$16/$17
	mfhi	$2          #move from HI register $2<-[hi]
	addiu	$17,$17,1
$L3:
	slt	$2,$17,101         #set on less than: if $17<101 $2<-1  else $2<-0
	bne	$2,$0,$L5           #branch to $L5 if $2!=$0
	nop

	addiu	$16,$16,1
$L2:
	slt	$2,$16,101
	bne	$2,$0,$L3
	nop

	nop
	move	$sp,$fp
	lw	$fp,12($sp)         #load word $fp<-[$sp+12]
	lw	$17,8($sp)
	lw	$16,4($sp)
	addiu	$sp,$sp,16
	j	$31                 #jump to $31
	nop

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"
