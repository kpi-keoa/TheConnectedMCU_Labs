	.section .mdebug.abi32
	.previous
	.gnu_attribute 4, 4
	.section	.text,code
.Ltext0:
	.align	2
	.globl	OledSetCursor
.LFB4 = .
	.file 1 "e:/7 semester/\353\350\361\345\355\352\356/the-connected-mcu-lab--v1.5-19aug2016-rus/release/code/mplabxprojects/lab11_cache/oledchar.c"
	.loc 1 122 0
	.set	nomips16
	.set	nomicromips
	.ent	OledSetCursor
	.type	OledSetCursor, @function
OledSetCursor:
	.frame	$sp,24,$31		# vars= 0, regs= 1/0, args= 16, gp= 0
	.mask	0x80000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
# End mchp_output_function_prologue
.LVL0 = .
	addiu	$sp,$sp,-24
.LCFI0 = .
	sw	$31,20($sp)
.LCFI1 = .
	.loc 1 126 0
	lw	$2,%gp_rel(xchOledMax)($28)
	slt	$3,$4,$2
	.loc 1 127 0
	addiu	$2,$2,-1
	movz	$4,$2,$3
.LVL1 = .
	.loc 1 130 0
	lw	$2,%gp_rel(ychOledMax)($28)
	slt	$3,$5,$2
	.loc 1 131 0
	addiu	$2,$2,-1
	movz	$5,$2,$3
.LVL2 = .
	.loc 1 136 0
	sw	$4,%gp_rel(xchOledCur)($28)
	.loc 1 137 0
	sw	$5,%gp_rel(ychOledCur)($28)
	.loc 1 141 0
	lw	$2,%gp_rel(dxcoOledFontCur)($28)
	mul	$4,$4,$2
.LVL3 = .
	lw	$2,%gp_rel(dycoOledFontCur)($28)
.LVL4 = .
	jal	OledMoveTo
	mul	$5,$5,$2

.LVL5 = .
	.loc 1 143 0
	lw	$31,20($sp)
	j	$31
	addiu	$sp,$sp,24

	.set	macro
	.set	reorder
# Begin mchp_output_function_epilogue
# End mchp_output_function_epilogue
	.end	OledSetCursor
.LFE4:
	.size	OledSetCursor, .-OledSetCursor
	.align	2
	.globl	OledGetCursor
.LFB5 = .
	.loc 1 164 0
	.set	nomips16
	.set	nomicromips
	.ent	OledGetCursor
	.type	OledGetCursor, @function
OledGetCursor:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
# End mchp_output_function_prologue
.LVL6 = .
	.loc 1 166 0
	lw	$2,%gp_rel(xchOledCur)($28)
	sw	$2,0($4)
	.loc 1 167 0
	lw	$2,%gp_rel(ychOledCur)($28)
	j	$31
	sw	$2,0($5)

	.set	macro
	.set	reorder
# Begin mchp_output_function_epilogue
# End mchp_output_function_epilogue
	.end	OledGetCursor
.LFE5:
	.size	OledGetCursor, .-OledGetCursor
	.align	2
	.globl	OledDefUserChar
.LFB6 = .
	.loc 1 193 0
	.set	nomips16
	.set	nomicromips
	.ent	OledDefUserChar
	.type	OledDefUserChar, @function
OledDefUserChar:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
# End mchp_output_function_prologue
.LVL7 = .
	.loc 1 197 0
	slt	$3,$4,32
	beq	$3,$0,.L11
	move	$2,$0

	.loc 1 198 0
	sll	$4,$4,3
.LVL8 = .
	lw	$2,%gp_rel(pbOledFontUser)($28)
	addu	$4,$2,$4
.LVL9 = .
	addiu	$3,$5,8
.LVL10 = .
.L8:
	.loc 1 200 0
	addiu	$4,$4,1
.LVL11 = .
	addiu	$5,$5,1
.LVL12 = .
	lbu	$2,-1($5)
	.loc 1 199 0
	bne	$5,$3,.L8
	sb	$2,-1($4)

	.loc 1 202 0
	li	$2,1			# 0x1
.LVL13 = .
.L11:
	.loc 1 208 0
	j	$31
	nop

	.set	macro
	.set	reorder
# Begin mchp_output_function_epilogue
# End mchp_output_function_epilogue
	.end	OledDefUserChar
