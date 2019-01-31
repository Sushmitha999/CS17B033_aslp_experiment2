    .file	1 "4.c"
	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	fp=xx
	.module	nooddspreg
	.abicalls
	.text
	.align	2
	.globl	prime
	.set	nomips16
	.set	nomicromips
	.ent	prime
	.type	prime, @function
prime:
	.frame	$fp,24,$31		# vars= 8, regs= 1/0, args= 0, gp= 8
	.mask	0x40000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-24     #add immediate unsigned $sp<-$sp-24
	sw	$fp,20($sp)         #store word [$sp+20]<-$fp
	move	$fp,$sp         #$fp<-$sp
	sw	$4,24($fp)
	lw	$3,24($fp)          #load word $3<-[$fp+24]
	li	$2,2			# 0x2
	bne	$3,$2,$L2       #branch to $L2 if $3!=$2
	nop                 #no operation

	li	$2,1			# 0x1
	b	$L3             #branch to $L3
	nop

$L2:
	li	$2,2			# 0x2
	sw	$2,8($fp)       #[$fp+8]<-$2
	b	$L4
	nop

$L6:
	lw	$3,24($fp)
	lw	$2,8($fp)
	nop
	bne	$2,$0,1f
	div	$0,$3,$2        #division $0<-$3/$2
	break	7
1:
	mfhi	$2          #move from HI to register $2<-$hi
	bne	$2,$0,$L5       #branch to $L5 if $2!=$0
	nop

	move	$2,$0       #$2<-$0
	b	$L3
	nop

$L5:
	lw	$2,8($fp)       #load word $2<-[$fp+8]
	nop
	addiu	$2,$2,1
	sw	$2,8($fp)       #store word [$fp+8]<-$2
$L4:
	lw	$2,24($fp)
	nop
	srl	$3,$2,31        #Shift Word Right Logical: $3<-$2>>31
	addu	$2,$3,$2
	sra	$2,$2,1         #Shift word right arithmetic
	move	$3,$2
	lw	$2,8($fp)
	nop
	slt	$2,$3,$2        #set on less than: if $3<$2 $2<-1  else $2<-0
	beq	$2,$0,$L6       #branch to $L6 if $2=$0
	nop

	li	$2,1			# 0x1
$L3:
	move	$sp,$fp
	lw	$fp,20($sp)
	addiu	$sp,$sp,24
	j	$31             #jump to $31
	nop

	.set	macro
	.set	reorder
	.end	prime
	.size	prime, .-prime
	.align	2
	.globl	even
	.set	nomips16
	.set	nomicromips
	.ent	even
	.type	even, @function
even:
	.frame	$fp,8,$31		# vars= 0, regs= 1/0, args= 0, gp= 0
	.mask	0x40000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-8
	sw	$fp,4($sp)
	move	$fp,$sp
	sw	$4,8($fp)
	lw	$2,8($fp)
	movz	$31,$31,$0
	nop
	andi	$2,$2,0x1       #bitwise and immediate: $2<-$2 & 0x1
	bne	$2,$0,$L8           #branch to $L8 if $2!=$0
	nop

	li	$2,1			# 0x1
	b	$L9
	nop

$L8:
	move	$2,$0
$L9:
	move	$sp,$fp
	lw	$fp,4($sp)
	addiu	$sp,$sp,8
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	even
	.size	even, .-even
	.align	2
	.globl	main
	.set	nomips16
	.set	nomicromips
	.ent	main
	.type	main, @function
main:
	.frame	$fp,64,$31		# vars= 32, regs= 2/0, args= 16, gp= 8
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$25
	.set	nomacro
	addiu	$sp,$sp,-64
	sw	$31,60($sp)
	sw	$fp,56($sp)
	move	$fp,$sp
	.cprestore	16
	movz	$31,$31,$0
	lw	$3,40($fp)
	li	$2,2			# 0x2
	bne	$3,$2,$L11
	nop

	sw	$0,24($fp)
