	.section .mdebug.abi32
	.previous
	.gnu_attribute 4, 4
	.section	.text,code
.Ltext0:
	.align	2
	.globl	OledHostInit
.LFB4 = .
	.file 1 "e:/7 semester/\353\350\361\345\355\352\356/the-connected-mcu-lab--v1.5-19aug2016-rus/release/code/mplabxprojects/lab11_cache/oled.c"
	.loc 1 130 0
	.set	nomips16
	.set	nomicromips
	.ent	OledHostInit
	.type	OledHostInit, @function
OledHostInit:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
# End mchp_output_function_prologue
	.loc 1 134 0
	lui	$2,%hi(SPI2CON)
	sw	$0,%lo(SPI2CON)($2)
	.loc 1 135 0
	li	$3,9			# 0x9
	lui	$2,%hi(SPI2BRG)
	sw	$3,%lo(SPI2BRG)($2)
	.loc 1 136 0
	lui	$2,%hi(SPI2STAT)
	lw	$3,%lo(SPI2STAT)($2)
	ins	$3,$0,6,1
	sw	$3,%lo(SPI2STAT)($2)
	.loc 1 137 0
	lui	$2,%hi(SPI2CON)
	lw	$4,%lo(SPI2CON)($2)
	li	$3,1			# 0x1
	ins	$4,$3,6,1
	sw	$4,%lo(SPI2CON)($2)
	.loc 1 138 0
	lw	$4,%lo(SPI2CON)($2)
	ins	$4,$3,5,1
	sw	$4,%lo(SPI2CON)($2)
	.loc 1 139 0
	lw	$4,%lo(SPI2CON)($2)
	ins	$4,$3,15,1
	sw	$4,%lo(SPI2CON)($2)
	.loc 1 142 0
	lui	$2,%hi(LATDSET)
	li	$4,36864			# 0x9000
	sw	$4,%lo(LATDSET)($2)
	.loc 1 143 0
	li	$3,16384			# 0x4000
	sw	$3,%lo(LATDSET)($2)
	.loc 1 146 0
	lui	$2,%hi(TRISDCLR)
	sw	$4,%lo(TRISDCLR)($2)
	.loc 1 147 0
	sw	$3,%lo(TRISDCLR)($2)
	.loc 1 150 0
	li	$3,2048			# 0x800
	sw	$3,%lo(TRISDCLR)($2)
	.loc 1 155 0
	li	$2,512			# 0x200
	lui	$3,%hi(LATGSET)
	sw	$2,%lo(LATGSET)($3)
	.loc 1 158 0
	lui	$3,%hi(TRISGCLR)
	sw	$2,%lo(TRISGCLR)($3)
	.loc 1 159 0
	lui	$3,%hi(ANSELGCLR)
	sw	$2,%lo(ANSELGCLR)($3)
	.loc 1 162 0
	li	$3,6			# 0x6
	lui	$2,%hi(RPD11R)
	sw	$3,%lo(RPD11R)($2)
	j	$31
	nop

	.set	macro
	.set	reorder
# Begin mchp_output_function_epilogue
# End mchp_output_function_epilogue
	.end	OledHostInit
.LFE4:
	.size	OledHostInit, .-OledHostInit
	.align	2
	.globl	OledDspInit
.LFB5 = .
	.loc 1 182 0
	.set	nomips16
	.set	nomicromips
	.ent	OledDspInit
	.type	OledDspInit, @function
OledDspInit:
	.frame	$sp,32,$31		# vars= 0, regs= 3/0, args= 16, gp= 0
	.mask	0x80030000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
# End mchp_output_function_prologue
	addiu	$sp,$sp,-32
.LCFI0 = .
	sw	$31,28($sp)
	sw	$17,24($sp)
	sw	$16,20($sp)
.LCFI1 = .
	.loc 1 185 0
	lui	$16,%hi(LATDCLR)
	li	$2,16384			# 0x4000
	sw	$2,%lo(LATDCLR)($16)
	.loc 1 188 0
	li	$2,4096			# 0x1000
	sw	$2,%lo(LATDCLR)($16)
	.loc 1 189 0
	jal	DelayMs
	li	$4,1			# 0x1

.LVL0 = .
	.loc 1 192 0
	jal	Spi2PutByte
	li	$4,174			# 0xae

.LVL1 = .
	.loc 1 195 0
	li	$17,512			# 0x200
	lui	$2,%hi(PORTGCLR)
	sw	$17,%lo(PORTGCLR)($2)
	.loc 1 196 0
	jal	DelayMs
	li	$4,1			# 0x1

.LVL2 = .
	.loc 1 197 0
	lui	$2,%hi(PORTGSET)
	sw	$17,%lo(PORTGSET)($2)
	.loc 1 200 0
	jal	Spi2PutByte
	li	$4,141			# 0x8d

.LVL3 = .
	.loc 1 201 0
	jal	Spi2PutByte
	li	$4,20			# 0x14

.LVL4 = .
	.loc 1 202 0
	jal	Spi2PutByte
	li	$4,217			# 0xd9

.LVL5 = .
	.loc 1 203 0
	jal	Spi2PutByte
	li	$4,241			# 0xf1

.LVL6 = .
	.loc 1 206 0
	li	$2,32768			# 0x8000
	sw	$2,%lo(LATDCLR)($16)
	.loc 1 207 0
	jal	DelayMs
	li	$4,100			# 0x64

.LVL7 = .
	.loc 1 212 0
	jal	Spi2PutByte
	li	$4,161			# 0xa1

.LVL8 = .
	.loc 1 213 0
	jal	Spi2PutByte
	li	$4,200			# 0xc8

.LVL9 = .
	.loc 1 217 0
	jal	Spi2PutByte
	li	$4,218			# 0xda

.LVL10 = .
	.loc 1 218 0
	jal	Spi2PutByte
	li	$4,32			# 0x20

