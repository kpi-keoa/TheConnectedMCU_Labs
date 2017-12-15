	.section .mdebug.abi32
	.previous
	.gnu_attribute 4, 3
	.section	.text,code
.Ltext0:
	.globl	G_Position
	.section	.sbss,bss
	.align	2
	.type	G_Position, @object
	.size	G_Position, 4
G_Position:
	.space	4
	.section	.text,code
	.align	2
	.globl	InitApp
.LFB4 = .
	.file 1 "d:/dk/pic32/lab2/project4_solution_basic_concurrency.x/user.c"
	.loc 1 12 0
	.set	nomips16
	.set	nomicromips
	.ent	InitApp
	.type	InitApp, @function
InitApp:
	.frame	$fp,8,$31		# vars= 0, regs= 2/0, args= 0, gp= 0
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
# End mchp_output_function_prologue
	addiu	$sp,$sp,-8
.LCFI0 = .
	sw	$31,4($sp)
	sw	$fp,0($sp)
.LCFI1 = .
	move	$fp,$sp
.LCFI2 = .
	.loc 1 15 0
	lui	$2,%hi(ANSELG)
	lw	$3,%lo(ANSELG)($2)
	li	$2,-65536			# 0xffffffffffff0000
	ori	$2,$2,0x7fbf
	and	$3,$3,$2
	lui	$2,%hi(ANSELG)
	sw	$3,%lo(ANSELG)($2)
	.loc 1 16 0
	lui	$2,%hi(ANSELB)
	lw	$2,%lo(ANSELB)($2)
	li	$4,-2049			# 0xfffffffffffff7ff
	and	$3,$2,$4
	lui	$2,%hi(ANSELB)
	sw	$3,%lo(ANSELB)($2)
	.loc 1 18 0
	lui	$2,%hi(TRISG)
	lw	$3,%lo(TRISG)($2)
	li	$2,-65536			# 0xffffffffffff0000
	ori	$2,$2,0x7fbf
	and	$3,$3,$2
	lui	$2,%hi(TRISG)
	sw	$3,%lo(TRISG)($2)
	.loc 1 19 0
	lui	$2,%hi(TRISB)
	lw	$2,%lo(TRISB)($2)
	li	$4,-2049			# 0xfffffffffffff7ff
	and	$3,$2,$4
	lui	$2,%hi(TRISB)
	sw	$3,%lo(TRISB)($2)
	.loc 1 20 0
	lui	$2,%hi(TRISD)
	lw	$2,%lo(TRISD)($2)
	li	$4,-17			# 0xffffffffffffffef
	and	$3,$2,$4
	lui	$2,%hi(TRISD)
	sw	$3,%lo(TRISD)($2)
	.loc 1 23 0
	lui	$3,%hi(LATG)
	lhu	$2,%lo(LATG)($3)
	ins	$2,$0,6,1
	sh	$2,%lo(LATG)($3)
	.loc 1 24 0
	lui	$3,%hi(LATD)
	lhu	$2,%lo(LATD)($3)
	ins	$2,$0,4,1
	sh	$2,%lo(LATD)($3)
	.loc 1 25 0
	lui	$3,%hi(LATB)
	lhu	$2,%lo(LATB)($3)
	ins	$2,$0,11,1
	sh	$2,%lo(LATB)($3)
	.loc 1 26 0
	lui	$3,%hi(LATG)
	lhu	$2,%lo(LATG)($3)
	ins	$2,$0,15,1
	sh	$2,%lo(LATG)($3)
	.loc 1 30 0
	lui	$2,%hi(ANSELA)
	lw	$2,%lo(ANSELA)($2)
	li	$4,-33			# 0xffffffffffffffdf
	and	$3,$2,$4
	lui	$2,%hi(ANSELA)
	sw	$3,%lo(ANSELA)($2)
	.loc 1 32 0
	lui	$2,%hi(TRISA)
	lw	$2,%lo(TRISA)($2)
	ori	$3,$2,0x30
	lui	$2,%hi(TRISA)
	sw	$3,%lo(TRISA)($2)
	.loc 1 36 0
	lui	$3,%hi(CNENA)
	lhu	$2,%lo(CNENA)($3)
	li	$4,1			# 0x1
	ins	$2,$4,5,1
	sh	$2,%lo(CNENA)($3)
	.loc 1 37 0
	lui	$3,%hi(CNENA)
	lhu	$2,%lo(CNENA)($3)
	li	$4,1			# 0x1
	ins	$2,$4,4,1
	sh	$2,%lo(CNENA)($3)
	.loc 1 41 0
	lui	$3,%hi(IEC3)
	lw	$2,%lo(IEC3)($3)
	li	$4,1			# 0x1
	ins	$2,$4,22,1
	sw	$2,%lo(IEC3)($3)
	.loc 1 43 0
	lui	$3,%hi(IPC29)
	lw	$2,%lo(IPC29)($3)
	li	$4,2			# 0x2
	ins	$2,$4,18,3
	sw	$2,%lo(IPC29)($3)
	.loc 1 45 0
	lui	$3,%hi(IFS3)
	lw	$2,%lo(IFS3)($3)
	ins	$2,$0,22,1
	sw	$2,%lo(IFS3)($3)
	.loc 1 48 0
	lui	$2,%hi(INTCONSET)
	li	$3,4096			# 0x1000
	sw	$3,%lo(INTCONSET)($2)
	.loc 1 51 0
	ei	$2
	.loc 1 54 0
	lui	$3,%hi(CNCONA)
	lhu	$2,%lo(CNCONA)($3)
	li	$4,1			# 0x1
	ins	$2,$4,15,1
	sh	$2,%lo(CNCONA)($3)
	.loc 1 55 0
	move	$sp,$fp
.LCFI3 = .
	lw	$31,4($sp)
	lw	$fp,0($sp)
	addiu	$sp,$sp,8
	j	$31
	nop

	.set	macro
	.set	reorder
# Begin mchp_output_function_epilogue
# End mchp_output_function_epilogue
	.end	InitApp
.LFE4:
	.size	InitApp, .-InitApp
	.align	2
	.globl	Delay
.LFB5 = .
	.loc 1 58 0
	.set	nomips16
	.set	nomicromips
	.ent	Delay
	.type	Delay, @function
Delay:
	.frame	$fp,16,$31		# vars= 8, regs= 1/0, args= 0, gp= 0
	.mask	0x40000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
# End mchp_output_function_prologue
	addiu	$sp,$sp,-16
.LCFI4 = .
	sw	$fp,12($sp)
.LCFI5 = .
	move	$fp,$sp
.LCFI6 = .
	sw	$4,16($fp)
	.loc 1 60 0
	sw	$0,0($fp)
	j	.L3
	nop

.L4:
	lw	$2,0($fp)
	addiu	$2,$2,1
	sw	$2,0($fp)
.L3:
	lw	$3,0($fp)
	lw	$2,16($fp)
	slt	$2,$3,$2
	bne	$2,$0,.L4
	nop

	.loc 1 62 0
	move	$sp,$fp
.LCFI7 = .
	lw	$fp,12($sp)
	addiu	$sp,$sp,16
	j	$31
	nop

	.set	macro
	.set	reorder
# Begin mchp_output_function_epilogue
# End mchp_output_function_epilogue
	.end	Delay
.LFE5:
	.size	Delay, .-Delay
	.align	2
	.globl	Scan_LEDs
.LFB6 = .
	.loc 1 64 0
	.set	nomips16
	.set	nomicromips
	.ent	Scan_LEDs
	.type	Scan_LEDs, @function
Scan_LEDs:
	.frame	$fp,32,$31		# vars= 8, regs= 2/0, args= 16, gp= 0
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
# End mchp_output_function_prologue
	addiu	$sp,$sp,-32
