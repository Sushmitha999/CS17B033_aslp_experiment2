	.file	1 "5.c"
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
	.frame	$fp,232,$31		# vars= 168, regs= 10/0, args= 16, gp= 8
	.mask	0xc0ff0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-232     #add immediate unsigned $sp<-$sp-232
	sw	$31,228($sp)         #store word [$sp+228]<-$31
	sw	$fp,224($sp)
	sw	$23,220($sp)
	sw	$22,216($sp)
	sw	$21,212($sp)
	sw	$20,208($sp)
	sw	$19,204($sp)
	sw	$18,200($sp)
	sw	$17,196($sp)
	sw	$16,192($sp)
	move	$fp,$sp                     #$fp<-$sp
	lui	$28,%hi(__gnu_local_gp)         #load upper immediate $28<-%hi(gnu_local_gp)
	addiu	$28,$28,%lo(__gnu_local_gp) #(gnu_local_gp) is the memory location used to store global pointer
	.cprestore	16
	lw	$2,%got(__stack_chk_guard)($28) #load word, $got(__stack_chk_guard)
	lw	$2,0($2)
	sw	$2,188($fp)                     #[$fp+188]<-$2
	move	$2,$sp
	sw	$2,136($fp)
	li	$2,3			# 0x3
	move	$3,$2
	sw	$2,140($fp)
	sw	$2,28($fp)
	addiu	$2,$3,-1
	sw	$2,152($fp)
	move	$2,$3
	move	$7,$2
	move	$6,$0
	srl	$2,$7,27        #Shift Word Right Logical: $2<-$7>>27
	sll	$4,$6,5         #shift word left logical: $4<-$6<<5
	or	$4,$2,$4        #logical OR: $4<-$2 OR $4
	sll	$5,$7,5         #$5<-$7<<5
	move	$2,$3
	sll	$5,$2,2
	sw	$5,24($fp)      #[$fp+24]<-$5
	lw	$5,28($fp)      #$5<-[$fp+28]
	move	$4,$5       #$4<-$5
	addiu	$2,$4,-1    #$2<-$4-1
	sw	$2,156($fp)
	move	$6,$3
	move	$2,$6
	move	$13,$2
	move	$12,$0
	move	$2,$5
	move	$9,$2
	move	$8,$0
	mul	$3,$12,$9       #multiply $3<-$12*$9
	mul	$2,$8,$13       #$2<-$8*$13
	addu	$4,$3,$2    #add unsigned $4<-$3+$2
	multu	$13,$9      #multiply unsigned $13<-$13*$9
	mflo	$3          #Move From LO Register: $3<-$lo
	mfhi	$2          #move from HI to register: $2<-$hi
	addu	$4,$4,$2
	move	$2,$4
	srl	$4,$3,27        #Shift Word Right Logical: $4<-$3>>27
	sll	$10,$2,5        #shift word left logical: $10<-$2<<5
	or	$10,$4,$10      #logical or: $10<-$4 OR $10
	sll	$11,$3,5
	move	$2,$6
	move	$17,$2
	move	$16,$0
	move	$2,$5
	move	$25,$2
	move	$24,$0
	mul	$3,$16,$25      #multiply $3<-$16*$25
	mul	$2,$24,$17
	addu	$4,$3,$2
	multu	$17,$25
	mflo	$3
	mfhi	$2
	addu	$4,$4,$2
	move	$2,$4
	srl	$4,$3,27
	sll	$14,$2,5
	or	$14,$4,$14
	sll	$15,$3,5
	move	$3,$6
	move	$2,$5
	mul	$2,$3,$2
	sll	$2,$2,2
	addiu	$2,$2,3
	addiu	$2,$2,7
	srl	$2,$2,3
	sll	$2,$2,3
	subu	$sp,$sp,$2      #subtract unsigned $sp<-$sp-32
	addiu	$2,$sp,16
	addiu	$2,$2,3
	srl	$2,$2,2
	sll	$2,$2,2
	sw	$2,160($fp)
	lw	$7,140($fp)
	move	$5,$7
	move	$6,$7
	addiu	$2,$5,-1
	sw	$2,164($fp)
	move	$2,$5
	move	$21,$2
	move	$20,$0
	srl	$2,$21,27
	sll	$18,$20,5
	or	$18,$2,$18
	sll	$19,$21,5
	move	$2,$5
	sll	$8,$2,2
	addiu	$2,$6,-1
	sw	$2,168($fp)
	move	$2,$5
	sw	$2,100($fp)
	sw	$0,96($fp)
	move	$2,$6
	sw	$2,92($fp)
	sw	$0,88($fp)
	lw	$11,100($fp)
	lw	$10,96($fp)
	move	$2,$10
	lw	$13,92($fp)
	lw	$12,88($fp)
	move	$3,$13
	mul	$3,$2,$3
	move	$2,$12
	move	$4,$11
	mul	$2,$2,$4
	addu	$4,$3,$2
	move	$2,$11
	move	$3,$13
	multu	$2,$3
	mflo	$3
	mfhi	$2
	addu	$4,$4,$2
	move	$2,$4
	srl	$4,$3,27
	sll	$22,$2,5
	or	$22,$4,$22
	sll	$23,$3,5
	move	$2,$5
	sw	$2,84($fp)
	sw	$0,80($fp)
	move	$2,$6
	sw	$2,76($fp)
	sw	$0,72($fp)
	lw	$11,84($fp)
	lw	$10,80($fp)
	move	$2,$10
	lw	$13,76($fp)
	lw	$12,72($fp)
	move	$3,$13
	mul	$3,$2,$3
	move	$2,$12
	move	$4,$11
	mul	$2,$2,$4
	addu	$4,$3,$2
	move	$2,$11
	move	$3,$13
	multu	$2,$3
	mflo	$3
	mfhi	$2
	addu	$4,$4,$2
	move	$2,$4
	srl	$4,$3,27
	sll	$9,$2,5
	sw	$9,128($fp)
	lw	$9,128($fp)
	or	$4,$4,$9
	sw	$4,128($fp)
	sll	$2,$3,5
	sw	$2,132($fp)
	move	$3,$5
	move	$2,$6
	mul	$2,$3,$2
	sll	$2,$2,2
	addiu	$2,$2,3
	addiu	$2,$2,7
	srl	$2,$2,3
	sll	$2,$2,3
	subu	$sp,$sp,$2
	addiu	$2,$sp,16
	addiu	$2,$2,3
	srl	$2,$2,2
	sll	$2,$2,2
	sw	$2,172($fp)
	move	$4,$7
	move	$5,$7
	addiu	$2,$4,-1
	sw	$2,176($fp)
	move	$2,$4
	sw	$2,68($fp)
	sw	$0,64($fp)
	lw	$7,68($fp)
	lw	$6,64($fp)
	move	$2,$7
	srl	$2,$2,27
	move	$3,$6
	sll	$3,$3,5
	sw	$3,120($fp)
	lw	$3,120($fp)
	or	$2,$2,$3
	sw	$2,120($fp)
	move	$2,$7
	sll	$2,$2,5
	sw	$2,124($fp)
	move	$2,$4
	sll	$6,$2,2
	addiu	$2,$5,-1
	sw	$2,180($fp)
	move	$2,$4
	sw	$2,60($fp)
	sw	$0,56($fp)
	move	$2,$5
	sw	$2,52($fp)
	sw	$0,48($fp)
	lw	$11,60($fp)
	lw	$10,56($fp)
	move	$2,$10
	lw	$13,52($fp)
	lw	$12,48($fp)
	move	$3,$13
	mul	$3,$2,$3
	move	$2,$12
	move	$7,$11
	mul	$2,$2,$7
	addu	$7,$3,$2
	move	$2,$11
	move	$3,$13
	multu	$2,$3
	mflo	$3
	mfhi	$2
	addu	$7,$7,$2
	move	$2,$7
	srl	$7,$3,27
	sll	$9,$2,5
	sw	$9,112($fp)
	lw	$9,112($fp)
	or	$7,$7,$9
	sw	$7,112($fp)
	sll	$2,$3,5
	sw	$2,116($fp)
	move	$2,$4
	sw	$2,44($fp)
	sw	$0,40($fp)
	move	$2,$5
	sw	$2,36($fp)
	sw	$0,32($fp)
	lw	$11,44($fp)
	lw	$10,40($fp)
	move	$2,$10
	lw	$13,36($fp)
	lw	$12,32($fp)
	move	$3,$13
	mul	$3,$2,$3
	move	$2,$12
	move	$7,$11
	mul	$2,$2,$7
	addu	$7,$3,$2
	move	$2,$11
	move	$3,$13
	multu	$2,$3
	mflo	$3
	mfhi	$2
	addu	$7,$7,$2
	move	$2,$7
	srl	$7,$3,27
	sll	$9,$2,5
	sw	$9,104($fp)
	lw	$9,104($fp)
	or	$7,$7,$9
	sw	$7,104($fp)
	sll	$2,$3,5
	sw	$2,108($fp)
	move	$3,$4
	move	$2,$5
	mul	$2,$3,$2
	sll	$2,$2,2
	addiu	$2,$2,3
	addiu	$2,$2,7
	srl	$2,$2,3
	sll	$2,$2,3
	subu	$sp,$sp,$2
	addiu	$2,$sp,16
	addiu	$2,$2,3
	srl	$2,$2,2
	sll	$2,$2,2
	sw	$2,184($fp)
	sw	$0,144($fp)
	b	$L2     #branch to $L2
	nop         #no operation