.LFE6:
	.size	OledDefUserChar, .-OledDefUserChar
	.align	2
	.globl	OledSetCharUpdate
.LFB7 = .
	.loc 1 231 0
	.set	nomips16
	.set	nomicromips
	.ent	OledSetCharUpdate
	.type	OledSetCharUpdate, @function
OledSetCharUpdate:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
# End mchp_output_function_prologue
.LVL14 = .
	.loc 1 233 0
	sltu	$4,$0,$4
.LVL15 = .
	j	$31
	sw	$4,%gp_rel(fOledCharUpdate)($28)

	.set	macro
	.set	reorder
# Begin mchp_output_function_epilogue
# End mchp_output_function_epilogue
	.end	OledSetCharUpdate
.LFE7:
	.size	OledSetCharUpdate, .-OledSetCharUpdate
	.align	2
	.globl	OledGetCharUpdate
.LFB8 = .
	.loc 1 255 0
	.set	nomips16
	.set	nomicromips
	.ent	OledGetCharUpdate
	.type	OledGetCharUpdate, @function
OledGetCharUpdate:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
# End mchp_output_function_prologue
	.loc 1 259 0
	j	$31
	lw	$2,%gp_rel(fOledCharUpdate)($28)

	.set	macro
	.set	reorder
# Begin mchp_output_function_epilogue
# End mchp_output_function_epilogue
	.end	OledGetCharUpdate
.LFE8:
	.size	OledGetCharUpdate, .-OledGetCharUpdate
	.align	2
	.globl	OledDrawGlyph
.LFB11 = .
	.loc 1 344 0
	.set	nomips16
	.set	nomicromips
	.ent	OledDrawGlyph
	.type	OledDrawGlyph, @function
OledDrawGlyph:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
# End mchp_output_function_prologue
.LVL16 = .
	.loc 1 349 0
	bltz	$4,.L20
	slt	$2,$4,32

	.loc 1 353 0
	beql	$2,$0,.L16
	addiu	$4,$4,-32

	.loc 1 354 0
	sll	$4,$4,3
.LVL17 = .
	lw	$6,%gp_rel(pbOledFontUser)($28)
.LVL18 = .
	j	.L17
	addu	$6,$6,$4

.LVL19 = .
.L16:
	.loc 1 357 0
	sll	$4,$4,3
	lw	$6,%gp_rel(pbOledFontCur)($28)
	addu	$6,$6,$4
.LVL20 = .
.L17:
	.loc 1 362 0
	lw	$2,%gp_rel(dxcoOledFontCur)($28)
	blez	$2,.L20
	lw	$3,%gp_rel(pbOledCur)($28)

	move	$2,$6
.LVL21 = .
	.loc 1 363 0
	addiu	$3,$3,1
.LVL22 = .
.L19:
	addiu	$2,$2,1
.LVL23 = .
	lbu	$4,-1($2)
	sb	$4,-1($3)
.LVL24 = .
	subu	$5,$2,$6
.LVL25 = .
	.loc 1 362 0
	lw	$4,%gp_rel(dxcoOledFontCur)($28)
	slt	$4,$5,$4
	bne	$4,$0,.L19
	addiu	$3,$3,1

.LVL26 = .
.L20:
	j	$31
	nop

	.set	macro
	.set	reorder
# Begin mchp_output_function_epilogue
# End mchp_output_function_epilogue
	.end	OledDrawGlyph
.LFE11:
	.size	OledDrawGlyph, .-OledDrawGlyph
	.align	2
	.globl	OledAdvanceCursor
.LFB12 = .
	.loc 1 388 0
	.set	nomips16
	.set	nomicromips
	.ent	OledAdvanceCursor
	.type	OledAdvanceCursor, @function
OledAdvanceCursor:
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
	.loc 1 390 0
	lw	$2,%gp_rel(xchOledCur)($28)
	addiu	$2,$2,1
	sw	$2,%gp_rel(xchOledCur)($28)
	.loc 1 391 0
	lw	$3,%gp_rel(xchOledMax)($28)
	slt	$2,$2,$3
	bne	$2,$0,.L25
	lw	$2,%gp_rel(ychOledMax)($28)

	.loc 1 392 0
	sw	$0,%gp_rel(xchOledCur)($28)
	.loc 1 393 0
	lw	$2,%gp_rel(ychOledCur)($28)
	addiu	$2,$2,1
	sw	$2,%gp_rel(ychOledCur)($28)
	.loc 1 395 0
	lw	$2,%gp_rel(ychOledMax)($28)