.LCFI8 = .
	sw	$31,28($sp)
	sw	$fp,24($sp)
.LCFI9 = .
	move	$fp,$sp
.LCFI10 = .
	sw	$4,32($fp)
	.loc 1 65 0
	li	$2,1			# 0x1
	sw	$2,16($fp)
	.loc 1 66 0
	li	$2,5			# 0x5
	sw	$2,20($fp)
	.loc 1 68 0
	j	.L6
	nop

.L9:
	.loc 1 69 0
	lw	$3,32($fp)
	li	$2,1			# 0x1
	bne	$3,$2,.L7
	nop

	.loc 1 70 0
	lw	$2,16($fp)
	andi	$2,$2,0x00ff
	andi	$2,$2,0x1
	andi	$4,$2,0x00ff
	lui	$3,%hi(LATG)
	lhu	$2,%lo(LATG)($3)
	ins	$2,$4,6,1
	sh	$2,%lo(LATG)($3)
	.loc 1 71 0
	li	$2,4980736			# 0x4c0000
	ori	$4,$2,0x4b40
	jal	Delay
	nop

	.loc 1 72 0
	lw	$2,16($fp)
	andi	$2,$2,0x00ff
	andi	$2,$2,0x1
	andi	$4,$2,0x00ff
	lui	$3,%hi(LATD)
	lhu	$2,%lo(LATD)($3)
	ins	$2,$4,4,1
	sh	$2,%lo(LATD)($3)
	.loc 1 73 0
	lui	$2,%hi(LATG)
	lw	$2,%lo(LATG)($2)
	.loc 1 74 0
	li	$2,4980736			# 0x4c0000
	ori	$4,$2,0x4b40
	jal	Delay
	nop

	.loc 1 75 0
	lw	$2,16($fp)
	andi	$2,$2,0x00ff
	andi	$2,$2,0x1
	andi	$4,$2,0x00ff
	lui	$3,%hi(LATB)
	lhu	$2,%lo(LATB)($3)
	ins	$2,$4,11,1
	sh	$2,%lo(LATB)($3)
	.loc 1 76 0
	lui	$2,%hi(LATD)
	lw	$2,%lo(LATD)($2)
	.loc 1 77 0
	li	$2,4980736			# 0x4c0000
	ori	$4,$2,0x4b40
	jal	Delay
	nop

	.loc 1 78 0
	lw	$2,16($fp)
	andi	$2,$2,0x00ff
	andi	$2,$2,0x1
	andi	$4,$2,0x00ff
	lui	$3,%hi(LATG)
	lhu	$2,%lo(LATG)($3)
	ins	$2,$4,15,1
	sh	$2,%lo(LATG)($3)
	.loc 1 79 0
	lui	$2,%hi(LATB)
	lw	$2,%lo(LATB)($2)
	.loc 1 80 0
	li	$2,4980736			# 0x4c0000
	ori	$4,$2,0x4b40
	jal	Delay
	nop

	.loc 1 81 0
	lui	$2,%hi(LATG)
	lw	$2,%lo(LATG)($2)
	j	.L8
	nop

.L7:
	.loc 1 83 0
	lw	$2,16($fp)
	andi	$2,$2,0x00ff
	andi	$2,$2,0x1
	andi	$4,$2,0x00ff
	lui	$3,%hi(LATG)
	lhu	$2,%lo(LATG)($3)
	ins	$2,$4,15,1
	sh	$2,%lo(LATG)($3)
	.loc 1 84 0
	li	$2,4980736			# 0x4c0000
	ori	$4,$2,0x4b40
	jal	Delay
	nop

	.loc 1 85 0
	lw	$2,16($fp)
	andi	$2,$2,0x00ff
	andi	$2,$2,0x1
	andi	$4,$2,0x00ff
	lui	$3,%hi(LATB)
	lhu	$2,%lo(LATB)($3)
	ins	$2,$4,11,1
	sh	$2,%lo(LATB)($3)
	.loc 1 86 0
	lui	$2,%hi(LATG)
	lw	$2,%lo(LATG)($2)
	.loc 1 87 0
	li	$2,4980736			# 0x4c0000
	ori	$4,$2,0x4b40
	jal	Delay
	nop

	.loc 1 88 0
	lw	$2,16($fp)
	andi	$2,$2,0x00ff
	andi	$2,$2,0x1
	andi	$4,$2,0x00ff
	lui	$3,%hi(LATD)
	lhu	$2,%lo(LATD)($3)
	ins	$2,$4,4,1
	sh	$2,%lo(LATD)($3)
	.loc 1 89 0
	lui	$2,%hi(LATB)
	lw	$2,%lo(LATB)($2)
	.loc 1 90 0
	li	$2,4980736			# 0x4c0000
	ori	$4,$2,0x4b40
	jal	Delay
	nop

	.loc 1 91 0
	lw	$2,16($fp)
	andi	$2,$2,0x00ff
	andi	$2,$2,0x1
	andi	$4,$2,0x00ff
	lui	$3,%hi(LATG)
	lhu	$2,%lo(LATG)($3)
	ins	$2,$4,6,1
	sh	$2,%lo(LATG)($3)
	.loc 1 92 0
	lui	$2,%hi(LATD)
	lw	$2,%lo(LATD)($2)
	.loc 1 93 0
	li	$2,4980736			# 0x4c0000
	ori	$4,$2,0x4b40
	jal	Delay
	nop

	.loc 1 94 0
	lui	$2,%hi(LATG)
	lw	$2,%lo(LATG)($2)
.L8:
	.loc 1 97 0
	lw	$2,16($fp)
	sltu	$2,$2,1
	andi	$2,$2,0x00ff
	sw	$2,16($fp)
.L6:
	.loc 1 68 0
	lw	$2,20($fp)
	addiu	$3,$2,-1
	sw	$3,20($fp)
	bne	$2,$0,.L9
	nop

	.loc 1 99 0
	move	$sp,$fp
.LCFI11 = .
	lw	$31,28($sp)
	lw	$fp,24($sp)
	addiu	$sp,$sp,32
	j	$31
	nop

	.set	macro
	.set	reorder
# Begin mchp_output_function_epilogue
# End mchp_output_function_epilogue
	.end	Scan_LEDs
.LFE6:
	.size	Scan_LEDs, .-Scan_LEDs
	.align	2
	.globl	Set_LEDs
.LFB7 = .
	.loc 1 102 0
	.set	nomips16
	.set	nomicromips
	.ent	Set_LEDs
	.type	Set_LEDs, @function
Set_LEDs:
	.frame	$fp,8,$31		# vars= 0, regs= 1/0, args= 0, gp= 0
	.mask	0x40000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
# End mchp_output_function_prologue
	addiu	$sp,$sp,-8
.LCFI12 = .
	sw	$fp,4($sp)
.LCFI13 = .
	move	$fp,$sp
.LCFI14 = .
	sw	$4,8($fp)
	sw	$5,12($fp)
	sw	$6,16($fp)
	sw	$7,20($fp)
	.loc 1 103 0
	lw	$2,8($fp)
	andi	$2,$2,0x00ff
	andi	$2,$2,0x1
	andi	$4,$2,0x00ff
	lui	$3,%hi(LATG)
	lhu	$2,%lo(LATG)($3)
	ins	$2,$4,6,1
	sh	$2,%lo(LATG)($3)
	.loc 1 104 0
	lw	$2,12($fp)
	andi	$2,$2,0x00ff
	andi	$2,$2,0x1
	andi	$4,$2,0x00ff
	lui	$3,%hi(LATD)
	lhu	$2,%lo(LATD)($3)
	ins	$2,$4,4,1
	sh	$2,%lo(LATD)($3)
	.loc 1 105 0
	lw	$2,16($fp)
	andi	$2,$2,0x00ff
	andi	$2,$2,0x1
	andi	$4,$2,0x00ff
	lui	$3,%hi(LATB)
	lhu	$2,%lo(LATB)($3)
	ins	$2,$4,11,1
	sh	$2,%lo(LATB)($3)
	.loc 1 106 0
	lw	$2,20($fp)
	andi	$2,$2,0x00ff
	andi	$2,$2,0x1
	andi	$4,$2,0x00ff
	lui	$3,%hi(LATG)
	lhu	$2,%lo(LATG)($3)
	ins	$2,$4,15,1
	sh	$2,%lo(LATG)($3)
	.loc 1 107 0
	move	$sp,$fp