.LVL11 = .
	.loc 1 221 0
	jal	Spi2PutByte
	li	$4,175			# 0xaf

.LVL12 = .
	.loc 1 222 0
	lw	$31,28($sp)
	lw	$17,24($sp)
	lw	$16,20($sp)
	j	$31
	addiu	$sp,$sp,32

	.set	macro
	.set	reorder
# Begin mchp_output_function_epilogue
# End mchp_output_function_epilogue
	.end	OledDspInit
.LFE5:
	.size	OledDspInit, .-OledDspInit
	.align	2
	.globl	OledDvrInit
.LFB6 = .
	.loc 1 243 0
	.set	nomips16
	.set	nomicromips
	.ent	OledDvrInit
	.type	OledDvrInit, @function
OledDvrInit:
	.frame	$sp,24,$31		# vars= 0, regs= 1/0, args= 16, gp= 0
	.mask	0x80000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
# End mchp_output_function_prologue
	addiu	$sp,$sp,-24
.LCFI2 = .
	sw	$31,20($sp)
.LCFI3 = .
	.loc 1 248 0
	li	$2,8			# 0x8
	sw	$2,%gp_rel(dxcoOledFontCur)($28)
	.loc 1 249 0
	sw	$2,%gp_rel(dycoOledFontCur)($28)
	.loc 1 250 0
	lui	$2,%hi(rgbOledFont0)
	addiu	$2,$2,%lo(rgbOledFont0)
	sw	$2,%gp_rel(pbOledFontCur)($28)
	.loc 1 251 0
	lui	$3,%hi(rgbOledFontUser)
	addiu	$3,$3,%lo(rgbOledFontUser)
	sw	$3,%gp_rel(pbOledFontUser)($28)
.LVL13 = .
	move	$2,$3
	addiu	$3,$3,256
.LVL14 = .
	.loc 1 254 0
	sb	$0,0($2)
.LVL15 = .
.L8:
	addiu	$2,$2,1
.LVL16 = .
	.loc 1 253 0
	bnel	$2,$3,.L8
	sb	$0,0($2)

	.loc 1 257 0
	li	$2,16			# 0x10
.LVL17 = .
	sw	$2,%gp_rel(xchOledMax)($28)
	.loc 1 258 0
	li	$2,4			# 0x4
	sw	$2,%gp_rel(ychOledMax)($28)
	.loc 1 262 0
	move	$4,$0
	jal	OledSetCursor
	move	$5,$0

.LVL18 = .
	.loc 1 266 0
	li	$2,1			# 0x1
	sb	$2,%gp_rel(clrOledCur)($28)
	.loc 1 267 0
	lui	$2,%hi(rgbFillPat)
	addiu	$2,$2,%lo(rgbFillPat)
	sw	$2,%gp_rel(pbOledPatCur)($28)
	.loc 1 268 0
	jal	OledSetDrawMode
	move	$4,$0

.LVL19 = .
	.loc 1 273 0
	li	$2,1			# 0x1
	sw	$2,%gp_rel(fOledCharUpdate)($28)
	.loc 1 275 0
	lw	$31,20($sp)
	j	$31
	addiu	$sp,$sp,24

	.set	macro
	.set	reorder
# Begin mchp_output_function_epilogue
# End mchp_output_function_epilogue
	.end	OledDvrInit
.LFE6:
	.size	OledDvrInit, .-OledDvrInit
	.align	2
	.globl	OledUpdate
.LFB7 = .
	.loc 1 294 0
	.set	nomips16
	.set	nomicromips
	.ent	OledUpdate
	.type	OledUpdate, @function
OledUpdate:
	.frame	$sp,48,$31		# vars= 0, regs= 7/0, args= 16, gp= 0
	.mask	0x803f0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
# End mchp_output_function_prologue
	addiu	$sp,$sp,-48
.LCFI4 = .
	sw	$31,44($sp)
	sw	$21,40($sp)
	sw	$20,36($sp)
	sw	$19,32($sp)
	sw	$18,28($sp)
	sw	$17,24($sp)
	sw	$16,20($sp)
.LCFI5 = .
.LVL20 = .
	.loc 1 298 0
	lui	$17,%hi(rgbOledBmp)
	addiu	$17,$17,%lo(rgbOledBmp)
	.loc 1 299 0
	move	$16,$0
.LBB2 = .
	.loc 1 300 0
	lui	$21,%hi(LATDCLR)
	li	$18,16384			# 0x4000
	.loc 1 310 0
	lui	$20,%hi(LATDSET)
.LBE2 = .
	.loc 1 299 0
	li	$19,4			# 0x4
.LVL21 = .
.L11:
.LBB3 = .
	.loc 1 300 0
	sw	$18,%lo(LATDCLR)($21)
	.loc 1 304 0
	jal	Spi2PutByte
	li	$4,34			# 0x22

.LVL22 = .
	.loc 1 305 0
	jal	Spi2PutByte
	move	$4,$16

.LVL23 = .
	.loc 1 308 0
	jal	Spi2PutByte
	move	$4,$0

.LVL24 = .
	.loc 1 309 0
	jal	Spi2PutByte
	li	$4,16			# 0x10

.LVL25 = .
	.loc 1 310 0
	sw	$18,%lo(LATDSET)($20)
	.loc 1 314 0
	li	$4,128			# 0x80
	jal	OledPutBuffer
	move	$5,$17

.LVL26 = .
.LBE3 = .
	.loc 1 299 0
	addiu	$16,$16,1
.LVL27 = .
	bne	$16,$19,.L11
	addiu	$17,$17,128

	.loc 1 317 0
	lw	$31,44($sp)
	lw	$21,40($sp)
	lw	$20,36($sp)
	lw	$19,32($sp)
	lw	$18,28($sp)
	lw	$17,24($sp)
.LVL28 = .
	lw	$16,20($sp)