.L25:
	lw	$3,%gp_rel(ychOledCur)($28)
	slt	$2,$3,$2
	beql	$2,$0,.L23
	sw	$0,%gp_rel(ychOledCur)($28)

.L23:
	.loc 1 399 0
	lw	$4,%gp_rel(xchOledCur)($28)
	jal	OledSetCursor
	lw	$5,%gp_rel(ychOledCur)($28)

.LVL27 = .
	.loc 1 401 0
	lw	$31,20($sp)
	j	$31
	addiu	$sp,$sp,24

	.set	macro
	.set	reorder
# Begin mchp_output_function_epilogue
# End mchp_output_function_epilogue
	.end	OledAdvanceCursor
.LFE12:
	.size	OledAdvanceCursor, .-OledAdvanceCursor
	.align	2
	.globl	OledPutChar
.LFB9 = .
	.loc 1 280 0
	.set	nomips16
	.set	nomicromips
	.ent	OledPutChar
	.type	OledPutChar, @function
OledPutChar:
	.frame	$sp,24,$31		# vars= 0, regs= 1/0, args= 16, gp= 0
	.mask	0x80000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
# End mchp_output_function_prologue
.LVL28 = .
	addiu	$sp,$sp,-24
.LCFI4 = .
	sw	$31,20($sp)
.LCFI5 = .
	.loc 1 282 0
	jal	OledDrawGlyph
	nop

.LVL29 = .
	.loc 1 283 0
	jal	OledAdvanceCursor
	nop

.LVL30 = .
	.loc 1 284 0
	lw	$2,%gp_rel(fOledCharUpdate)($28)
	beq	$2,$0,.L29
	lw	$31,20($sp)

	.loc 1 285 0
	jal	OledUpdate
	nop

.LVL31 = .
	.loc 1 288 0
	lw	$31,20($sp)
.L29:
	j	$31
	addiu	$sp,$sp,24

	.set	macro
	.set	reorder
# Begin mchp_output_function_epilogue
# End mchp_output_function_epilogue
	.end	OledPutChar
.LFE9:
	.size	OledPutChar, .-OledPutChar
	.align	2
	.globl	OledPutString
.LFB10 = .
	.loc 1 309 0
	.set	nomips16
	.set	nomicromips
	.ent	OledPutString
	.type	OledPutString, @function
OledPutString:
	.frame	$sp,24,$31		# vars= 0, regs= 2/0, args= 16, gp= 0
	.mask	0x80010000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
# End mchp_output_function_prologue
.LVL32 = .
	addiu	$sp,$sp,-24
.LCFI6 = .
	sw	$31,20($sp)
	sw	$16,16($sp)
.LCFI7 = .
	move	$16,$4
	.loc 1 311 0
	lb	$4,0($4)
.LVL33 = .
	beq	$4,$0,.L35
	lw	$2,%gp_rel(fOledCharUpdate)($28)

.L32:
	.loc 1 312 0
	jal	OledDrawGlyph
	addiu	$16,$16,1

.LVL34 = .
	.loc 1 313 0
	jal	OledAdvanceCursor
	nop

.LVL35 = .
	.loc 1 311 0
	lb	$4,0($16)
	bne	$4,$0,.L32
	lw	$2,%gp_rel(fOledCharUpdate)($28)

.L35:
	.loc 1 317 0
	beq	$2,$0,.L36
	lw	$31,20($sp)

	.loc 1 318 0
	jal	OledUpdate
	nop

.LVL36 = .
	.loc 1 321 0
	lw	$31,20($sp)
.L36:
	lw	$16,16($sp)
.LVL37 = .
	j	$31
	addiu	$sp,$sp,24

	.set	macro
	.set	reorder
# Begin mchp_output_function_epilogue
# End mchp_output_function_epilogue
	.end	OledPutString
.LFE10:
	.size	OledPutString, .-OledPutString

	.comm	rgbOledFontUser,256,4

	.comm	pbOledFontExt,4,4

	.comm	ychOledMax,4,4

	.comm	xchOledMax,4,4

	.comm	ychOledCur,4,4

	.comm	xchOledCur,4,4

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
	.byte	0x4
	.4byte	.LCFI0-.LFB4
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI1-.LCFI0
	.byte	0x9f
	.uleb128 0x1
	.align	2