.LCFI15 = .
	lw	$fp,4($sp)
	addiu	$sp,$sp,8
	j	$31
	nop

	.set	macro
	.set	reorder
# Begin mchp_output_function_epilogue
# End mchp_output_function_epilogue
	.end	Set_LEDs
.LFE7:
	.size	Set_LEDs, .-Set_LEDs
	.align	2
	.globl	TASK_Update_LEDs
.LFB8 = .
	.loc 1 110 0
	.set	nomips16
	.set	nomicromips
	.ent	TASK_Update_LEDs
	.type	TASK_Update_LEDs, @function
TASK_Update_LEDs:
	.frame	$fp,24,$31		# vars= 0, regs= 2/0, args= 16, gp= 0
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
# End mchp_output_function_prologue
	addiu	$sp,$sp,-24
.LCFI16 = .
	sw	$31,20($sp)
	sw	$fp,16($sp)
.LCFI17 = .
	move	$fp,$sp
.LCFI18 = .
	.loc 1 111 0
	lw	$2,%gp_rel(G_Position)($28)
	addiu	$2,$2,3
	sltu	$3,$2,7
	beq	$3,$0,.L12
	nop

	sll	$3,$2,2
	lui	$2,%hi(.L14)
	addiu	$2,$2,%lo(.L14)
	addu	$2,$3,$2
	lw	$2,0($2)
	j	$2
	nop

	.align	2
	.align	2
.L14:
	.word	.L13
	.word	.L15
	.word	.L16
	.word	.L17
	.word	.L18
	.word	.L19
	.word	.L20
.L13:
	.loc 1 113 0
	li	$4,1			# 0x1
	move	$5,$0
	move	$6,$0
	move	$7,$0
	jal	Set_LEDs
	nop

	.loc 1 114 0
	j	.L11
	nop

.L15:
	.loc 1 116 0
	li	$4,1			# 0x1
	li	$5,1			# 0x1
	move	$6,$0
	move	$7,$0
	jal	Set_LEDs
	nop

	.loc 1 117 0
	j	.L11
	nop

.L16:
	.loc 1 119 0
	move	$4,$0
	li	$5,1			# 0x1
	move	$6,$0
	move	$7,$0
	jal	Set_LEDs
	nop

	.loc 1 120 0
	j	.L11
	nop

.L17:
	.loc 1 122 0
	move	$4,$0
	li	$5,1			# 0x1
	li	$6,1			# 0x1
	move	$7,$0
	jal	Set_LEDs
	nop

	.loc 1 123 0
	j	.L11
	nop

.L18:
	.loc 1 125 0
	move	$4,$0
	move	$5,$0
	li	$6,1			# 0x1
	move	$7,$0
	jal	Set_LEDs
	nop

	.loc 1 126 0
	j	.L11
	nop

.L19:
	.loc 1 128 0
	move	$4,$0
	move	$5,$0
	li	$6,1			# 0x1
	li	$7,1			# 0x1
	jal	Set_LEDs
	nop

	.loc 1 129 0
	j	.L11
	nop

.L20:
	.loc 1 131 0
	move	$4,$0
	move	$5,$0
	move	$6,$0
	li	$7,1			# 0x1
	jal	Set_LEDs
	nop

	.loc 1 132 0
	j	.L11
	nop

.L12:
	.loc 1 134 0
	lw	$2,%gp_rel(G_Position)($28)
	slt	$2,$2,-3
	beq	$2,$0,.L22
	nop

	.loc 1 135 0
	move	$4,$0
	jal	Scan_LEDs
	nop

	j	.L23
	nop

.L22:
	.loc 1 137 0
	li	$4,1			# 0x1
	jal	Scan_LEDs
	nop

.L23:
	.loc 1 140 0
	sw	$0,%gp_rel(G_Position)($28)
	.loc 1 141 0
	nop
.L11:
	.loc 1 143 0
	move	$sp,$fp
.LCFI19 = .
	lw	$31,20($sp)
	lw	$fp,16($sp)
	addiu	$sp,$sp,24
	j	$31
	nop

	.set	macro
	.set	reorder
# Begin mchp_output_function_epilogue
# End mchp_output_function_epilogue
	.end	TASK_Update_LEDs
.LFE8:
	.size	TASK_Update_LEDs, .-TASK_Update_LEDs
	.align	2
	.globl	ISR_PortA_Change
.LFB9 = .
	.loc 1 145 0
	.set	nomips16
	.set	nomicromips
	.ent	ISR_PortA_Change
	.type	ISR_PortA_Change, @function
ISR_PortA_Change:
	.frame	$fp,32,$31		# vars= 0, regs= 3/0, args= 0, gp= 0
	.mask	0x4000000c,-20
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
# Begin mchp_output_function_prologue: SOFTWARE_CONTEXT_SAVE
	.set	noat
# End mchp_output_function_prologue
	rdpgpr	$sp,$sp
	mfc0	$26,$14
	mfc0	$27,$12
	addiu	$sp,$sp,-32
.LCFI20 = .
	sw	$26,28($sp)
	mfc0	$26,$12,2
	sw	$27,24($sp)
	sw	$26,20($sp)
	ins	$27,$0,1,15
	ori	$27,$27,0x800
	mtc0	$27,$12
	sw	$fp,12($sp)
	sw	$3,8($sp)
	sw	$2,4($sp)
.LCFI21 = .
	move	$fp,$sp
.LCFI22 = .
	.loc 1 146 0
	lui	$2,%hi(CNSTATA)
	lw	$2,%lo(CNSTATA)($2)
	andi	$2,$2,0x10
	beq	$2,$0,.L25
	nop

	.loc 1 148 0
	lui	$2,%hi(PORTA)
	lw	$2,%lo(PORTA)($2)
	andi	$2,$2,0x10
	beq	$2,$0,.L25
	nop

	.loc 1 149 0
	lw	$2,%gp_rel(G_Position)($28)
	addiu	$2,$2,1
	sw	$2,%gp_rel(G_Position)($28)
.L25:
	.loc 1 152 0
	lui	$2,%hi(CNSTATA)
	lw	$2,%lo(CNSTATA)($2)
	andi	$2,$2,0x20
	beq	$2,$0,.L26
	nop

	.loc 1 154 0
	lui	$2,%hi(PORTA)
	lw	$2,%lo(PORTA)($2)
	andi	$2,$2,0x20
	beq	$2,$0,.L26
	nop

	.loc 1 155 0
	lw	$2,%gp_rel(G_Position)($28)
	addiu	$2,$2,-1
	sw	$2,%gp_rel(G_Position)($28)
.L26:
	.loc 1 159 0
	lui	$3,%hi(IFS3)
	lw	$2,%lo(IFS3)($3)
	ins	$2,$0,22,1
	sw	$2,%lo(IFS3)($3)
	.loc 1 160 0
	move	$sp,$fp