.LVL29 = .
	j	$31
	addiu	$sp,$sp,48

	.set	macro
	.set	reorder
# Begin mchp_output_function_epilogue
# End mchp_output_function_epilogue
	.end	OledUpdate
.LFE7:
	.size	OledUpdate, .-OledUpdate
	.align	2
	.globl	OledHostTerm
.LFB8 = .
	.loc 1 337 0
	.set	nomips16
	.set	nomicromips
	.ent	OledHostTerm
	.type	OledHostTerm, @function
OledHostTerm:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
# End mchp_output_function_prologue
	j	$31
	nop

	.set	macro
	.set	reorder
# Begin mchp_output_function_epilogue
# End mchp_output_function_epilogue
	.end	OledHostTerm
.LFE8:
	.size	OledHostTerm, .-OledHostTerm
	.align	2
	.globl	OledDevTerm
.LFB9 = .
	.loc 1 384 0
	.set	nomips16
	.set	nomicromips
	.ent	OledDevTerm
	.type	OledDevTerm, @function
OledDevTerm:
	.frame	$sp,24,$31		# vars= 0, regs= 1/0, args= 16, gp= 0
	.mask	0x80000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
# End mchp_output_function_prologue
	.loc 1 384 0
	addiu	$sp,$sp,-24
.LCFI6 = .
	sw	$31,20($sp)
.LCFI7 = .
	.loc 1 388 0
	jal	Spi2PutByte
	li	$4,174			# 0xae

.LVL30 = .
	.loc 1 399 0
	lw	$31,20($sp)
	j	$31
	addiu	$sp,$sp,24

	.set	macro
	.set	reorder
# Begin mchp_output_function_epilogue
# End mchp_output_function_epilogue
	.end	OledDevTerm
.LFE9:
	.size	OledDevTerm, .-OledDevTerm
	.align	2
	.globl	OledInit
.LFB10 = .
	.loc 1 401 0
	.set	nomips16
	.set	nomicromips
	.ent	OledInit
	.type	OledInit, @function
OledInit:
	.frame	$sp,24,$31		# vars= 0, regs= 1/0, args= 16, gp= 0
	.mask	0x80000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
# End mchp_output_function_prologue
	addiu	$sp,$sp,-24
.LCFI8 = .
	sw	$31,20($sp)
.LCFI9 = .
	.loc 1 402 0
	jal	OledHostInit
	nop

.LVL31 = .
	.loc 1 403 0
	jal	OledDspInit
	nop

.LVL32 = .
	.loc 1 404 0
	jal	OledDvrInit
	nop

.LVL33 = .
	.loc 1 405 0
	lw	$31,20($sp)
	j	$31
	addiu	$sp,$sp,24

	.set	macro
	.set	reorder
# Begin mchp_output_function_epilogue
# End mchp_output_function_epilogue
	.end	OledInit
.LFE10:
	.size	OledInit, .-OledInit

	.comm	pbOledFontUser,4,4

	.comm	pbOledFontCur,4,4

	.comm	dycoOledFontCur,4,4

	.comm	dxcoOledFontCur,4,4

	.comm	fOledCharUpdate,4,4

	.comm	pbOledPatCur,4,4

	.comm	clrOledCur,1,1

	.comm	bnOledCur,4,4

	.comm	pbOledCur,4,4

	.comm	ycoOledCur,4,4

	.comm	xcoOledCur,4,4

	.comm	rgbOledBmp,512,4
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
	.align	2
.LEFDE0:
.LSFDE2:
	.4byte	.LEFDE2-.LASFDE2
.LASFDE2:
	.4byte	.Lframe0
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.byte	0x4
	.4byte	.LCFI0-.LFB5
	.byte	0xe
	.uleb128 0x20
	.byte	0x4
	.4byte	.LCFI1-.LCFI0
	.byte	0x9f
	.uleb128 0x1
	.byte	0x91
	.uleb128 0x2
	.byte	0x90
	.uleb128 0x3
	.align	2
.LEFDE2:
.LSFDE4:
	.4byte	.LEFDE4-.LASFDE4
.LASFDE4:
	.4byte	.Lframe0
	.4byte	.LFB6
	.4byte	.LFE6-.LFB6
	.byte	0x4
	.4byte	.LCFI2-.LFB6
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI3-.LCFI2
	.byte	0x9f
	.uleb128 0x1
	.align	2
.LEFDE4:
.LSFDE6:
	.4byte	.LEFDE6-.LASFDE6
.LASFDE6:
	.4byte	.Lframe0
	.4byte	.LFB7
	.4byte	.LFE7-.LFB7
	.byte	0x4
	.4byte	.LCFI4-.LFB7
	.byte	0xe
	.uleb128 0x30
	.byte	0x4
	.4byte	.LCFI5-.LCFI4
	.byte	0x9f
	.uleb128 0x1
	.byte	0x95
	.uleb128 0x2
	.byte	0x94
	.uleb128 0x3
	.byte	0x93
	.uleb128 0x4
	.byte	0x92
	.uleb128 0x5
	.byte	0x91
	.uleb128 0x6
	.byte	0x90
	.uleb128 0x7
	.align	2
.LEFDE6:
.LSFDE8:
	.4byte	.LEFDE8-.LASFDE8
.LASFDE8:
	.4byte	.Lframe0
	.4byte	.LFB8
	.4byte	.LFE8-.LFB8
	.align	2
.LEFDE8:
.LSFDE10:
	.4byte	.LEFDE10-.LASFDE10
.LASFDE10:
	.4byte	.Lframe0
	.4byte	.LFB9
	.4byte	.LFE9-.LFB9
	.byte	0x4
	.4byte	.LCFI6-.LFB9
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI7-.LCFI6
	.byte	0x9f
	.uleb128 0x1
	.align	2
.LEFDE10:
.LSFDE12:
	.4byte	.LEFDE12-.LASFDE12