.LEFDE0:
.LSFDE2:
	.4byte	.LEFDE2-.LASFDE2
.LASFDE2:
	.4byte	.Lframe0
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.align	2
.LEFDE2:
.LSFDE4:
	.4byte	.LEFDE4-.LASFDE4
.LASFDE4:
	.4byte	.Lframe0
	.4byte	.LFB6
	.4byte	.LFE6-.LFB6
	.align	2
.LEFDE4:
.LSFDE6:
	.4byte	.LEFDE6-.LASFDE6
.LASFDE6:
	.4byte	.Lframe0
	.4byte	.LFB7
	.4byte	.LFE7-.LFB7
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
	.4byte	.LFB11
	.4byte	.LFE11-.LFB11
	.align	2
.LEFDE10:
.LSFDE12:
	.4byte	.LEFDE12-.LASFDE12
.LASFDE12:
	.4byte	.Lframe0
	.4byte	.LFB12
	.4byte	.LFE12-.LFB12
	.byte	0x4
	.4byte	.LCFI2-.LFB12
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI3-.LCFI2
	.byte	0x9f
	.uleb128 0x1
	.align	2
.LEFDE12:
.LSFDE14:
	.4byte	.LEFDE14-.LASFDE14
.LASFDE14:
	.4byte	.Lframe0
	.4byte	.LFB9
	.4byte	.LFE9-.LFB9
	.byte	0x4
	.4byte	.LCFI4-.LFB9
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI5-.LCFI4
	.byte	0x9f
	.uleb128 0x1
	.align	2
.LEFDE14:
.LSFDE16:
	.4byte	.LEFDE16-.LASFDE16
.LASFDE16:
	.4byte	.Lframe0
	.4byte	.LFB10
	.4byte	.LFE10-.LFB10
	.byte	0x4
	.4byte	.LCFI6-.LFB10
	.byte	0xe
	.uleb128 0x18
	.byte	0x4
	.4byte	.LCFI7-.LCFI6
	.byte	0x9f
	.uleb128 0x1
	.byte	0x90
	.uleb128 0x2
	.align	2
.LEFDE16:
	.section	.text,code
.Letext0:
	.file 2 "c:/program files (x86)/microchip/xc32/v1.44/pic32mx/include/machine/int_types.h"
	.file 3 "e:/7 semester/\353\350\361\345\355\352\356/the-connected-mcu-lab--v1.5-19aug2016-rus/release/code/mplabxprojects/lab11_cache/oled.h"
	.file 4 "e:/7 semester/\353\350\361\345\355\352\356/the-connected-mcu-lab--v1.5-19aug2016-rus/release/code/mplabxprojects/lab11_cache/oledgrph.h"
	.section	.debug_info,info