$L11:
	lw	$4,40($fp)
	lw	$2,%got(even)($28)
	nop
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,even
1:	jalr	$25         #jump and link register: load the PC with address in $25
	nop

	lw	$28,16($fp)
	beq	$2,$0,$L12
	nop

	li	$2,1			# 0x1
	sw	$2,24($fp)
$L12:
	lw	$4,40($fp)
	lw	$2,%got(prime)($28)
	nop
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,prime
1:	jalr	$25
	nop

	lw	$28,16($fp)
	beq	$2,$0,$L13
	nop

	li	$2,2			# 0x2
	sw	$2,24($fp)
$L13:
	lw	$4,40($fp)
	lw	$2,%got(prime)($28)
	nop
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,prime
1:	jalr	$25
	nop

	lw	$28,16($fp)
	bne	$2,$0,$L14
	nop

	lw	$3,40($fp)
	li	$2,-2147483648			# 0xffffffff80000000
	ori	$2,$2,0x1           #bitwise or immediate: $2<-$2 | 0x1
	and	$2,$3,$2            #bitwise and: $2<-$3 & $2
	bgez	$2,$L15         #branch on greater than or equal to: if $2>=0, branch to $L5
	nop

	addiu	$2,$2,-1
	li	$3,-2			# 0xfffffffffffffffe
	or	$2,$2,$3           #bitwise or $2<-$2 | $3
	addiu	$2,$2,1
$L15:
	move	$3,$2
	li	$2,1			# 0x1
	bne	$3,$2,$L14
	nop

	li	$2,3			# 0x3
	sw	$2,24($fp)
$L14:
	lw	$2,24($fp)
	li	$3,1			# 0x1
	beq	$2,$3,$L17
	nop

	slt	$3,$2,2
	beq	$3,$0,$L18
	nop

	beq	$2,$0,$L19
	nop

	b	$L22
	nop

$L18:
	li	$3,2			# 0x2
	beq	$2,$3,$L20
	nop

	li	$3,3			# 0x3
	beq	$2,$3,$L21
	nop

	b	$L22
	nop

$L19:
	li	$2,3			# 0x3
	sw	$2,44($fp)
$L17:
	lw	$2,40($fp)
	nop
	addiu	$2,$2,1
	sw	$2,44($fp)
	b	$L22
	nop

$L20:
	lw	$2,40($fp)
	nop
	addiu	$2,$2,1
	sw	$2,28($fp)
	b	$L23
	nop

$L24:
	lw	$2,28($fp)
	nop
	addiu	$2,$2,1
	sw	$2,28($fp)
$L23:
	lw	$4,28($fp)
	lw	$2,%got(even)($28)
	nop
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,even
1:	jalr	$25
	nop

	lw	$28,16($fp)
	beq	$2,$0,$L24
	nop

	lw	$2,28($fp)
	nop
	sw	$2,44($fp)
	lw	$2,40($fp)
	nop
	addiu	$2,$2,1
	sw	$2,32($fp)
	b	$L25
	nop

$L26:
	lw	$2,32($fp)
	nop
	addiu	$2,$2,1
	sw	$2,32($fp)
$L25:
	lw	$4,32($fp)
	lw	$2,%got(prime)($28)
	nop
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,prime
1:	jalr	$25
	nop

	lw	$28,16($fp)
	beq	$2,$0,$L26
	nop

	lw	$2,32($fp)
	nop
	sw	$2,48($fp)
	b	$L22
	nop

$L21:
	lw	$2,40($fp)
	nop
	addiu	$2,$2,1
	sw	$2,36($fp)
	b	$L27
	nop

$L28:
	lw	$2,36($fp)
	nop
	addiu	$2,$2,1
	sw	$2,36($fp)
$L27:
	lw	$4,36($fp)
	lw	$2,%got(prime)($28)
	nop
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,prime
1:	jalr	$25
	nop

	lw	$28,16($fp)
	beq	$2,$0,$L28
	nop

	lw	$2,36($fp)
	nop
	sw	$2,44($fp)
	nop
$L22:
	move	$2,$0
	move	$sp,$fp
	lw	$31,60($sp)
	lw	$fp,56($sp)
	addiu	$sp,$sp,64
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"
