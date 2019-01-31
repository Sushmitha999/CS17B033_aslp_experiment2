	.file	1 "1.c"
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
	.frame	$fp,48,$31		# vars= 32, regs= 3/0, args= 0, gp= 0 fp:frame pointer, preserved across procedure calls
	.mask	0x40030000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-48			#add immediate unsigned $sp<-$sp-48
	sw	$fp,44($sp)			#store word [$sp+44]<-$fp
	sw	$17,40($sp)         #[$sp+40]<-$17
	sw	$16,36($sp)         #[$sp+36]<-$36
	move	$fp,$sp         #$fp<-$sp
	li	$16,4			# 0x4 load integer
	li	$17,3			# 0x3
	addu	$2,$16,$17		#add unsigned $2<-$16+$17
	sw	$2,4($fp)           #[$fp+4]<-$2
	subu	$2,$16,$17		#subtract unsigned $2<-$16-$17
	sw	$2,8($fp)           #[$fp+8]<-$2
	mul	$2,$16,$17          #multiply $2<-$16*$17
	sw	$2,12($fp)          #[$fp+12]<-$2
	teq	$17,$0,7		#trap exception if equal
	div	$0,$16,$17      #divide $0<-$16/$17
	mfhi	$2		#move from high to the destination register
	mflo	$2		#move from low to the destination register
	sw	$2,16($fp)       #[$fp+16]<-$2
	li	$2,3			# 0x3
	bne	$16,$2,$L2		#branches if not equal i.e, if $16=$2, branch to instruction at label L2
	nop				#no operation

	li	$2,4			# 0x4
	bne	$17,$2,$L2
	nop

	li	$2,1			# 0x1
	sw	$2,20($fp)
$L2:
	li	$2,3			# 0x3
	beq	$16,$2,$L3		#branch on equal
	nop

	li	$2,4			# 0x4
	bne	$17,$2,$L4		#branch on not equal
	nop

$L3:
	li	$2,2			# 0x2
	sw	$2,24($fp)
$L4:
	li	$2,3			# 0x3
	beq	$16,$2,$L5
	nop

	li	$2,3			# 0x3
	sw	$2,28($fp)
$L5:
	move	$2,$0       #$2<-$0
	move	$sp,$fp     #$sp<-$fp
	lw	$fp,44($sp)		#load word $fp<-[$sp+44]
	lw	$17,40($sp)     $17<-[$sp+40]
	lw	$16,36($sp)
	addiu	$sp,$sp,48  #$sp<-$sp+48
	j	$31			#jump
	nop				#no operation

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"