.Ldebug_info0:
	.4byte	0x5a6
	.2byte	0x2
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.ascii	"GNU C 4.8.3 MPLAB XC32 Compiler v1.44\000"
	.byte	0x1
	.ascii	"OledChar.c\000"
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
	.uleb128 0x3
	.ascii	"__uint8_t\000"
	.byte	0x2
	.byte	0x2f
	.4byte	0x10a
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
	.uleb128 0x3
	.ascii	"BYTE\000"
	.byte	0x3
	.byte	0x26
	.4byte	0xf9
	.uleb128 0x4
	.byte	0x1
	.ascii	"OledSetCursor\000"
	.byte	0x1
	.byte	0x79
	.byte	0x1
	.4byte	.LFB4
	.4byte	.LFE4
	.byte	0x1
	.byte	0x6d
	.byte	0x1
	.4byte	0x1bf
	.uleb128 0x5
	.ascii	"xch\000"
	.byte	0x1
	.byte	0x79
	.4byte	0xe3
	.4byte	.LLST0
	.uleb128 0x5
	.ascii	"ych\000"
	.byte	0x1
	.byte	0x79
	.4byte	0xe3
	.4byte	.LLST1
	.uleb128 0x6
	.4byte	.LVL5
	.4byte	0x577
	.byte	0
	.uleb128 0x4
	.byte	0x1
	.ascii	"OledGetCursor\000"
	.byte	0x1
	.byte	0xa3
	.byte	0x1
	.4byte	.LFB5
	.4byte	.LFE5
	.byte	0x1
	.byte	0x6d
	.byte	0x1
	.4byte	0x1fe
	.uleb128 0x7
	.ascii	"pxch\000"
	.byte	0x1
	.byte	0xa3
	.4byte	0x1fe
	.byte	0x1
	.byte	0x54
	.uleb128 0x7
	.ascii	"pych\000"
	.byte	0x1
	.byte	0xa3
	.4byte	0x1fe
	.byte	0x1
	.byte	0x55
	.byte	0
	.uleb128 0x8
	.byte	0x4
	.4byte	0xe3
	.uleb128 0x9
	.byte	0x1
	.ascii	"OledDefUserChar\000"
	.byte	0x1
	.byte	0xc0
	.byte	0x1
	.4byte	0xe3
	.4byte	.LFB6
	.4byte	.LFE6
	.byte	0x1
	.byte	0x6d
	.byte	0x1
	.4byte	0x268
	.uleb128 0x5
	.ascii	"ch\000"
	.byte	0x1
	.byte	0xc0
	.4byte	0x268
	.4byte	.LLST2
	.uleb128 0x5
	.ascii	"pbDef\000"
	.byte	0x1
	.byte	0xc0
	.4byte	0x270
	.4byte	.LLST3
	.uleb128 0xa
	.ascii	"pb\000"
	.byte	0x1
	.byte	0xc2
	.4byte	0x270
	.4byte	.LLST4
	.uleb128 0xa
	.ascii	"ib\000"
	.byte	0x1
	.byte	0xc3
	.4byte	0xe3
	.4byte	.LLST5
	.byte	0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.ascii	"char\000"
	.uleb128 0x8
	.byte	0x4
	.4byte	0x169
	.uleb128 0x4
	.byte	0x1
	.ascii	"OledSetCharUpdate\000"
	.byte	0x1
	.byte	0xe6
	.byte	0x1
	.4byte	.LFB7
	.4byte	.LFE7
	.byte	0x1
	.byte	0x6d
	.byte	0x1
	.4byte	0x2aa
	.uleb128 0x5
	.ascii	"f\000"
	.byte	0x1
	.byte	0xe6
	.4byte	0xe3
	.4byte	.LLST6
	.byte	0
	.uleb128 0xb
	.byte	0x1
	.ascii	"OledGetCharUpdate\000"
	.byte	0x1
	.byte	0xfe
	.4byte	0xe3
	.4byte	.LFB8
	.4byte	.LFE8
	.byte	0x1
	.byte	0x6d
	.byte	0x1
	.uleb128 0xc
	.byte	0x1
	.ascii	"OledDrawGlyph\000"
	.byte	0x1
	.2byte	0x157
	.byte	0x1
	.4byte	.LFB11
	.4byte	.LFE11
	.byte	0x1
	.byte	0x6d
	.byte	0x1
	.4byte	0x336
	.uleb128 0xd
	.ascii	"ch\000"
	.byte	0x1
	.2byte	0x157
	.4byte	0x268
	.4byte	.LLST7
	.uleb128 0xe
	.ascii	"pbFont\000"
	.byte	0x1
	.2byte	0x159
	.4byte	0x270
	.4byte	.LLST8
	.uleb128 0xe
	.ascii	"pbBmp\000"
	.byte	0x1
	.2byte	0x15a
	.4byte	0x270
	.4byte	.LLST9
	.uleb128 0xe
	.ascii	"ib\000"
	.byte	0x1
	.2byte	0x15b
	.4byte	0xe3
	.4byte	.LLST10
	.byte	0
	.uleb128 0xf
	.byte	0x1
	.ascii	"OledAdvanceCursor\000"
	.byte	0x1
	.2byte	0x183
	.4byte	.LFB12
	.4byte	.LFE12
	.byte	0x1
	.byte	0x6d
	.byte	0x1
	.4byte	0x366
	.uleb128 0x6
	.4byte	.LVL27
	.4byte	0x175
	.byte	0
	.uleb128 0xc
	.byte	0x1
	.ascii	"OledPutChar\000"
	.byte	0x1
	.2byte	0x117
	.byte	0x1
	.4byte	.LFB9
	.4byte	.LFE9
	.byte	0x1
	.byte	0x6d
	.byte	0x1
	.4byte	0x3b2
	.uleb128 0xd
	.ascii	"ch\000"
	.byte	0x1
	.2byte	0x117
	.4byte	0x268
	.4byte	.LLST11
	.uleb128 0x6
	.4byte	.LVL29
	.4byte	0x2cf
	.uleb128 0x6
	.4byte	.LVL30
	.4byte	0x336
	.uleb128 0x6
	.4byte	.LVL31
	.4byte	0x597
	.byte	0
	.uleb128 0xc
	.byte	0x1
	.ascii	"OledPutString\000"
	.byte	0x1
	.2byte	0x134
	.byte	0x1
	.4byte	.LFB10
	.4byte	.LFE10
	.byte	0x1
	.byte	0x6d
	.byte	0x1
	.4byte	0x400
	.uleb128 0xd
	.ascii	"sz\000"
	.byte	0x1
	.2byte	0x134
	.4byte	0x400
	.4byte	.LLST12
	.uleb128 0x6
	.4byte	.LVL34
	.4byte	0x2cf
	.uleb128 0x6
	.4byte	.LVL35
	.4byte	0x336
	.uleb128 0x6
	.4byte	.LVL36
	.4byte	0x597
	.byte	0
	.uleb128 0x8
	.byte	0x4
	.4byte	0x268
	.uleb128 0x10
	.4byte	0x169
	.4byte	0x417
	.uleb128 0x11
	.4byte	0x417
	.2byte	0x1ff
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.ascii	"sizetype\000"
	.uleb128 0x12
	.ascii	"rgbOledBmp\000"
	.byte	0x1
	.byte	0x46
	.4byte	0x406
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.4byte	rgbOledBmp
	.uleb128 0x13
	.ascii	"pbOledCur\000"
	.byte	0x1
	.byte	0x41
	.4byte	0x270
	.byte	0x1
	.byte	0x1
	.uleb128 0x13
	.ascii	"fOledCharUpdate\000"
	.byte	0x1
	.byte	0x44
	.4byte	0xe3
	.byte	0x1
	.byte	0x1
	.uleb128 0x13
	.ascii	"dxcoOledFontCur\000"
	.byte	0x1
	.byte	0x48
	.4byte	0xe3
	.byte	0x1
	.byte	0x1
	.uleb128 0x13
	.ascii	"dycoOledFontCur\000"
	.byte	0x1
	.byte	0x49
	.4byte	0xe3
	.byte	0x1
	.byte	0x1
	.uleb128 0x13
	.ascii	"pbOledFontCur\000"
	.byte	0x1
	.byte	0x4b
	.4byte	0x270
	.byte	0x1
	.byte	0x1
	.uleb128 0x13
	.ascii	"pbOledFontUser\000"
	.byte	0x1
	.byte	0x4c
	.4byte	0x270
	.byte	0x1
	.byte	0x1
	.uleb128 0x12
	.ascii	"xchOledCur\000"
	.byte	0x1
	.byte	0x52
	.4byte	0xe3
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.4byte	xchOledCur
	.uleb128 0x12
	.ascii	"ychOledCur\000"
	.byte	0x1
	.byte	0x53
	.4byte	0xe3
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.4byte	ychOledCur
	.uleb128 0x12
	.ascii	"xchOledMax\000"
	.byte	0x1
	.byte	0x55
	.4byte	0xe3
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.4byte	xchOledMax
	.uleb128 0x12
	.ascii	"ychOledMax\000"
	.byte	0x1
	.byte	0x56
	.4byte	0xe3
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.4byte	ychOledMax
	.uleb128 0x12
	.ascii	"pbOledFontExt\000"
	.byte	0x1
	.byte	0x58
	.4byte	0x270
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.4byte	pbOledFontExt
	.uleb128 0x10
	.4byte	0x169
	.4byte	0x559
	.uleb128 0x14
	.4byte	0x417
	.byte	0xff
	.byte	0
	.uleb128 0x12
	.ascii	"rgbOledFontUser\000"
	.byte	0x1
	.byte	0x5a
	.4byte	0x549
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.4byte	rgbOledFontUser
	.uleb128 0x15
	.byte	0x1
	.ascii	"OledMoveTo\000"
	.byte	0x4
	.byte	0x47
	.byte	0x1
	.byte	0x1
	.4byte	0x597
	.uleb128 0x16
	.4byte	0xe3
	.uleb128 0x16
	.4byte	0xe3
	.byte	0
	.uleb128 0x17
	.byte	0x1
	.ascii	"OledUpdate\000"
	.byte	0x3
	.byte	0x8a
	.byte	0x1
	.uleb128 0x18
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
	.uleb128 0x4
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
	.uleb128 0x5
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
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
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
	.uleb128 0x8
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
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
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0xb
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
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0xc
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
	.uleb128 0xd
	.uleb128 0x5
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
	.uleb128 0xe
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
	.uleb128 0xf
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
	.uleb128 0x10
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x12
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
	.uleb128 0x13
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
	.uleb128 0x14
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x15
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
	.uleb128 0x16
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
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
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,info
.Ldebug_loc0:
.LLST0:
	.4byte	.LVL0-.Ltext0
	.4byte	.LVL1-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL1-.Ltext0
	.4byte	.LVL3-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL3-.Ltext0
	.4byte	.LVL5-1-.Ltext0
	.2byte	0x5
	.byte	0x3
	.4byte	xchOledCur
	.4byte	0
	.4byte	0