.LASFDE12:
	.4byte	.Lframe0
	.4byte	.LFB10
	.4byte	.LFE10-.LFB10
	.byte	0x4
	.4byte	.LCFI8-.LFB10
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI9-.LCFI8
	.byte	0x9f
	.uleb128 0x1
	.align	2
.LEFDE12:
	.section	.text,code
.Letext0:
	.file 2 "c:/program files (x86)/microchip/xc32/v1.44/pic32mx/include/proc/p32mz2048efg100.h"
	.file 3 "c:/program files (x86)/microchip/xc32/v1.44/pic32mx/include/machine/int_types.h"
	.file 4 "e:/7 semester/\353\350\361\345\355\352\356/the-connected-mcu-lab--v1.5-19aug2016-rus/release/code/mplabxprojects/lab11_cache/oled.h"
	.file 5 "e:/7 semester/\353\350\361\345\355\352\356/the-connected-mcu-lab--v1.5-19aug2016-rus/release/code/mplabxprojects/lab11_cache/user.h"
	.section	.debug_info,info
.Ldebug_info0:
	.4byte	0xb5f
	.2byte	0x2
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.ascii	"GNU C 4.8.3 MPLAB XC32 Compiler v1.44\000"
	.byte	0x1
	.ascii	"OLED.c\000"
	.ascii	"E:/7 semester/\313\350\361\345\355\352\356/The-Connected"
	.ascii	"-MCU-Lab--v1.5-19Aug2016-Rus/Release/Code/MPLABXProjects"
	.ascii	"/Lab11_Cache\000"
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
	.2byte	0x1a98
	.4byte	0x286
	.uleb128 0x4
	.ascii	"SRXISEL\000"
	.byte	0x2
	.2byte	0x1a99
	.4byte	0xae
	.byte	0x4
	.byte	0x2
	.byte	0x1e
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"STXISEL\000"
	.byte	0x2
	.2byte	0x1a9a
	.4byte	0xae
	.byte	0x4
	.byte	0x2
	.byte	0x1c
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"DISSDI\000"
	.byte	0x2
	.2byte	0x1a9b
	.4byte	0xae
	.byte	0x4
	.byte	0x1
	.byte	0x1b
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"MSTEN\000"
	.byte	0x2
	.2byte	0x1a9c
	.4byte	0xae
	.byte	0x4
	.byte	0x1
	.byte	0x1a
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"CKP\000"
	.byte	0x2
	.2byte	0x1a9d
	.4byte	0xae
	.byte	0x4
	.byte	0x1
	.byte	0x19
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"SSEN\000"
	.byte	0x2
	.2byte	0x1a9e
	.4byte	0xae
	.byte	0x4
	.byte	0x1
	.byte	0x18
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"CKE\000"
	.byte	0x2
	.2byte	0x1a9f
	.4byte	0xae
	.byte	0x4
	.byte	0x1
	.byte	0x17
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"SMP\000"
	.byte	0x2
	.2byte	0x1aa0
	.4byte	0xae
	.byte	0x4
	.byte	0x1
	.byte	0x16
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"MODE16\000"
	.byte	0x2
	.2byte	0x1aa1
	.4byte	0xae
	.byte	0x4
	.byte	0x1
	.byte	0x15
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"MODE32\000"
	.byte	0x2
	.2byte	0x1aa2
	.4byte	0xae
	.byte	0x4
	.byte	0x1
	.byte	0x14
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"DISSDO\000"
	.byte	0x2
	.2byte	0x1aa3
	.4byte	0xae
	.byte	0x4
	.byte	0x1
	.byte	0x13
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"SIDL\000"
	.byte	0x2
	.2byte	0x1aa4
	.4byte	0xae
	.byte	0x4
	.byte	0x1
	.byte	0x12
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"ON\000"
	.byte	0x2
	.2byte	0x1aa6
	.4byte	0xae
	.byte	0x4
	.byte	0x1
	.byte	0x10
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"ENHBUF\000"
	.byte	0x2
	.2byte	0x1aa7
	.4byte	0xae
	.byte	0x4
	.byte	0x1
	.byte	0xf
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"SPIFE\000"
	.byte	0x2
	.2byte	0x1aa8
	.4byte	0xae
	.byte	0x4
	.byte	0x1
	.byte	0xe
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"MCLKSEL\000"
	.byte	0x2
	.2byte	0x1aaa
	.4byte	0xae
	.byte	0x4
	.byte	0x1
	.byte	0x8
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"FRMCNT\000"
	.byte	0x2
	.2byte	0x1aab
	.4byte	0xae
	.byte	0x4
	.byte	0x3
	.byte	0x5
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"FRMSYPW\000"
	.byte	0x2
	.2byte	0x1aac
	.4byte	0xae
	.byte	0x4
	.byte	0x1
	.byte	0x4
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"MSSEN\000"
	.byte	0x2
	.2byte	0x1aad
	.4byte	0xae
	.byte	0x4
	.byte	0x1
	.byte	0x3
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"FRMPOL\000"
	.byte	0x2
	.2byte	0x1aae
	.4byte	0xae
	.byte	0x4
	.byte	0x1
	.byte	0x2
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"FRMSYNC\000"
	.byte	0x2
	.2byte	0x1aaf
	.4byte	0xae
	.byte	0x4
	.byte	0x1
	.byte	0x1
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"FRMEN\000"
	.byte	0x2
	.2byte	0x1ab0
	.4byte	0xae
	.byte	0x4
	.byte	0x1
	.byte	0
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.byte	0
	.uleb128 0x3
	.byte	0x4
	.byte	0x2
	.2byte	0x1ab2
	.4byte	0x2a0
	.uleb128 0x4
	.ascii	"w\000"
	.byte	0x2
	.2byte	0x1ab3
	.4byte	0xae
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
	.2byte	0x1a97
	.4byte	0x2b4
	.uleb128 0x6
	.4byte	0xbe
	.uleb128 0x6
	.4byte	0x286
	.byte	0
	.uleb128 0x7
	.ascii	"__SPI2CONbits_t\000"
	.byte	0x2
	.2byte	0x1ab5
	.4byte	0x2a0
	.uleb128 0x3
	.byte	0x4
	.byte	0x2
	.2byte	0x1abd
	.4byte	0x3c0
	.uleb128 0x4
	.ascii	"SPIRBF\000"
	.byte	0x2
	.2byte	0x1abe
	.4byte	0xae
	.byte	0x4
	.byte	0x1
	.byte	0x1f
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"SPITBF\000"
	.byte	0x2
	.2byte	0x1abf
	.4byte	0xae
	.byte	0x4
	.byte	0x1
	.byte	0x1e
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"SPITBE\000"
	.byte	0x2
	.2byte	0x1ac1
	.4byte	0xae
	.byte	0x4
	.byte	0x1
	.byte	0x1c
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"SPIRBE\000"
	.byte	0x2
	.2byte	0x1ac3
	.4byte	0xae
	.byte	0x4
	.byte	0x1
	.byte	0x1a
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"SPIROV\000"
	.byte	0x2
	.2byte	0x1ac4
	.4byte	0xae
	.byte	0x4
	.byte	0x1
	.byte	0x19
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"SRMT\000"
	.byte	0x2
	.2byte	0x1ac5
	.4byte	0xae
	.byte	0x4
	.byte	0x1
	.byte	0x18
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"SPITUR\000"
	.byte	0x2
	.2byte	0x1ac6
	.4byte	0xae
	.byte	0x4
	.byte	0x1
	.byte	0x17
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"SPIBUSY\000"
	.byte	0x2
	.2byte	0x1ac8
	.4byte	0xae
	.byte	0x4
	.byte	0x1
	.byte	0x14
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"FRMERR\000"
	.byte	0x2
	.2byte	0x1ac9
	.4byte	0xae
	.byte	0x4
	.byte	0x1
	.byte	0x13
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"TXBUFELM\000"
	.byte	0x2
	.2byte	0x1acb
	.4byte	0xae
	.byte	0x4
	.byte	0x5
	.byte	0xb
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"RXBUFELM\000"
	.byte	0x2
	.2byte	0x1acd
	.4byte	0xae
	.byte	0x4
	.byte	0x5
	.byte	0x3
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.byte	0
	.uleb128 0x3
	.byte	0x4
	.byte	0x2
	.2byte	0x1acf
	.4byte	0x3da
	.uleb128 0x4
	.ascii	"w\000"
	.byte	0x2
	.2byte	0x1ad0
	.4byte	0xae
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
	.2byte	0x1abc
	.4byte	0x3ee
	.uleb128 0x6
	.4byte	0x2cc
	.uleb128 0x6
	.4byte	0x3c0
	.byte	0
	.uleb128 0x7
	.ascii	"__SPI2STATbits_t\000"
	.byte	0x2
	.2byte	0x1ad2
	.4byte	0x3da
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
	.uleb128 0x8
	.ascii	"__uint8_t\000"
	.byte	0x3
	.byte	0x2f
	.4byte	0x44f
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
	.ascii	"BYTE\000"
	.byte	0x4
	.byte	0x26
	.4byte	0x43e
	.uleb128 0x9
	.byte	0x1
	.ascii	"OledHostInit\000"
	.byte	0x1
	.byte	0x81
	.4byte	.LFB4
	.4byte	.LFE4
	.byte	0x1
	.byte	0x6d
	.byte	0x1
	.4byte	0x4e7
	.uleb128 0xa
	.ascii	"tcfg\000"
	.byte	0x1
	.byte	0x83
	.4byte	0xae
	.byte	0
	.uleb128 0x9
	.byte	0x1
	.ascii	"OledDspInit\000"
	.byte	0x1
	.byte	0xb5
	.4byte	.LFB5
	.4byte	.LFE5
	.byte	0x1
	.byte	0x6d
	.byte	0x1
	.4byte	0x617
	.uleb128 0xb
	.byte	0x1
	.4byte	.LASF0
	.byte	0x1
	.byte	0xc0
	.4byte	0x428
	.byte	0x1
	.4byte	0x519
	.uleb128 0xc
	.byte	0
	.uleb128 0xd
	.4byte	.LVL0
	.4byte	0xaff
	.4byte	0x52c
	.uleb128 0xe
	.byte	0x1
	.byte	0x54
	.byte	0x1
	.byte	0x31
	.byte	0
	.uleb128 0xd
	.4byte	.LVL1
	.4byte	0xb17
	.4byte	0x540
	.uleb128 0xe
	.byte	0x1
	.byte	0x54
	.byte	0x2
	.byte	0x8
	.byte	0xae
	.byte	0
	.uleb128 0xd
	.4byte	.LVL2
	.4byte	0xaff
	.4byte	0x553
	.uleb128 0xe
	.byte	0x1
	.byte	0x54
	.byte	0x1
	.byte	0x31
	.byte	0
	.uleb128 0xd
	.4byte	.LVL3
	.4byte	0xb17
	.4byte	0x567
	.uleb128 0xe
	.byte	0x1
	.byte	0x54
	.byte	0x2
	.byte	0x8
	.byte	0x8d
	.byte	0
	.uleb128 0xd
	.4byte	.LVL4
	.4byte	0xb17
	.4byte	0x57a
	.uleb128 0xe
	.byte	0x1
	.byte	0x54
	.byte	0x1
	.byte	0x44
	.byte	0
	.uleb128 0xd
	.4byte	.LVL5
	.4byte	0xb17
	.4byte	0x58e
	.uleb128 0xe
	.byte	0x1
	.byte	0x54
	.byte	0x2
	.byte	0x8
	.byte	0xd9
	.byte	0
	.uleb128 0xd
	.4byte	.LVL6
	.4byte	0xb17
	.4byte	0x5a2
	.uleb128 0xe
	.byte	0x1
	.byte	0x54
	.byte	0x2
	.byte	0x8
	.byte	0xf1
	.byte	0
	.uleb128 0xd
	.4byte	.LVL7
	.4byte	0xaff
	.4byte	0x5b6
	.uleb128 0xe
	.byte	0x1
	.byte	0x54
	.byte	0x2
	.byte	0x8
	.byte	0x64
	.byte	0
	.uleb128 0xd
	.4byte	.LVL8
	.4byte	0xb17
	.4byte	0x5ca
	.uleb128 0xe
	.byte	0x1
	.byte	0x54
	.byte	0x2
	.byte	0x8
	.byte	0xa1
	.byte	0
	.uleb128 0xd
	.4byte	.LVL9
	.4byte	0xb17
	.4byte	0x5de
	.uleb128 0xe
	.byte	0x1
	.byte	0x54
	.byte	0x2
	.byte	0x8
	.byte	0xc8
	.byte	0
	.uleb128 0xd
	.4byte	.LVL10
	.4byte	0xb17
	.4byte	0x5f2
	.uleb128 0xe
	.byte	0x1
	.byte	0x54
	.byte	0x2
	.byte	0x8
	.byte	0xda
	.byte	0
	.uleb128 0xd
	.4byte	.LVL11
	.4byte	0xb17
	.4byte	0x606
	.uleb128 0xe
	.byte	0x1
	.byte	0x54
	.byte	0x2
	.byte	0x8
	.byte	0x20
	.byte	0
	.uleb128 0xf
	.4byte	.LVL12
	.4byte	0xb17
	.uleb128 0xe
	.byte	0x1
	.byte	0x54
	.byte	0x2
	.byte	0x8
	.byte	0xaf
	.byte	0
	.byte	0
	.uleb128 0x9
	.byte	0x1
	.ascii	"OledDvrInit\000"
	.byte	0x1
	.byte	0xf2
	.4byte	.LFB6
	.4byte	.LFE6
	.byte	0x1
	.byte	0x6d
	.byte	0x1
	.4byte	0x694
	.uleb128 0x10
	.ascii	"ib\000"
	.byte	0x1
	.byte	0xf4
	.4byte	0x428
	.4byte	.LLST0
	.uleb128 0x11
	.byte	0x1
	.4byte	.LASF1
	.byte	0x1
	.2byte	0x106
	.4byte	0x428
	.byte	0x1
	.4byte	0x658
	.uleb128 0xc
	.byte	0
	.uleb128 0x11
	.byte	0x1
	.4byte	.LASF2
	.byte	0x1
	.2byte	0x10c
	.4byte	0x428
	.byte	0x1
	.4byte	0x66c
	.uleb128 0xc
	.byte	0
	.uleb128 0xd
	.4byte	.LVL18
	.4byte	0xb2a
	.4byte	0x684
	.uleb128 0xe
	.byte	0x1
	.byte	0x55
	.byte	0x1
	.byte	0x30
	.uleb128 0xe
	.byte	0x1
	.byte	0x54
	.byte	0x1
	.byte	0x30
	.byte	0
	.uleb128 0xf
	.4byte	.LVL19
	.4byte	0xb3e
	.uleb128 0xe
	.byte	0x1
	.byte	0x54
	.byte	0x1
	.byte	0x30
	.byte	0
	.byte	0
	.uleb128 0x12
	.byte	0x1
	.ascii	"OledUpdate\000"
	.byte	0x1
	.2byte	0x125
	.4byte	.LFB7
	.4byte	.LFE7
	.byte	0x1
	.byte	0x6d
	.byte	0x1
	.4byte	0x772
	.uleb128 0x13
	.ascii	"ipag\000"
	.byte	0x1
	.2byte	0x127
	.4byte	0x428
	.4byte	.LLST1
	.uleb128 0x14
	.ascii	"icol\000"
	.byte	0x1
	.2byte	0x128
	.4byte	0x428
	.uleb128 0x13
	.ascii	"pb\000"
	.byte	0x1
	.2byte	0x129
	.4byte	0x772
	.4byte	.LLST2
	.uleb128 0x15
	.4byte	.Ldebug_ranges0+0
	.uleb128 0xb
	.byte	0x1
	.4byte	.LASF0
	.byte	0x1
	.byte	0xc0
	.4byte	0x428
	.byte	0x1
	.4byte	0x6f8
	.uleb128 0xc
	.byte	0
	.uleb128 0x11
	.byte	0x1
	.4byte	.LASF3
	.byte	0x1
	.2byte	0x13a
	.4byte	0x428
	.byte	0x1
	.4byte	0x70c
	.uleb128 0xc
	.byte	0
	.uleb128 0xd
	.4byte	.LVL22
	.4byte	0xb17
	.4byte	0x720
	.uleb128 0xe
	.byte	0x1
	.byte	0x54
	.byte	0x2
	.byte	0x8
	.byte	0x22
	.byte	0
	.uleb128 0xd
	.4byte	.LVL23
	.4byte	0xb17
	.4byte	0x734
	.uleb128 0xe
	.byte	0x1
	.byte	0x54
	.byte	0x2
	.byte	0x80
	.sleb128 0
	.byte	0
	.uleb128 0xd
	.4byte	.LVL24
	.4byte	0xb17
	.4byte	0x747
	.uleb128 0xe
	.byte	0x1
	.byte	0x54
	.byte	0x1
	.byte	0x30
	.byte	0
	.uleb128 0xd
	.4byte	.LVL25
	.4byte	0xb17
	.4byte	0x75a
	.uleb128 0xe
	.byte	0x1
	.byte	0x54
	.byte	0x1
	.byte	0x40
	.byte	0
	.uleb128 0xf
	.4byte	.LVL26
	.4byte	0xb52
	.uleb128 0xe
	.byte	0x1
	.byte	0x55
	.byte	0x2
	.byte	0x81
	.sleb128 0
	.uleb128 0xe
	.byte	0x1
	.byte	0x54
	.byte	0x2
	.byte	0x8
	.byte	0x80
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x16
	.byte	0x4
	.4byte	0x4ae
	.uleb128 0x17
	.byte	0x1
	.ascii	"OledHostTerm\000"
	.byte	0x1
	.2byte	0x150
	.4byte	.LFB8
	.4byte	.LFE8
	.byte	0x1
	.byte	0x6d
	.byte	0x1
	.uleb128 0x12
	.byte	0x1
	.ascii	"OledDevTerm\000"
	.byte	0x1
	.2byte	0x17f
	.4byte	.LFB9
	.4byte	.LFE9
	.byte	0x1
	.byte	0x6d
	.byte	0x1
	.4byte	0x7d9
	.uleb128 0xb
	.byte	0x1
	.4byte	.LASF0
	.byte	0x1
	.byte	0xc0
	.4byte	0x428
	.byte	0x1
	.4byte	0x7c8
	.uleb128 0xc
	.byte	0
	.uleb128 0xf
	.4byte	.LVL30
	.4byte	0xb17
	.uleb128 0xe
	.byte	0x1
	.byte	0x54
	.byte	0x2
	.byte	0x8
	.byte	0xae
	.byte	0
	.byte	0
	.uleb128 0x12
	.byte	0x1
	.ascii	"OledInit\000"
	.byte	0x1
	.2byte	0x191
	.4byte	.LFB10
	.4byte	.LFE10
	.byte	0x1
	.byte	0x6d
	.byte	0x1
	.4byte	0x812
	.uleb128 0x18
	.4byte	.LVL31
	.4byte	0x4ba
	.uleb128 0x18
	.4byte	.LVL32
	.4byte	0x4e7
	.uleb128 0x18
	.4byte	.LVL33
	.4byte	0x617
	.byte	0
	.uleb128 0x19
	.ascii	"RPD11R\000"
	.byte	0x2
	.2byte	0x5b4
	.4byte	0x823
	.byte	0x1
	.byte	0x1
	.uleb128 0x1a
	.4byte	0xae
	.uleb128 0x19
	.ascii	"SPI2CON\000"
	.byte	0x2
	.2byte	0x1a96
	.4byte	0x823
	.byte	0x1
	.byte	0x1
	.uleb128 0x1b
	.ascii	"SPI2CONbits\000"
	.byte	0x2
	.2byte	0x1ab6
	.ascii	"SPI2CON\000"
	.4byte	0x858
	.byte	0x1
	.byte	0x1
	.uleb128 0x1a
	.4byte	0x2b4
	.uleb128 0x1b
	.ascii	"SPI2STATbits\000"
	.byte	0x2
	.2byte	0x1ad3
	.ascii	"SPI2STAT\000"
	.4byte	0x87d
	.byte	0x1
	.byte	0x1
	.uleb128 0x1a
	.4byte	0x3ee
	.uleb128 0x19
	.ascii	"SPI2BRG\000"
	.byte	0x2
	.2byte	0x1ada
	.4byte	0x823
	.byte	0x1
	.byte	0x1
	.uleb128 0x19
	.ascii	"TRISDCLR\000"
	.byte	0x2
	.2byte	0x2fb8
	.4byte	0x823
	.byte	0x1
	.byte	0x1
	.uleb128 0x19
	.ascii	"LATDCLR\000"
	.byte	0x2
	.2byte	0x2fee
	.4byte	0x823
	.byte	0x1
	.byte	0x1
	.uleb128 0x19
	.ascii	"LATDSET\000"
	.byte	0x2
	.2byte	0x2fef
	.4byte	0x823
	.byte	0x1
	.byte	0x1
	.uleb128 0x19
	.ascii	"ANSELGCLR\000"
	.byte	0x2
	.2byte	0x32fa
	.4byte	0x823
	.byte	0x1
	.byte	0x1
	.uleb128 0x19
	.ascii	"TRISGCLR\000"
	.byte	0x2
	.2byte	0x3313
	.4byte	0x823
	.byte	0x1
	.byte	0x1
	.uleb128 0x19
	.ascii	"PORTGCLR\000"
	.byte	0x2
	.2byte	0x332c
	.4byte	0x823
	.byte	0x1
	.byte	0x1
	.uleb128 0x19
	.ascii	"PORTGSET\000"
	.byte	0x2
	.2byte	0x332d
	.4byte	0x823
	.byte	0x1
	.byte	0x1
	.uleb128 0x19
	.ascii	"LATGSET\000"
	.byte	0x2
	.2byte	0x3346
	.4byte	0x823
	.byte	0x1
	.byte	0x1
	.uleb128 0x1c
	.4byte	0x4ae
	.4byte	0x93b
	.uleb128 0x1d
	.4byte	0x93b
	.2byte	0x1ff
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.ascii	"sizetype\000"
	.uleb128 0x1e
	.ascii	"rgbOledBmp\000"
	.byte	0x4
	.byte	0x68
	.4byte	0x92a
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.4byte	rgbOledBmp
	.uleb128 0x1c
	.4byte	0x4ae
	.4byte	0x96b
	.uleb128 0x1f
	.byte	0
	.uleb128 0x20
	.ascii	"rgbOledFont0\000"
	.byte	0x1
	.byte	0x42
	.4byte	0x960
	.byte	0x1
	.byte	0x1
	.uleb128 0x20
	.ascii	"rgbOledFontUser\000"
	.byte	0x1
	.byte	0x43
	.4byte	0x960
	.byte	0x1
	.byte	0x1
	.uleb128 0x20
	.ascii	"rgbFillPat\000"
	.byte	0x1
	.byte	0x44
	.4byte	0x960
	.byte	0x1
	.byte	0x1
	.uleb128 0x20
	.ascii	"xchOledMax\000"
	.byte	0x1
	.byte	0x46
	.4byte	0x428
	.byte	0x1
	.byte	0x1
	.uleb128 0x20
	.ascii	"ychOledMax\000"
	.byte	0x1
	.byte	0x47
	.4byte	0x428
	.byte	0x1
	.byte	0x1
	.uleb128 0x1e
	.ascii	"xcoOledCur\000"
	.byte	0x1
	.byte	0x4d
	.4byte	0x428
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.4byte	xcoOledCur
	.uleb128 0x1e
	.ascii	"ycoOledCur\000"
	.byte	0x1
	.byte	0x4e
	.4byte	0x428
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.4byte	ycoOledCur
	.uleb128 0x1e
	.ascii	"pbOledCur\000"
	.byte	0x1
	.byte	0x50
	.4byte	0x772
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.4byte	pbOledCur
	.uleb128 0x1e
	.ascii	"bnOledCur\000"
	.byte	0x1
	.byte	0x51
	.4byte	0x428
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.4byte	bnOledCur
	.uleb128 0x1e
	.ascii	"clrOledCur\000"
	.byte	0x1
	.byte	0x52
	.4byte	0x4ae
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.4byte	clrOledCur
	.uleb128 0x1e
	.ascii	"pbOledPatCur\000"
	.byte	0x1
	.byte	0x53
	.4byte	0x772
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.4byte	pbOledPatCur
	.uleb128 0x1e
	.ascii	"fOledCharUpdate\000"
	.byte	0x1
	.byte	0x54
	.4byte	0x428
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.4byte	fOledCharUpdate
	.uleb128 0x1e
	.ascii	"dxcoOledFontCur\000"
	.byte	0x1
	.byte	0x56
	.4byte	0x428
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.4byte	dxcoOledFontCur
	.uleb128 0x1e
	.ascii	"dycoOledFontCur\000"
	.byte	0x1
	.byte	0x57
	.4byte	0x428
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.4byte	dycoOledFontCur
	.uleb128 0x1e
	.ascii	"pbOledFontCur\000"
	.byte	0x1
	.byte	0x59
	.4byte	0x772
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.4byte	pbOledFontCur
	.uleb128 0x1e
	.ascii	"pbOledFontUser\000"
	.byte	0x1
	.byte	0x5a
	.4byte	0x772
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.4byte	pbOledFontUser
	.uleb128 0x21
	.byte	0x1
	.ascii	"DelayMs\000"
	.byte	0x5
	.byte	0x31
	.byte	0x1
	.byte	0x1
	.4byte	0xb17
	.uleb128 0x22
	.4byte	0x428
	.byte	0
	.uleb128 0xb
	.byte	0x1
	.4byte	.LASF0
	.byte	0x1
	.byte	0xc0
	.4byte	0x428
	.byte	0x1
	.4byte	0xb2a
	.uleb128 0xc
	.byte	0
	.uleb128 0x11
	.byte	0x1
	.4byte	.LASF1
	.byte	0x1
	.2byte	0x106
	.4byte	0x428
	.byte	0x1
	.4byte	0xb3e
	.uleb128 0xc
	.byte	0
	.uleb128 0x11
	.byte	0x1
	.4byte	.LASF2
	.byte	0x1
	.2byte	0x10c
	.4byte	0x428
	.byte	0x1
	.4byte	0xb52
	.uleb128 0xc
	.byte	0
	.uleb128 0x23
	.byte	0x1
	.4byte	.LASF3
	.byte	0x1
	.2byte	0x13a
	.4byte	0x428
	.byte	0x1
	.uleb128 0xc
	.byte	0
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
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
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
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0xa
	.uleb128 0x2111
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
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
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
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
	.uleb128 0x13
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
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x14
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
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x55
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
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
	.uleb128 0x18
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x19
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
	.uleb128 0x1a
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1b
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
	.uleb128 0x1c
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x1e
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
	.uleb128 0x1f
	.uleb128 0x21
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x20
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
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0x21
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
	.uleb128 0x3c
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x22
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x23
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,info
.Ldebug_loc0:
.LLST0:
	.4byte	.LVL13-.Ltext0
	.4byte	.LVL14-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST1:
	.4byte	.LVL20-.Ltext0
	.4byte	.LVL21-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL21-.Ltext0
	.4byte	.LVL29-.Ltext0
	.2byte	0x1
	.byte	0x60
	.4byte	0
	.4byte	0