.LCFI23 = .
	lw	$fp,12($sp)
	lw	$3,8($sp)
	lw	$2,4($sp)
	di
	ehb
	lw	$26,28($sp)
	lw	$27,24($sp)
	mtc0	$26,$14
	lw	$26,20($sp)
	addiu	$sp,$sp,32
	mtc0	$26,$12,2
	wrpgpr	$sp,$sp
	mtc0	$27,$12
	eret
	.set	macro
	.set	reorder
# Begin mchp_output_function_epilogue
	.set	at
# End mchp_output_function_epilogue
	.end	ISR_PortA_Change
.LFE9:
	.size	ISR_PortA_Change, .-ISR_PortA_Change
	.align	2
	.globl	Run_Game_Tasks
.LFB10 = .
	.loc 1 162 0
	.set	nomips16
	.set	nomicromips
	.ent	Run_Game_Tasks
	.type	Run_Game_Tasks, @function
Run_Game_Tasks:
	.frame	$fp,24,$31		# vars= 0, regs= 2/0, args= 16, gp= 0
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
# End mchp_output_function_prologue
	addiu	$sp,$sp,-24
.LCFI24 = .
	sw	$31,20($sp)
	sw	$fp,16($sp)
.LCFI25 = .
	move	$fp,$sp
.LCFI26 = .
.L28:
	.loc 1 165 0
	jal	TASK_Update_LEDs
	nop

	.loc 1 166 0
	j	.L28
	nop

	.set	macro
	.set	reorder
# Begin mchp_output_function_epilogue
# End mchp_output_function_epilogue
	.end	Run_Game_Tasks
.LFE10:
	.size	Run_Game_Tasks, .-Run_Game_Tasks
	.section	.debug_frame,info
.Lframe0:
	.4byte	.LECIE0-.LSCIE0
.LSCIE0:
	.4byte	0xffffffff
	.byte	0x1
	.ascii	"\000"
	.uleb128 0x1
	.sleb128 -4
	.byte	0x1f
	.byte	0xc
	.uleb128 0x1d
	.uleb128 0
	.align	2
.LECIE0:
.LSFDE0:
	.4byte	.LEFDE0-.LASFDE0
.LASFDE0:
	.4byte	.Lframe0
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.byte	0x4
	.4byte	.LCFI0-.LFB4
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.4byte	.LCFI1-.LCFI0
	.byte	0x9f
	.uleb128 0x1
	.byte	0x9e
	.uleb128 0x2
	.byte	0x4
	.4byte	.LCFI2-.LCFI1
	.byte	0xd
	.uleb128 0x1e
	.byte	0x4
	.4byte	.LCFI3-.LCFI2
	.byte	0xd
	.uleb128 0x1d
	.align	2
.LEFDE0:
.LSFDE2:
	.4byte	.LEFDE2-.LASFDE2
.LASFDE2:
	.4byte	.Lframe0
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.byte	0x4
	.4byte	.LCFI4-.LFB5
	.byte	0xe
	.uleb128 0x10
	.byte	0x4
	.4byte	.LCFI5-.LCFI4
	.byte	0x9e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI6-.LCFI5
	.byte	0xd
	.uleb128 0x1e
	.byte	0x4
	.4byte	.LCFI7-.LCFI6
	.byte	0xd
	.uleb128 0x1d
	.align	2
.LEFDE2:
.LSFDE4:
	.4byte	.LEFDE4-.LASFDE4
.LASFDE4:
	.4byte	.Lframe0
	.4byte	.LFB6
	.4byte	.LFE6-.LFB6
	.byte	0x4
	.4byte	.LCFI8-.LFB6
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.4byte	.LCFI9-.LCFI8
	.byte	0x9f
	.uleb128 0x1
	.byte	0x9e
	.uleb128 0x2
	.byte	0x4
	.4byte	.LCFI10-.LCFI9
	.byte	0xd
	.uleb128 0x1e
	.byte	0x4
	.4byte	.LCFI11-.LCFI10
	.byte	0xd
	.uleb128 0x1d
	.align	2
.LEFDE4:
.LSFDE6:
	.4byte	.LEFDE6-.LASFDE6
.LASFDE6:
	.4byte	.Lframe0
	.4byte	.LFB7
	.4byte	.LFE7-.LFB7
	.byte	0x4
	.4byte	.LCFI12-.LFB7
	.byte	0xe
	.uleb128 0x8
	.byte	0x4
	.4byte	.LCFI13-.LCFI12
	.byte	0x9e
	.uleb128 0x1
	.byte	0x4
	.4byte	.LCFI14-.LCFI13
	.byte	0xd
	.uleb128 0x1e
	.byte	0x4
	.4byte	.LCFI15-.LCFI14
	.byte	0xd
	.uleb128 0x1d
	.align	2
.LEFDE6:
.LSFDE8:
	.4byte	.LEFDE8-.LASFDE8
.LASFDE8:
	.4byte	.Lframe0
	.4byte	.LFB8
	.4byte	.LFE8-.LFB8
	.byte	0x4
	.4byte	.LCFI16-.LFB8
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI17-.LCFI16
	.byte	0x9f
	.uleb128 0x1
	.byte	0x9e
	.uleb128 0x2
	.byte	0x4
	.4byte	.LCFI18-.LCFI17
	.byte	0xd
	.uleb128 0x1e
	.byte	0x4
	.4byte	.LCFI19-.LCFI18
	.byte	0xd
	.uleb128 0x1d
	.align	2
.LEFDE8:
.LSFDE10:
	.4byte	.LEFDE10-.LASFDE10
.LASFDE10:
	.4byte	.Lframe0
	.4byte	.LFB9
	.4byte	.LFE9-.LFB9
	.byte	0x4
	.4byte	.LCFI20-.LFB9
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.4byte	.LCFI21-.LCFI20
	.byte	0x9a
	.uleb128 0x3
	.byte	0x9e
	.uleb128 0x5
	.byte	0x83
	.uleb128 0x6
	.byte	0x82
	.uleb128 0x7
	.byte	0x4
	.4byte	.LCFI22-.LCFI21
	.byte	0xd
	.uleb128 0x1e
	.byte	0x4
	.4byte	.LCFI23-.LCFI22
	.byte	0xd
	.uleb128 0x1d
	.align	2
.LEFDE10:
.LSFDE12:
	.4byte	.LEFDE12-.LASFDE12
.LASFDE12:
	.4byte	.Lframe0
	.4byte	.LFB10
	.4byte	.LFE10-.LFB10
	.byte	0x4
	.4byte	.LCFI24-.LFB10
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI25-.LCFI24
	.byte	0x9f
	.uleb128 0x1
	.byte	0x9e
	.uleb128 0x2
	.byte	0x4
	.4byte	.LCFI26-.LCFI25
	.byte	0xd
	.uleb128 0x1e
	.align	2
.LEFDE12:
	.section	.text,code
.Letext0:
	.file 2 "c:/program files (x86)/microchip/xc32/v1.44/pic32mx/include/proc/p32mz2048ecg100.h"
	.section	.debug_info,info