.LLST1:
	.4byte	.LVL0-.Ltext0
	.4byte	.LVL2-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL2-.Ltext0
	.4byte	.LVL4-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL4-.Ltext0
	.4byte	.LVL5-1-.Ltext0
	.2byte	0x5
	.byte	0x3
	.4byte	ychOledCur
	.4byte	0
	.4byte	0
.LLST2:
	.4byte	.LVL7-.Ltext0
	.4byte	.LVL8-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL8-.Ltext0
	.4byte	.LFE6-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST3:
	.4byte	.LVL7-.Ltext0
	.4byte	.LVL12-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	.LVL12-.Ltext0
	.4byte	.LFE6-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	0
	.4byte	0
.LLST4:
	.4byte	.LVL9-.Ltext0
	.4byte	.LVL13-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	0
	.4byte	0
.LLST5:
	.4byte	.LVL9-.Ltext0
	.4byte	.LVL13-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST6:
	.4byte	.LVL14-.Ltext0
	.4byte	.LVL15-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL15-.Ltext0
	.4byte	.LFE7-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST7:
	.4byte	.LVL16-.Ltext0
	.4byte	.LVL17-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL17-.Ltext0
	.4byte	.LFE11-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST8:
	.4byte	.LVL18-.Ltext0
	.4byte	.LVL19-.Ltext0
	.2byte	0x1
	.byte	0x56
	.4byte	.LVL20-.Ltext0
	.4byte	.LVL21-.Ltext0
	.2byte	0x1
	.byte	0x56
	.4byte	.LVL21-.Ltext0
	.4byte	.LVL26-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	0
	.4byte	0