$L5:
	sw	$0,148($fp)
	b	$L3
	nop

$L4:
	srl	$5,$6,2
	lw	$2,24($fp)
	srl	$4,$2,2
	lw	$3,160($fp)
	lw	$2,144($fp)
	mul	$4,$4,$2
	lw	$2,148($fp)
	addu	$2,$4,$2
	sll	$2,$2,2
	addu	$2,$3,$2
	lw	$3,0($2)
	srl	$7,$8,2
	lw	$4,172($fp)
	lw	$2,144($fp)
	mul	$7,$7,$2
	lw	$2,148($fp)
	addu	$2,$7,$2
	sll	$2,$2,2
	addu	$2,$4,$2
	lw	$2,0($2)
	addu	$3,$3,$2
	lw	$4,184($fp)
	lw	$2,144($fp)
	mul	$5,$5,$2
	lw	$2,148($fp)
	addu	$2,$5,$2
	sll	$2,$2,2
	addu	$2,$4,$2
	sw	$3,0($2)
	lw	$2,148($fp)
	addiu	$2,$2,1
	sw	$2,148($fp)
$L3:
	lw	$2,148($fp)
	lw	$3,140($fp)
	slt	$2,$2,$3        #set on less than: if $2<$3 $2<-1  else $2<-0
	bne	$2,$0,$L4       #branch to $L3 if $2!=$0
	nop

	lw	$2,144($fp)
	addiu	$2,$2,1
	sw	$2,144($fp)
$L2:
	lw	$2,144($fp)
	lw	$3,140($fp)
	slt	$2,$2,$3
	bne	$2,$0,$L5
	nop

	lw	$sp,136($fp)
	move	$2,$0
	lw	$3,%got(__stack_chk_guard)($28)
	lw	$4,188($fp)
	lw	$3,0($3)
	beq	$4,$3,$L7
	nop

	lw	$2,%call16(__stack_chk_fail)($28)
	move	$25,$2
	.reloc	1f,R_MIPS_JALR,__stack_chk_fail
1:	jalr	$25     #jump and link register: load the PC with address in $25
	nop

$L7:
	move	$sp,$fp
	lw	$31,228($sp)
	lw	$fp,224($sp)
	lw	$23,220($sp)
	lw	$22,216($sp)
	lw	$21,212($sp)
	lw	$20,208($sp)
	lw	$19,204($sp)
	lw	$18,200($sp)
	lw	$17,196($sp)
	lw	$16,192($sp)
	addiu	$sp,$sp,232
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609"