.Ldebug_info0:
	.4byte	0x11a9
	.2byte	0x2
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.ascii	"GNU C 4.8.3 MPLAB XC32 Compiler v1.44\000"
	.byte	0x1
	.ascii	"user.c\000"
	.ascii	"D:/DK/PIC32/Lab2/Project4_Solution_Basic_Concurrency.X\000"
	.4byte	.Ltext0
	.4byte	.Letext0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.ascii	"unsigned int\000"
	.uleb128 0x3
	.byte	0x4
	.byte	0x2
	.2byte	0x6d1
	.4byte	0x251
	.uleb128 0x4
	.ascii	"AD1D43IF\000"
	.byte	0x2
	.2byte	0x6d3
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0x19
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"AD1D44IF\000"
	.byte	0x2
	.2byte	0x6d4
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0x18
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"CPCIF\000"
	.byte	0x2
	.2byte	0x6d5
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0x17
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"CFDCIF\000"
	.byte	0x2
	.2byte	0x6d6
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0x16
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"SBIF\000"
	.byte	0x2
	.2byte	0x6d7
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0x15
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"SPI1EIF\000"
	.byte	0x2
	.2byte	0x6d9
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0x12
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"SPI1RXIF\000"
	.byte	0x2
	.2byte	0x6da
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0x11
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"SPI1TXIF\000"
	.byte	0x2
	.2byte	0x6db
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0x10
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"U1EIF\000"
	.byte	0x2
	.2byte	0x6dc
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0xf
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"U1RXIF\000"
	.byte	0x2
	.2byte	0x6dd
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0xe
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"U1TXIF\000"
	.byte	0x2
	.2byte	0x6de
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0xd
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"I2C1BIF\000"
	.byte	0x2
	.2byte	0x6df
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0xc
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"I2C1SIF\000"
	.byte	0x2
	.2byte	0x6e0
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0xb
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"I2C1MIF\000"
	.byte	0x2
	.2byte	0x6e1
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0xa
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"CNAIF\000"
	.byte	0x2
	.2byte	0x6e2
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0x9
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"CNBIF\000"
	.byte	0x2
	.2byte	0x6e3
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0x8
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"CNCIF\000"
	.byte	0x2
	.2byte	0x6e4
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0x7
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"CNDIF\000"
	.byte	0x2
	.2byte	0x6e5
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0x6
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"CNEIF\000"
	.byte	0x2
	.2byte	0x6e6
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0x5
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"CNFIF\000"
	.byte	0x2
	.2byte	0x6e7
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0x4
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"CNGIF\000"
	.byte	0x2
	.2byte	0x6e8
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0x3
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.byte	0
	.uleb128 0x3
	.byte	0x4
	.byte	0x2
	.2byte	0x6ea
	.4byte	0x26b
	.uleb128 0x4
	.ascii	"w\000"
	.byte	0x2
	.2byte	0x6eb
	.4byte	0x7d
	.byte	0x4
	.byte	0x20
	.byte	0
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.byte	0x2
	.2byte	0x6d0
	.4byte	0x27f
	.uleb128 0x6
	.4byte	0x8d
	.uleb128 0x6
	.4byte	0x251
	.byte	0
	.uleb128 0x7
	.ascii	"__IFS3bits_t\000"
	.byte	0x2
	.2byte	0x6ed
	.4byte	0x26b
	.uleb128 0x3
	.byte	0x4
	.byte	0x2
	.2byte	0x7d2
	.4byte	0x458
	.uleb128 0x4
	.ascii	"AD1D43IE\000"
	.byte	0x2
	.2byte	0x7d4
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0x19
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"AD1D44IE\000"
	.byte	0x2
	.2byte	0x7d5
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0x18
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"CPCIE\000"
	.byte	0x2
	.2byte	0x7d6
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0x17
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"CFDCIE\000"
	.byte	0x2
	.2byte	0x7d7
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0x16
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"SBIE\000"
	.byte	0x2
	.2byte	0x7d8
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0x15
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"SPI1EIE\000"
	.byte	0x2
	.2byte	0x7da
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0x12
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"SPI1RXIE\000"
	.byte	0x2
	.2byte	0x7db
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0x11
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"SPI1TXIE\000"
	.byte	0x2
	.2byte	0x7dc
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0x10
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"U1EIE\000"
	.byte	0x2
	.2byte	0x7dd
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0xf
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"U1RXIE\000"
	.byte	0x2
	.2byte	0x7de
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0xe
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"U1TXIE\000"
	.byte	0x2
	.2byte	0x7df
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0xd
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"I2C1BIE\000"
	.byte	0x2
	.2byte	0x7e0
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0xc
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"I2C1SIE\000"
	.byte	0x2
	.2byte	0x7e1
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0xb
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"I2C1MIE\000"
	.byte	0x2
	.2byte	0x7e2
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0xa
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"CNAIE\000"
	.byte	0x2
	.2byte	0x7e3
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0x9
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"CNBIE\000"
	.byte	0x2
	.2byte	0x7e4
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0x8
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"CNCIE\000"
	.byte	0x2
	.2byte	0x7e5
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0x7
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"CNDIE\000"
	.byte	0x2
	.2byte	0x7e6
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0x6
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"CNEIE\000"
	.byte	0x2
	.2byte	0x7e7
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0x5
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"CNFIE\000"
	.byte	0x2
	.2byte	0x7e8
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0x4
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"CNGIE\000"
	.byte	0x2
	.2byte	0x7e9
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0x3
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.byte	0
	.uleb128 0x3
	.byte	0x4
	.byte	0x2
	.2byte	0x7eb
	.4byte	0x472
	.uleb128 0x4
	.ascii	"w\000"
	.byte	0x2
	.2byte	0x7ec
	.4byte	0x7d
	.byte	0x4
	.byte	0x20
	.byte	0
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.byte	0x2
	.2byte	0x7d1
	.4byte	0x486
	.uleb128 0x6
	.4byte	0x294
	.uleb128 0x6
	.4byte	0x458
	.byte	0
	.uleb128 0x7
	.ascii	"__IEC3bits_t\000"
	.byte	0x2
	.2byte	0x7ee
	.4byte	0x472
	.uleb128 0x3
	.byte	0x4
	.byte	0x2
	.2byte	0xadd
	.4byte	0x54d
	.uleb128 0x4
	.ascii	"I2C1SIS\000"
	.byte	0x2
	.2byte	0xade
	.4byte	0x7d
	.byte	0x4
	.byte	0x2
	.byte	0x1e
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"I2C1SIP\000"
	.byte	0x2
	.2byte	0xadf
	.4byte	0x7d
	.byte	0x4
	.byte	0x3
	.byte	0x1b
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"I2C1MIS\000"
	.byte	0x2
	.2byte	0xae1
	.4byte	0x7d
	.byte	0x4
	.byte	0x2
	.byte	0x16
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"I2C1MIP\000"
	.byte	0x2
	.2byte	0xae2
	.4byte	0x7d
	.byte	0x4
	.byte	0x3
	.byte	0x13
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"CNAIS\000"
	.byte	0x2
	.2byte	0xae4
	.4byte	0x7d
	.byte	0x4
	.byte	0x2
	.byte	0xe
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"CNAIP\000"
	.byte	0x2
	.2byte	0xae5
	.4byte	0x7d
	.byte	0x4
	.byte	0x3
	.byte	0xb
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"CNBIS\000"
	.byte	0x2
	.2byte	0xae7
	.4byte	0x7d
	.byte	0x4
	.byte	0x2
	.byte	0x6
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"CNBIP\000"
	.byte	0x2
	.2byte	0xae8
	.4byte	0x7d
	.byte	0x4
	.byte	0x3
	.byte	0x3
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.byte	0
	.uleb128 0x3
	.byte	0x4
	.byte	0x2
	.2byte	0xaea
	.4byte	0x567
	.uleb128 0x4
	.ascii	"w\000"
	.byte	0x2
	.2byte	0xaeb
	.4byte	0x7d
	.byte	0x4
	.byte	0x20
	.byte	0
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.byte	0x2
	.2byte	0xadc
	.4byte	0x57b
	.uleb128 0x6
	.4byte	0x49b
	.uleb128 0x6
	.4byte	0x54d
	.byte	0
	.uleb128 0x7
	.ascii	"__IPC29bits_t\000"
	.byte	0x2
	.2byte	0xaed
	.4byte	0x567
	.uleb128 0x3
	.byte	0x4
	.byte	0x2
	.2byte	0x2893
	.4byte	0x676
	.uleb128 0x4
	.ascii	"RA0\000"
	.byte	0x2
	.2byte	0x2894
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0x1f
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"RA1\000"
	.byte	0x2
	.2byte	0x2895
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0x1e
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"RA2\000"
	.byte	0x2
	.2byte	0x2896
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0x1d
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"RA3\000"
	.byte	0x2
	.2byte	0x2897
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0x1c
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"RA4\000"
	.byte	0x2
	.2byte	0x2898
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0x1b
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"RA5\000"
	.byte	0x2
	.2byte	0x2899
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0x1a
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"RA6\000"
	.byte	0x2
	.2byte	0x289a
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0x19
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"RA7\000"
	.byte	0x2
	.2byte	0x289b
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0x18
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"RA9\000"
	.byte	0x2
	.2byte	0x289d
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0x16
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"RA10\000"
	.byte	0x2
	.2byte	0x289e
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0x15
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"RA14\000"
	.byte	0x2
	.2byte	0x28a0
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0x11
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"RA15\000"
	.byte	0x2
	.2byte	0x28a1
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0x10
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.byte	0
	.uleb128 0x3
	.byte	0x4
	.byte	0x2
	.2byte	0x28a3
	.4byte	0x690
	.uleb128 0x4
	.ascii	"w\000"
	.byte	0x2
	.2byte	0x28a4
	.4byte	0x7d
	.byte	0x4
	.byte	0x20
	.byte	0
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.byte	0x2
	.2byte	0x2892
	.4byte	0x6a4
	.uleb128 0x6
	.4byte	0x591
	.uleb128 0x6
	.4byte	0x676
	.byte	0
	.uleb128 0x7
	.ascii	"__PORTAbits_t\000"
	.byte	0x2
	.2byte	0x28a6
	.4byte	0x690
	.uleb128 0x3
	.byte	0x4
	.byte	0x2
	.2byte	0x291a
	.4byte	0x6e8
	.uleb128 0x4
	.ascii	"SIDL\000"
	.byte	0x2
	.2byte	0x291c
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0x12
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"ON\000"
	.byte	0x2
	.2byte	0x291e
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0x10
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.byte	0
	.uleb128 0x3
	.byte	0x4
	.byte	0x2
	.2byte	0x2920
	.4byte	0x702
	.uleb128 0x4
	.ascii	"w\000"
	.byte	0x2
	.2byte	0x2921
	.4byte	0x7d
	.byte	0x4
	.byte	0x20
	.byte	0
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.byte	0x2
	.2byte	0x2919
	.4byte	0x716
	.uleb128 0x6
	.4byte	0x6ba
	.uleb128 0x6
	.4byte	0x6e8
	.byte	0
	.uleb128 0x7
	.ascii	"__CNCONAbits_t\000"
	.byte	0x2
	.2byte	0x2923
	.4byte	0x702
	.uleb128 0x3
	.byte	0x4
	.byte	0x2
	.2byte	0x292b
	.4byte	0x836
	.uleb128 0x4
	.ascii	"CNIEA0\000"
	.byte	0x2
	.2byte	0x292c
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0x1f
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"CNIEA1\000"
	.byte	0x2
	.2byte	0x292d
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0x1e
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"CNIEA2\000"
	.byte	0x2
	.2byte	0x292e
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0x1d
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"CNIEA3\000"
	.byte	0x2
	.2byte	0x292f
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0x1c
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"CNIEA4\000"
	.byte	0x2
	.2byte	0x2930
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0x1b
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"CNIEA5\000"
	.byte	0x2
	.2byte	0x2931
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0x1a
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"CNIEA6\000"
	.byte	0x2
	.2byte	0x2932
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0x19
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"CNIEA7\000"
	.byte	0x2
	.2byte	0x2933
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0x18
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"CNIEA9\000"
	.byte	0x2
	.2byte	0x2935
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0x16
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"CNIEA10\000"
	.byte	0x2
	.2byte	0x2936
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0x15
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"CNIEA14\000"
	.byte	0x2
	.2byte	0x2938
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0x11
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"CNIEA15\000"
	.byte	0x2
	.2byte	0x2939
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0x10
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.byte	0
	.uleb128 0x3
	.byte	0x4
	.byte	0x2
	.2byte	0x293b
	.4byte	0x850
	.uleb128 0x4
	.ascii	"w\000"
	.byte	0x2
	.2byte	0x293c
	.4byte	0x7d
	.byte	0x4
	.byte	0x20
	.byte	0
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.byte	0x2
	.2byte	0x292a
	.4byte	0x864
	.uleb128 0x6
	.4byte	0x72d
	.uleb128 0x6
	.4byte	0x836
	.byte	0
	.uleb128 0x7
	.ascii	"__CNENAbits_t\000"
	.byte	0x2
	.2byte	0x293e
	.4byte	0x850
	.uleb128 0x3
	.byte	0x4
	.byte	0x2
	.2byte	0x2946
	.4byte	0x99b
	.uleb128 0x4
	.ascii	"CNSTATA0\000"
	.byte	0x2
	.2byte	0x2947
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0x1f
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"CNSTATA1\000"
	.byte	0x2
	.2byte	0x2948
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0x1e
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"CNSTATA2\000"
	.byte	0x2
	.2byte	0x2949
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0x1d
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"CNSTATA3\000"
	.byte	0x2
	.2byte	0x294a
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0x1c
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"CNSTATA4\000"
	.byte	0x2
	.2byte	0x294b
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0x1b
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"CNSTATA5\000"
	.byte	0x2
	.2byte	0x294c
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0x1a
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"CNSTATA6\000"
	.byte	0x2
	.2byte	0x294d
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0x19
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"CNSTATA7\000"
	.byte	0x2
	.2byte	0x294e
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0x18
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"CNSTATA9\000"
	.byte	0x2
	.2byte	0x2950
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0x16
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"CNSTATA10\000"
	.byte	0x2
	.2byte	0x2951
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0x15
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"CNSTATA14\000"
	.byte	0x2
	.2byte	0x2953
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0x11
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"CNSTATA15\000"
	.byte	0x2
	.2byte	0x2954
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0x10
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.byte	0
	.uleb128 0x3
	.byte	0x4
	.byte	0x2
	.2byte	0x2956
	.4byte	0x9b5
	.uleb128 0x4
	.ascii	"w\000"
	.byte	0x2
	.2byte	0x2957
	.4byte	0x7d
	.byte	0x4
	.byte	0x20
	.byte	0
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.byte	0x2
	.2byte	0x2945
	.4byte	0x9c9
	.uleb128 0x6
	.4byte	0x87a
	.uleb128 0x6
	.4byte	0x99b
	.byte	0
	.uleb128 0x7
	.ascii	"__CNSTATAbits_t\000"
	.byte	0x2
	.2byte	0x2959
	.4byte	0x9b5
	.uleb128 0x3
	.byte	0x4
	.byte	0x2
	.2byte	0x29b8
	.4byte	0xb31
	.uleb128 0x4
	.ascii	"LATB0\000"
	.byte	0x2
	.2byte	0x29b9
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0x1f
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"LATB1\000"
	.byte	0x2
	.2byte	0x29ba
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0x1e
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"LATB2\000"
	.byte	0x2
	.2byte	0x29bb
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0x1d
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"LATB3\000"
	.byte	0x2
	.2byte	0x29bc
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0x1c
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"LATB4\000"
	.byte	0x2
	.2byte	0x29bd
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0x1b
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"LATB5\000"
	.byte	0x2
	.2byte	0x29be
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0x1a
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"LATB6\000"
	.byte	0x2
	.2byte	0x29bf
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0x19
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"LATB7\000"
	.byte	0x2
	.2byte	0x29c0
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0x18
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"LATB8\000"
	.byte	0x2
	.2byte	0x29c1
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0x17
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"LATB9\000"
	.byte	0x2
	.2byte	0x29c2
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0x16
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"LATB10\000"
	.byte	0x2
	.2byte	0x29c3
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0x15
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"LATB11\000"
	.byte	0x2
	.2byte	0x29c4
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0x14
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"LATB12\000"
	.byte	0x2
	.2byte	0x29c5
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0x13
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"LATB13\000"
	.byte	0x2
	.2byte	0x29c6
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0x12
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"LATB14\000"
	.byte	0x2
	.2byte	0x29c7
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0x11
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"LATB15\000"
	.byte	0x2
	.2byte	0x29c8
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0x10
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.byte	0
	.uleb128 0x3
	.byte	0x4
	.byte	0x2
	.2byte	0x29ca
	.4byte	0xb4b
	.uleb128 0x4
	.ascii	"w\000"
	.byte	0x2
	.2byte	0x29cb
	.4byte	0x7d
	.byte	0x4
	.byte	0x20
	.byte	0
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.byte	0x2
	.2byte	0x29b7
	.4byte	0xb5f
	.uleb128 0x6
	.4byte	0x9e1
	.uleb128 0x6
	.4byte	0xb31
	.byte	0
	.uleb128 0x7
	.ascii	"__LATBbits_t\000"
	.byte	0x2
	.2byte	0x29cd
	.4byte	0xb4b
	.uleb128 0x3
	.byte	0x4
	.byte	0x2
	.2byte	0x2b98
	.4byte	0xc88
	.uleb128 0x4
	.ascii	"LATD0\000"
	.byte	0x2
	.2byte	0x2b99
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0x1f
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"LATD1\000"
	.byte	0x2
	.2byte	0x2b9a
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0x1e
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"LATD2\000"
	.byte	0x2
	.2byte	0x2b9b
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0x1d
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"LATD3\000"
	.byte	0x2
	.2byte	0x2b9c
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0x1c
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"LATD4\000"
	.byte	0x2
	.2byte	0x2b9d
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0x1b
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"LATD5\000"
	.byte	0x2
	.2byte	0x2b9e
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0x1a
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"LATD9\000"
	.byte	0x2
	.2byte	0x2ba0
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0x16
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"LATD10\000"
	.byte	0x2
	.2byte	0x2ba1
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0x15
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"LATD11\000"
	.byte	0x2
	.2byte	0x2ba2
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0x14
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"LATD12\000"
	.byte	0x2
	.2byte	0x2ba3
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0x13
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"LATD13\000"
	.byte	0x2
	.2byte	0x2ba4
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0x12
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"LATD14\000"
	.byte	0x2
	.2byte	0x2ba5
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0x11
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"LATD15\000"
	.byte	0x2
	.2byte	0x2ba6
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0x10
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.byte	0
	.uleb128 0x3
	.byte	0x4
	.byte	0x2
	.2byte	0x2ba8
	.4byte	0xca2
	.uleb128 0x4
	.ascii	"w\000"
	.byte	0x2
	.2byte	0x2ba9
	.4byte	0x7d
	.byte	0x4
	.byte	0x20
	.byte	0
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.byte	0x2
	.2byte	0x2b97
	.4byte	0xcb6
	.uleb128 0x6
	.4byte	0xb74
	.uleb128 0x6
	.4byte	0xc88
	.byte	0
	.uleb128 0x7
	.ascii	"__LATDbits_t\000"
	.byte	0x2
	.2byte	0x2bab
	.4byte	0xca2
	.uleb128 0x3
	.byte	0x4
	.byte	0x2
	.2byte	0x2e4f
	.4byte	0xda1
	.uleb128 0x4
	.ascii	"LATG0\000"
	.byte	0x2
	.2byte	0x2e50
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0x1f
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"LATG1\000"
	.byte	0x2
	.2byte	0x2e51
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0x1e
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"LATG6\000"
	.byte	0x2
	.2byte	0x2e53
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0x19
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"LATG7\000"
	.byte	0x2
	.2byte	0x2e54
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0x18
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"LATG8\000"
	.byte	0x2
	.2byte	0x2e55
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0x17
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"LATG9\000"
	.byte	0x2
	.2byte	0x2e56
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0x16
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"LATG12\000"
	.byte	0x2
	.2byte	0x2e58
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0x13
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"LATG13\000"
	.byte	0x2
	.2byte	0x2e59
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0x12
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"LATG14\000"
	.byte	0x2
	.2byte	0x2e5a
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0x11
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"LATG15\000"
	.byte	0x2
	.2byte	0x2e5b
	.4byte	0x7d
	.byte	0x4
	.byte	0x1
	.byte	0x10
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.byte	0
	.uleb128 0x3
	.byte	0x4
	.byte	0x2
	.2byte	0x2e5d
	.4byte	0xdbb
	.uleb128 0x4
	.ascii	"w\000"
	.byte	0x2
	.2byte	0x2e5e
	.4byte	0x7d
	.byte	0x4
	.byte	0x20
	.byte	0
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.byte	0
	.uleb128 0x5
	.byte	0x4
	.byte	0x2
	.2byte	0x2e4e
	.4byte	0xdcf
	.uleb128 0x6
	.4byte	0xccb
	.uleb128 0x6
	.4byte	0xda1
	.byte	0
	.uleb128 0x7
	.ascii	"__LATGbits_t\000"
	.byte	0x2
	.2byte	0x2e60
	.4byte	0xdbb
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.ascii	"long unsigned int\000"
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.ascii	"long int\000"
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.ascii	"signed char\000"
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.ascii	"unsigned char\000"
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.ascii	"short int\000"
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.ascii	"short unsigned int\000"
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.ascii	"long long int\000"
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.ascii	"long long unsigned int\000"
	.uleb128 0x8
	.byte	0x1
	.ascii	"InitApp\000"
	.byte	0x1
	.byte	0xc
	.byte	0x1
	.4byte	.LFB4
	.4byte	.LFE4
	.byte	0x1
	.byte	0x6e
	.byte	0x1
	.uleb128 0x9
	.byte	0x1
	.ascii	"Delay\000"
	.byte	0x1
	.byte	0x3a
	.byte	0x1
	.4byte	.LFB5
	.4byte	.LFE5
	.byte	0x1
	.byte	0x6e
	.byte	0x1
	.4byte	0xec5
	.uleb128 0xa
	.ascii	"n\000"
	.byte	0x1
	.byte	0x3a
	.4byte	0xe05
	.byte	0x2
	.byte	0x91
	.sleb128 16
	.uleb128 0xb
	.ascii	"i\000"
	.byte	0x1
	.byte	0x3b
	.4byte	0xec5
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.byte	0
	.uleb128 0xc
	.4byte	0xe05
	.uleb128 0xd
	.byte	0x1
	.ascii	"Scan_LEDs\000"
	.byte	0x1
	.byte	0x40
	.byte	0x1
	.4byte	.LFB6
	.4byte	.LFE6
	.byte	0x1
	.byte	0x6e
	.byte	0x1
	.4byte	0xf22
	.uleb128 0xa
	.ascii	"dir_lr\000"
	.byte	0x1
	.byte	0x40
	.4byte	0xe05
	.byte	0x2
	.byte	0x91
	.sleb128 32
	.uleb128 0xb
	.ascii	"LED_state\000"
	.byte	0x1
	.byte	0x41
	.4byte	0xe05
	.byte	0x2
	.byte	0x91
	.sleb128 16
	.uleb128 0xb
	.ascii	"num_scans\000"
	.byte	0x1
	.byte	0x42
	.4byte	0xe05
	.byte	0x2
	.byte	0x91
	.sleb128 20
	.byte	0
	.uleb128 0x9
	.byte	0x1
	.ascii	"Set_LEDs\000"
	.byte	0x1
	.byte	0x65
	.byte	0x1
	.4byte	.LFB7
	.4byte	.LFE7
	.byte	0x1
	.byte	0x6e
	.byte	0x1
	.4byte	0xf74
	.uleb128 0xa
	.ascii	"L1\000"
	.byte	0x1
	.byte	0x65
	.4byte	0xe05
	.byte	0x2
	.byte	0x91
	.sleb128 8
	.uleb128 0xa
	.ascii	"L2\000"
	.byte	0x1
	.byte	0x65
	.4byte	0xe05
	.byte	0x2
	.byte	0x91
	.sleb128 12
	.uleb128 0xa
	.ascii	"L3\000"
	.byte	0x1
	.byte	0x65
	.4byte	0xe05
	.byte	0x2
	.byte	0x91
	.sleb128 16
	.uleb128 0xa
	.ascii	"L4\000"
	.byte	0x1
	.byte	0x65
	.4byte	0xe05
	.byte	0x2
	.byte	0x91
	.sleb128 20
	.byte	0
	.uleb128 0xe
	.byte	0x1
	.ascii	"TASK_Update_LEDs\000"
	.byte	0x1
	.byte	0x6e
	.byte	0x1
	.4byte	.LFB8
	.4byte	.LFE8
	.byte	0x1
	.byte	0x6e
	.byte	0x1
	.uleb128 0x8
	.byte	0x1
	.ascii	"ISR_PortA_Change\000"
	.byte	0x1
	.byte	0x91
	.byte	0x1
	.4byte	.LFB9
	.4byte	.LFE9
	.byte	0x1
	.byte	0x6e
	.byte	0x1
	.uleb128 0xe
	.byte	0x1
	.ascii	"Run_Game_Tasks\000"
	.byte	0x1
	.byte	0xa2
	.byte	0x1
	.4byte	.LFB10
	.4byte	.LFE10
	.byte	0x1
	.byte	0x6e
	.byte	0x1
	.uleb128 0xf
	.ascii	"INTCONSET\000"
	.byte	0x2
	.2byte	0x623
	.4byte	0xfe9
	.byte	0x1
	.byte	0x1
	.uleb128 0xc
	.4byte	0x7d
	.uleb128 0x10
	.ascii	"IFS3bits\000"
	.byte	0x2
	.2byte	0x6ee
	.ascii	"IFS3\000"
	.4byte	0x1006
	.byte	0x1
	.byte	0x1
	.uleb128 0xc
	.4byte	0x27f
	.uleb128 0x10
	.ascii	"IEC3bits\000"
	.byte	0x2
	.2byte	0x7ef
	.ascii	"IEC3\000"
	.4byte	0x1023
	.byte	0x1
	.byte	0x1
	.uleb128 0xc
	.4byte	0x486
	.uleb128 0x10
	.ascii	"IPC29bits\000"
	.byte	0x2
	.2byte	0xaee
	.ascii	"IPC29\000"
	.4byte	0x1042
	.byte	0x1
	.byte	0x1
	.uleb128 0xc
	.4byte	0x57b
	.uleb128 0xf
	.ascii	"ANSELA\000"
	.byte	0x2
	.2byte	0x2862
	.4byte	0xfe9
	.byte	0x1
	.byte	0x1
	.uleb128 0xf
	.ascii	"TRISA\000"
	.byte	0x2
	.2byte	0x2876
	.4byte	0xfe9
	.byte	0x1
	.byte	0x1
	.uleb128 0x10
	.ascii	"PORTAbits\000"
	.byte	0x2
	.2byte	0x28a7
	.ascii	"PORTA\000"
	.4byte	0x1082
	.byte	0x1
	.byte	0x1
	.uleb128 0xc
	.4byte	0x6a4
	.uleb128 0x10
	.ascii	"CNCONAbits\000"
	.byte	0x2
	.2byte	0x2924
	.ascii	"CNCONA\000"
	.4byte	0x10a3
	.byte	0x1
	.byte	0x1
	.uleb128 0xc
	.4byte	0x716
	.uleb128 0x10
	.ascii	"CNENAbits\000"
	.byte	0x2
	.2byte	0x293f
	.ascii	"CNENA\000"
	.4byte	0x10c2
	.byte	0x1
	.byte	0x1
	.uleb128 0xc
	.4byte	0x864
	.uleb128 0x10
	.ascii	"CNSTATAbits\000"
	.byte	0x2
	.2byte	0x295a
	.ascii	"CNSTATA\000"
	.4byte	0x10e5
	.byte	0x1
	.byte	0x1
	.uleb128 0xc
	.4byte	0x9c9
	.uleb128 0xf
	.ascii	"ANSELB\000"
	.byte	0x2
	.2byte	0x295f
	.4byte	0xfe9
	.byte	0x1
	.byte	0x1
	.uleb128 0xf
	.ascii	"TRISB\000"
	.byte	0x2
	.2byte	0x297c
	.4byte	0xfe9
	.byte	0x1
	.byte	0x1
	.uleb128 0x10
	.ascii	"LATBbits\000"
	.byte	0x2
	.2byte	0x29ce
	.ascii	"LATB\000"
	.4byte	0x1123
	.byte	0x1
	.byte	0x1
	.uleb128 0xc
	.4byte	0xb5f
	.uleb128 0xf
	.ascii	"TRISD\000"
	.byte	0x2
	.2byte	0x2b60
	.4byte	0xfe9
	.byte	0x1
	.byte	0x1
	.uleb128 0x10
	.ascii	"LATDbits\000"
	.byte	0x2
	.2byte	0x2bac
	.ascii	"LATD\000"
	.4byte	0x1150
	.byte	0x1
	.byte	0x1
	.uleb128 0xc
	.4byte	0xcb6
	.uleb128 0xf
	.ascii	"ANSELG\000"
	.byte	0x2
	.2byte	0x2e07
	.4byte	0xfe9
	.byte	0x1
	.byte	0x1
	.uleb128 0xf
	.ascii	"TRISG\000"
	.byte	0x2
	.2byte	0x2e1b
	.4byte	0xfe9
	.byte	0x1
	.byte	0x1
	.uleb128 0x10
	.ascii	"LATGbits\000"
	.byte	0x2
	.2byte	0x2e61
	.ascii	"LATG\000"
	.4byte	0x118e
	.byte	0x1
	.byte	0x1
	.uleb128 0xc
	.4byte	0xdcf
	.uleb128 0x11
	.ascii	"G_Position\000"
	.byte	0x1
	.byte	0xa
	.4byte	0xec5
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.4byte	G_Position
	.byte	0
	.section	.debug_abbrev,info
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0x8
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x1b
	.uleb128 0x8
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0xd
	.uleb128 0xb
	.uleb128 0xc
	.uleb128 0xb
	.uleb128 0x38
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x17
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0xd
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x2117
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x2117
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x2116
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x2116
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x2007
	.uleb128 0x8
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,info
	.4byte	0x1c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	0
	.4byte	0
	.section	.debug_line,info
.Ldebug_line0:
	.section	.debug_str,info
	.ident	"GCC: (Microchip Technology) 4.8.3 MPLAB XC32 Compiler v1.44"
# Begin MCHP vector dispatch table
	.globl	__vector_dispatch_118
	.section	.vector_118,code,keep
	.set	nomips16
	.set noreorder
	.align	2
	.ent	__vector_dispatch_118
__vector_dispatch_118:
	j	ISR_PortA_Change
	nop
	.set reorder
	.end	__vector_dispatch_118
	.size	__vector_dispatch_118, .-__vector_dispatch_118
# End MCHP vector dispatch table
# Microchip Technology PIC32 MCU configuration words