.LLST2:
	.4byte	.LVL20-.Ltext0
	.4byte	.LVL21-.Ltext0
	.2byte	0x6
	.byte	0x3
	.4byte	rgbOledBmp
	.byte	0x9f
	.4byte	.LVL21-.Ltext0
	.4byte	.LVL28-.Ltext0
	.2byte	0x1
	.byte	0x61
	.4byte	0
	.4byte	0
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
	.section	.debug_ranges,info
.Ldebug_ranges0:
	.4byte	.LBB2-.Ltext0
	.4byte	.LBE2-.Ltext0
	.4byte	.LBB3-.Ltext0
	.4byte	.LBE3-.Ltext0
	.4byte	0
	.4byte	0
	.section	.debug_line,info
.Ldebug_line0:
	.section	.debug_str,info
.LASF3:
	.ascii	"OledPutBuffer\000"
.LASF1:
	.ascii	"OledSetCursor\000"
.LASF2:
	.ascii	"OledSetDrawMode\000"
.LASF0:
	.ascii	"Spi2PutByte\000"
	.ident	"GCC: (Microchip Technology) 4.8.3 MPLAB XC32 Compiler v1.44"
# Begin MCHP vector dispatch table
# End MCHP vector dispatch table
# Microchip Technology PIC32 MCU configuration words