.LLST9:
	.4byte	.LVL20-.Ltext0
	.4byte	.LVL26-.Ltext0
	.2byte	0x1
	.byte	0x53
	.4byte	0
	.4byte	0
.LLST10:
	.4byte	.LVL20-.Ltext0
	.4byte	.LVL21-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL21-.Ltext0
	.4byte	.LVL23-.Ltext0
	.2byte	0x6
	.byte	0x72
	.sleb128 0
	.byte	0x76
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.4byte	.LVL23-.Ltext0
	.4byte	.LVL24-.Ltext0
	.2byte	0x7
	.byte	0x76
	.sleb128 0
	.byte	0x20
	.byte	0x72
	.sleb128 0
	.byte	0x22
	.byte	0x9f
	.4byte	.LVL24-.Ltext0
	.4byte	.LVL25-.Ltext0
	.2byte	0x6
	.byte	0x72
	.sleb128 0
	.byte	0x76
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.4byte	.LVL25-.Ltext0
	.4byte	.LVL26-.Ltext0
	.2byte	0x1
	.byte	0x55
	.4byte	0
	.4byte	0
.LLST11:
	.4byte	.LVL28-.Ltext0
	.4byte	.LVL29-1-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL29-1-.Ltext0
	.4byte	.LFE9-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST12:
	.4byte	.LVL32-.Ltext0
	.4byte	.LVL33-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL33-.Ltext0
	.4byte	.LVL37-.Ltext0
	.2byte	0x1
	.byte	0x60
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
	.section	.debug_line,info
.Ldebug_line0:
	.section	.debug_str,info
	.ident	"GCC: (Microchip Technology) 4.8.3 MPLAB XC32 Compiler v1.44"
# Begin MCHP vector dispatch table
# End MCHP vector dispatch table
# Microchip Technology PIC32 MCU configuration words
