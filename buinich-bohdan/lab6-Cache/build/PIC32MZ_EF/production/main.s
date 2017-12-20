	.section .mdebug.abi32
	.previous
	.gnu_attribute 4, 4
	.section	.text,code
.Ltext0:
	.align	2
	.globl	Timed_Array_Test_CR
.LFB73 = .
	.file 1 "e:/7 semester/\353\350\361\345\355\352\356/the-connected-mcu-lab--v1.5-19aug2016-rus/release/code/mplabxprojects/lab11_cache/main.c"
	.loc 1 32 0
	.set	nomips16
	.set	nomicromips
	.ent	Timed_Array_Test_CR
	.type	Timed_Array_Test_CR, @function
Timed_Array_Test_CR:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
# End mchp_output_function_prologue
.LVL0 = .
	.loc 1 37 0
	lui	$2,%hi(LATE)
	lhu	$3,%lo(LATE)($2)
	li	$8,1			# 0x1
	ins	$3,$8,0,1
	sh	$3,%lo(LATE)($2)
	.loc 1 38 0
	lui	$2,%hi(TMR2)
	sw	$0,%lo(TMR2)($2)
.LVL1 = .
	.loc 1 43 0
	sll	$11,$5,2
	.loc 1 34 0
	move	$8,$0
	.loc 1 39 0
	move	$10,$0
.LVL2 = .
.L5:
	move	$3,$6
	.loc 1 41 0
	move	$2,$0
.LVL3 = .
.L3:
	.loc 1 43 0
	lw	$9,0($3)
	addu	$8,$8,$9
.LVL4 = .
	.loc 1 44 0
	addiu	$2,$2,1
.LVL5 = .
	.loc 1 45 0
	slt	$9,$2,$5
	bne	$9,$0,.L3
	addiu	$3,$3,4

	.loc 1 46 0
	addiu	$10,$10,1
.LVL6 = .
	.loc 1 47 0
	slt	$2,$10,$4
.LVL7 = .
	bne	$2,$0,.L5
	addu	$6,$6,$11

	.loc 1 48 0
	lui	$2,%hi(TMR2)
	lw	$2,%lo(TMR2)($2)
.LVL8 = .
	.loc 1 49 0
	lui	$3,%hi(LATE)
	lhu	$4,%lo(LATE)($3)
.LVL9 = .
	ins	$4,$0,0,1
	sh	$4,%lo(LATE)($3)
	.loc 1 52 0
	j	$31
	sw	$8,0($7)

	.set	macro
	.set	reorder
# Begin mchp_output_function_epilogue
# End mchp_output_function_epilogue
	.end	Timed_Array_Test_CR
.LFE73:
	.size	Timed_Array_Test_CR, .-Timed_Array_Test_CR
	.align	2
	.globl	Timed_Array_Test_RC
.LFB74 = .
	.loc 1 54 0
	.set	nomips16
	.set	nomicromips
	.ent	Timed_Array_Test_RC
	.type	Timed_Array_Test_RC, @function
Timed_Array_Test_RC:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
# End mchp_output_function_prologue
.LVL10 = .
	.loc 1 59 0
	lui	$2,%hi(LATE)
	lhu	$3,%lo(LATE)($2)
	li	$8,1			# 0x1
	ins	$3,$8,0,1
	sh	$3,%lo(LATE)($2)
	.loc 1 60 0
	lui	$2,%hi(TMR2)
	sw	$0,%lo(TMR2)($2)
.LVL11 = .
	.loc 1 65 0
	sll	$11,$5,2
	.loc 1 56 0
	move	$8,$0
	.loc 1 61 0
	move	$12,$0
.LVL12 = .
	move	$3,$6
.L11:
	.loc 1 63 0
	move	$2,$0
	.loc 1 65 0
	sll	$10,$12,2
.LVL13 = .
.L8:
	lwx	$9,$3($10)
	addu	$8,$8,$9
.LVL14 = .
	.loc 1 66 0
	addiu	$2,$2,1
.LVL15 = .
	.loc 1 67 0
	slt	$9,$2,$4
	bne	$9,$0,.L8
	addu	$3,$3,$11

	.loc 1 68 0
	addiu	$12,$12,1
.LVL16 = .
	.loc 1 69 0
	slt	$2,$12,$5
.LVL17 = .
	bne	$2,$0,.L11
	move	$3,$6

	.loc 1 70 0
	lui	$2,%hi(TMR2)
	lw	$2,%lo(TMR2)($2)
.LVL18 = .
	.loc 1 71 0
	lui	$3,%hi(LATE)
	lhu	$4,%lo(LATE)($3)
.LVL19 = .
	ins	$4,$0,0,1
	sh	$4,%lo(LATE)($3)
	.loc 1 74 0
	j	$31
	sw	$8,0($7)

	.set	macro
	.set	reorder
# Begin mchp_output_function_epilogue
# End mchp_output_function_epilogue
	.end	Timed_Array_Test_RC
.LFE74:
	.size	Timed_Array_Test_RC, .-Timed_Array_Test_RC
	.align	2
	.globl	Pollute_Cache
.LFB75 = .
	.loc 1 76 0
	.set	nomips16
	.set	nomicromips
	.ent	Pollute_Cache
	.type	Pollute_Cache, @function
Pollute_Cache:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
# End mchp_output_function_prologue
.LVL20 = .
	.loc 1 76 0
	li	$2,1024			# 0x400
.LVL21 = .
	addiu	$2,$2,-1
.LVL22 = .
.L16:
	.loc 1 80 0
	bnel	$2,$0,.L16
	addiu	$2,$2,-1

.LVL23 = .
	.loc 1 83 0
	j	$31
	nop

	.set	macro
	.set	reorder
# Begin mchp_output_function_epilogue
# End mchp_output_function_epilogue
	.end	Pollute_Cache
.LFE75:
	.size	Pollute_Cache, .-Pollute_Cache
	.section	.rodata,code
	.align	2
.LC0:
	.ascii	"Cache Eval.\000"
	.align	2
.LC1:
	.ascii	"%u*%u array\000"
	.align	2
.LC2:
	.ascii	"%6u T2 ticks\000"
	.align	2
.LC3:
	.ascii	"%6.3f CPU cy/el\000"
	.section	.text,code
	.align	2
	.globl	main
.LFB76 = .
	.loc 1 85 0
	.set	nomips16
	.set	nomicromips
	.ent	main
	.type	main, @function
main:
	.frame	$sp,96,$31		# vars= 24, regs= 8/2, args= 16, gp= 0
	.mask	0x807f0000,-28
	.fmask	0x00300000,-16
	.set	noreorder
	.set	nomacro
# End mchp_output_function_prologue
	addiu	$sp,$sp,-96
.LCFI0 = .
	sw	$31,68($sp)
	sw	$22,64($sp)
	sw	$21,60($sp)
	sw	$20,56($sp)
	sw	$19,52($sp)
	sw	$18,48($sp)
	sw	$17,44($sp)
	sw	$16,40($sp)
	sdc1	$f21,80($sp)
	sdc1	$f20,72($sp)
.LCFI1 = .
.LVL24 = .
	.loc 1 92 0
	jal	InitApp
	sw	$0,32($sp)

.LVL25 = .
	.loc 1 94 0
	move	$4,$0
	jal	OledSetCursor
	move	$5,$0

.LVL26 = .
	.loc 1 95 0
	lui	$4,%hi(.LC0)
	jal	OledPutString
	addiu	$4,$4,%lo(.LC0)

.LVL27 = .
	.loc 1 96 0
	jal	DelayMs
	li	$4,500			# 0x1f4

.LVL28 = .
	.loc 1 99 0
	lui	$22,%hi(.LC1)
	addiu	$22,$22,%lo(.LC1)
	.loc 1 106 0
	lui	$21,%hi(aa)
	addiu	$21,$21,%lo(aa)
	.loc 1 108 0
	lui	$20,%hi(.LC2)
	addiu	$20,$20,%lo(.LC2)
	.loc 1 112 0
	lui	$2,%hi(.LC4)
	lwc1	$f21,%lo(.LC4)($2)
	lui	$2,%hi(.LC5)
	lwc1	$f20,%lo(.LC5)($2)
	lui	$19,%hi(.LC3)
	addiu	$19,$19,%lo(.LC3)
.LVL29 = .
	.loc 1 99 0
	addiu	$4,$sp,16
.L20:
	move	$5,$22
	li	$6,16			# 0x10
	jal	_sprintf_cdfFnopuxX
	li	$7,16			# 0x10

.LVL30 = .
	.loc 1 100 0
	move	$4,$0
	jal	OledSetCursor
	li	$5,1			# 0x1

.LVL31 = .
	.loc 1 101 0
	jal	OledPutString
	addiu	$4,$sp,16

.LVL32 = .
	.loc 1 106 0
	li	$4,16			# 0x10
	li	$5,16			# 0x10
	move	$6,$21
	jal	Timed_Array_Test_CR
	addiu	$7,$sp,32

.LVL33 = .
	move	$18,$2
.LVL34 = .
	.loc 1 108 0
	addiu	$4,$sp,16
	move	$5,$20
	jal	_sprintf_cdfFnopuxX
	move	$6,$2

.LVL35 = .
	.loc 1 109 0
	move	$4,$0
	jal	OledSetCursor
	li	$5,2			# 0x2

.LVL36 = .
	.loc 1 110 0
	jal	OledPutString
	addiu	$4,$sp,16

.LVL37 = .
	.loc 1 112 0
	move	$17,$0
	mtc1	$18,$f1
	mthc1	$17,$f1
	cvt.s.l	$f0,$f1
	mul.s	$f0,$f0,$f21
	addiu	$4,$sp,16
	move	$5,$19
	mul.s	$f0,$f0,$f20
	jal	_sprintf_cdfFnopuxX
	mfc1	$6,$f0

.LVL38 = .
	.loc 1 113 0
	move	$4,$0
	jal	OledSetCursor
	li	$5,3			# 0x3

.LVL39 = .
	.loc 1 114 0
	jal	OledPutString
	addiu	$4,$sp,16

.LVL40 = .
	.loc 1 99 0
	j	.L20
	addiu	$4,$sp,16

	.set	macro
	.set	reorder
# Begin mchp_output_function_epilogue
# End mchp_output_function_epilogue
	.end	main
.LFE76:
	.size	main, .-main

	.comm	aa,1024,4

	.comm	dummy,4096,4

	.comm	rgbOledBmp,512,4
	.section	.rodata,code
	.align	2
.LC4:
	.word	1082130432
	.align	2
.LC5:
	.word	998244352
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
	.4byte	.LFB73
	.4byte	.LFE73-.LFB73
	.align	2
.LEFDE0:
.LSFDE2:
	.4byte	.LEFDE2-.LASFDE2
.LASFDE2:
	.4byte	.Lframe0
	.4byte	.LFB74
	.4byte	.LFE74-.LFB74
	.align	2
.LEFDE2:
.LSFDE4:
	.4byte	.LEFDE4-.LASFDE4
.LASFDE4:
	.4byte	.Lframe0
	.4byte	.LFB75
	.4byte	.LFE75-.LFB75
	.align	2
.LEFDE4:
.LSFDE6:
	.4byte	.LEFDE6-.LASFDE6
.LASFDE6:
	.4byte	.Lframe0
	.4byte	.LFB76
	.4byte	.LFE76-.LFB76
	.byte	0x4
	.4byte	.LCFI0-.LFB76
	.byte	0xe
	.uleb128 0x60
	.byte	0x4
	.4byte	.LCFI1-.LCFI0
	.byte	0x9f
	.uleb128 0x7
	.byte	0x96
	.uleb128 0x8
	.byte	0x95
	.uleb128 0x9
	.byte	0x94
	.uleb128 0xa
	.byte	0x93
	.uleb128 0xb
	.byte	0x92
	.uleb128 0xc
	.byte	0x91
	.uleb128 0xd
	.byte	0x90
	.uleb128 0xe
	.byte	0xb5
	.uleb128 0x4
	.byte	0xb4
	.uleb128 0x6
	.align	2
.LEFDE6:
	.section	.text,code
.Letext0:
	.file 2 "c:/program files (x86)/microchip/xc32/v1.44/pic32mx/include/proc/p32mz2048efg100.h"
	.file 3 "c:/program files (x86)/microchip/xc32/v1.44/pic32mx/include/machine/int_types.h"
	.file 4 "e:/7 semester/\353\350\361\345\355\352\356/the-connected-mcu-lab--v1.5-19aug2016-rus/release/code/mplabxprojects/lab11_cache/oled.h"
	.file 5 "e:/7 semester/\353\350\361\345\355\352\356/the-connected-mcu-lab--v1.5-19aug2016-rus/release/code/mplabxprojects/lab11_cache/user.h"
	.file 6 "c:/program files (x86)/microchip/xc32/v1.44/pic32mx/include/stdio.h"
	.section	.debug_info,info
.Ldebug_info0:
	.4byte	0x75b
	.2byte	0x2
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.ascii	"GNU C 4.8.3 MPLAB XC32 Compiler v1.44\000"
	.byte	0x1
	.ascii	"main.c\000"
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
	.2byte	0x30fa
	.4byte	0x190
	.uleb128 0x4
	.ascii	"LATE0\000"
	.byte	0x2
	.2byte	0x30fb
	.4byte	0xae
	.byte	0x4
	.byte	0x1
	.byte	0x1f
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"LATE1\000"
	.byte	0x2
	.2byte	0x30fc
	.4byte	0xae
	.byte	0x4
	.byte	0x1
	.byte	0x1e
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"LATE2\000"
	.byte	0x2
	.2byte	0x30fd
	.4byte	0xae
	.byte	0x4
	.byte	0x1
	.byte	0x1d
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"LATE3\000"
	.byte	0x2
	.2byte	0x30fe
	.4byte	0xae
	.byte	0x4
	.byte	0x1
	.byte	0x1c
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"LATE4\000"
	.byte	0x2
	.2byte	0x30ff
	.4byte	0xae
	.byte	0x4
	.byte	0x1
	.byte	0x1b
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"LATE5\000"
	.byte	0x2
	.2byte	0x3100
	.4byte	0xae
	.byte	0x4
	.byte	0x1
	.byte	0x1a
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"LATE6\000"
	.byte	0x2
	.2byte	0x3101
	.4byte	0xae
	.byte	0x4
	.byte	0x1
	.byte	0x19
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"LATE7\000"
	.byte	0x2
	.2byte	0x3102
	.4byte	0xae
	.byte	0x4
	.byte	0x1
	.byte	0x18
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"LATE8\000"
	.byte	0x2
	.2byte	0x3103
	.4byte	0xae
	.byte	0x4
	.byte	0x1
	.byte	0x17
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x4
	.ascii	"LATE9\000"
	.byte	0x2
	.2byte	0x3104
	.4byte	0xae
	.byte	0x4
	.byte	0x1
	.byte	0x16
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.byte	0
	.uleb128 0x3
	.byte	0x4
	.byte	0x2
	.2byte	0x3106
	.4byte	0x1aa
	.uleb128 0x4
	.ascii	"w\000"
	.byte	0x2
	.2byte	0x3107
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
	.2byte	0x30f9
	.4byte	0x1be
	.uleb128 0x6
	.4byte	0xbe
	.uleb128 0x6
	.4byte	0x190
	.byte	0
	.uleb128 0x7
	.ascii	"__LATEbits_t\000"
	.byte	0x2
	.2byte	0x3109
	.4byte	0x1aa
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
	.4byte	0x21b
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
	.uleb128 0x8
	.ascii	"__int32_t\000"
	.byte	0x3
	.byte	0x32
	.4byte	0x1f4
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
	.4byte	0x20a
	.uleb128 0x9
	.byte	0x4
	.4byte	0x29d
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.ascii	"char\000"
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.ascii	"sizetype\000"
	.uleb128 0xa
	.byte	0x1
	.ascii	"Timed_Array_Test_CR\000"
	.byte	0x1
	.byte	0x20
	.byte	0x1
	.4byte	0xae
	.4byte	.LFB73
	.4byte	.LFE73
	.byte	0x1
	.byte	0x6d
	.byte	0x1
	.4byte	0x34a
	.uleb128 0xb
	.ascii	"nr\000"
	.byte	0x1
	.byte	0x20
	.4byte	0x1f4
	.4byte	.LLST0
	.uleb128 0xc
	.ascii	"nc\000"
	.byte	0x1
	.byte	0x20
	.4byte	0x1f4
	.byte	0x1
	.byte	0x55
	.uleb128 0xb
	.ascii	"a\000"
	.byte	0x1
	.byte	0x20
	.4byte	0x35c
	.4byte	.LLST1
	.uleb128 0xc
	.ascii	"ret_sum\000"
	.byte	0x1
	.byte	0x20
	.4byte	0x362
	.byte	0x1
	.byte	0x57
	.uleb128 0xd
	.ascii	"r\000"
	.byte	0x1
	.byte	0x21
	.4byte	0x1f4
	.4byte	.LLST2
	.uleb128 0xd
	.ascii	"c\000"
	.byte	0x1
	.byte	0x21
	.4byte	0x1f4
	.4byte	.LLST3
	.uleb128 0xd
	.ascii	"sum\000"
	.byte	0x1
	.byte	0x22
	.4byte	0x1f4
	.4byte	.LLST4
	.uleb128 0xe
	.ascii	"t\000"
	.byte	0x1
	.byte	0x23
	.4byte	0xae
	.byte	0x1
	.byte	0x52
	.byte	0
	.uleb128 0xf
	.4byte	0x1f4
	.4byte	0x35c
	.uleb128 0x10
	.4byte	0x2a5
	.byte	0x2
	.byte	0x75
	.sleb128 -1
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.4byte	0x34a
	.uleb128 0x9
	.byte	0x4
	.4byte	0x1f4
	.uleb128 0xa
	.byte	0x1
	.ascii	"Timed_Array_Test_RC\000"
	.byte	0x1
	.byte	0x36
	.byte	0x1
	.4byte	0xae
	.4byte	.LFB74
	.4byte	.LFE74
	.byte	0x1
	.byte	0x6d
	.byte	0x1
	.4byte	0x3ff
	.uleb128 0xb
	.ascii	"nr\000"
	.byte	0x1
	.byte	0x36
	.4byte	0x1f4
	.4byte	.LLST5
	.uleb128 0xc
	.ascii	"nc\000"
	.byte	0x1
	.byte	0x36
	.4byte	0x1f4
	.byte	0x1
	.byte	0x55
	.uleb128 0xc
	.ascii	"a\000"
	.byte	0x1
	.byte	0x36
	.4byte	0x411
	.byte	0x1
	.byte	0x56
	.uleb128 0xc
	.ascii	"ret_sum\000"
	.byte	0x1
	.byte	0x36
	.4byte	0x362
	.byte	0x1
	.byte	0x57
	.uleb128 0xd
	.ascii	"r\000"
	.byte	0x1
	.byte	0x37
	.4byte	0x1f4
	.4byte	.LLST6
	.uleb128 0xd
	.ascii	"c\000"
	.byte	0x1
	.byte	0x37
	.4byte	0x1f4
	.4byte	.LLST7
	.uleb128 0xd
	.ascii	"sum\000"
	.byte	0x1
	.byte	0x38
	.4byte	0x1f4
	.4byte	.LLST8
	.uleb128 0xe
	.ascii	"t\000"
	.byte	0x1
	.byte	0x39
	.4byte	0xae
	.byte	0x1
	.byte	0x52
	.byte	0
	.uleb128 0xf
	.4byte	0x1f4
	.4byte	0x411
	.uleb128 0x10
	.4byte	0x2a5
	.byte	0x2
	.byte	0x75
	.sleb128 -1
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.4byte	0x3ff
	.uleb128 0xa
	.byte	0x1
	.ascii	"Pollute_Cache\000"
	.byte	0x1
	.byte	0x4c
	.byte	0x1
	.4byte	0x1f4
	.4byte	.LFB75
	.4byte	.LFE75
	.byte	0x1
	.byte	0x6d
	.byte	0x1
	.4byte	0x456
	.uleb128 0xd
	.ascii	"i\000"
	.byte	0x1
	.byte	0x4d
	.4byte	0xae
	.4byte	.LLST9
	.uleb128 0x11
	.ascii	"sum\000"
	.byte	0x1
	.byte	0x4e
	.4byte	0x1f4
	.byte	0
	.uleb128 0xa
	.byte	0x1
	.ascii	"main\000"
	.byte	0x1
	.byte	0x55
	.byte	0x1
	.4byte	0x24f
	.4byte	.LFB76
	.4byte	.LFE76
	.byte	0x1
	.byte	0x6d
	.byte	0x1
	.4byte	0x624
	.uleb128 0xd
	.ascii	"t_test\000"
	.byte	0x1
	.byte	0x56
	.4byte	0xae
	.4byte	.LLST10
	.uleb128 0xe
	.ascii	"buffer\000"
	.byte	0x1
	.byte	0x57
	.4byte	0x624
	.byte	0x2
	.byte	0x91
	.sleb128 16
	.uleb128 0xe
	.ascii	"sum\000"
	.byte	0x1
	.byte	0x58
	.4byte	0x1f4
	.byte	0x2
	.byte	0x91
	.sleb128 32
	.uleb128 0x11
	.ascii	"i\000"
	.byte	0x1
	.byte	0x59
	.4byte	0x1f4
	.uleb128 0x12
	.byte	0x1
	.4byte	.LASF0
	.byte	0x1
	.byte	0x5e
	.4byte	0x1f4
	.byte	0x1
	.4byte	0x4c0
	.uleb128 0x13
	.byte	0
	.uleb128 0x12
	.byte	0x1
	.4byte	.LASF1
	.byte	0x1
	.byte	0x5f
	.4byte	0x1f4
	.byte	0x1
	.4byte	0x4d3
	.uleb128 0x13
	.byte	0
	.uleb128 0x14
	.4byte	.LVL25
	.4byte	0x6e4
	.uleb128 0x15
	.4byte	.LVL26
	.4byte	0x6f2
	.4byte	0x4f4
	.uleb128 0x16
	.byte	0x1
	.byte	0x55
	.byte	0x1
	.byte	0x30
	.uleb128 0x16
	.byte	0x1
	.byte	0x54
	.byte	0x1
	.byte	0x30
	.byte	0
	.uleb128 0x15
	.4byte	.LVL27
	.4byte	0x705
	.4byte	0x50b
	.uleb128 0x16
	.byte	0x1
	.byte	0x54
	.byte	0x5
	.byte	0x3
	.4byte	.LC0
	.byte	0
	.uleb128 0x15
	.4byte	.LVL28
	.4byte	0x718
	.4byte	0x520
	.uleb128 0x16
	.byte	0x1
	.byte	0x54
	.byte	0x3
	.byte	0xa
	.2byte	0x1f4
	.byte	0
	.uleb128 0x15
	.4byte	.LVL30
	.4byte	0x730
	.4byte	0x544
	.uleb128 0x16
	.byte	0x1
	.byte	0x57
	.byte	0x1
	.byte	0x40
	.uleb128 0x16
	.byte	0x1
	.byte	0x56
	.byte	0x1
	.byte	0x40
	.uleb128 0x16
	.byte	0x1
	.byte	0x55
	.byte	0x2
	.byte	0x86
	.sleb128 0
	.uleb128 0x16
	.byte	0x1
	.byte	0x54
	.byte	0x2
	.byte	0x91
	.sleb128 16
	.byte	0
	.uleb128 0x15
	.4byte	.LVL31
	.4byte	0x6f2
	.4byte	0x55c
	.uleb128 0x16
	.byte	0x1
	.byte	0x55
	.byte	0x1
	.byte	0x31
	.uleb128 0x16
	.byte	0x1
	.byte	0x54
	.byte	0x1
	.byte	0x30
	.byte	0
	.uleb128 0x15
	.4byte	.LVL32
	.4byte	0x705
	.4byte	0x570
	.uleb128 0x16
	.byte	0x1
	.byte	0x54
	.byte	0x2
	.byte	0x91
	.sleb128 16
	.byte	0
	.uleb128 0x15
	.4byte	.LVL33
	.4byte	0x2b1
	.4byte	0x594
	.uleb128 0x16
	.byte	0x1
	.byte	0x57
	.byte	0x2
	.byte	0x91
	.sleb128 32
	.uleb128 0x16
	.byte	0x1
	.byte	0x56
	.byte	0x2
	.byte	0x85
	.sleb128 0
	.uleb128 0x16
	.byte	0x1
	.byte	0x55
	.byte	0x1
	.byte	0x40
	.uleb128 0x16
	.byte	0x1
	.byte	0x54
	.byte	0x1
	.byte	0x40
	.byte	0
	.uleb128 0x15
	.4byte	.LVL35
	.4byte	0x730
	.4byte	0x5b4
	.uleb128 0x16
	.byte	0x1
	.byte	0x56
	.byte	0x2
	.byte	0x82
	.sleb128 0
	.uleb128 0x16
	.byte	0x1
	.byte	0x55
	.byte	0x2
	.byte	0x84
	.sleb128 0
	.uleb128 0x16
	.byte	0x1
	.byte	0x54
	.byte	0x2
	.byte	0x91
	.sleb128 16
	.byte	0
	.uleb128 0x15
	.4byte	.LVL36
	.4byte	0x6f2
	.4byte	0x5cc
	.uleb128 0x16
	.byte	0x1
	.byte	0x55
	.byte	0x1
	.byte	0x32
	.uleb128 0x16
	.byte	0x1
	.byte	0x54
	.byte	0x1
	.byte	0x30
	.byte	0
	.uleb128 0x15
	.4byte	.LVL37
	.4byte	0x705
	.4byte	0x5e0
	.uleb128 0x16
	.byte	0x1
	.byte	0x54
	.byte	0x2
	.byte	0x91
	.sleb128 16
	.byte	0
	.uleb128 0x15
	.4byte	.LVL38
	.4byte	0x730
	.4byte	0x5fa
	.uleb128 0x16
	.byte	0x1
	.byte	0x55
	.byte	0x2
	.byte	0x83
	.sleb128 0
	.uleb128 0x16
	.byte	0x1
	.byte	0x54
	.byte	0x2
	.byte	0x91
	.sleb128 16
	.byte	0
	.uleb128 0x15
	.4byte	.LVL39
	.4byte	0x6f2
	.4byte	0x613
	.uleb128 0x16
	.byte	0x1
	.byte	0x55
	.byte	0x1
	.byte	0x33
	.uleb128 0x16
	.byte	0x1
	.byte	0x54
	.byte	0x2
	.byte	0x81
	.sleb128 0
	.byte	0
	.uleb128 0x17
	.4byte	.LVL40
	.4byte	0x705
	.uleb128 0x16
	.byte	0x1
	.byte	0x54
	.byte	0x2
	.byte	0x91
	.sleb128 16
	.byte	0
	.byte	0
	.uleb128 0xf
	.4byte	0x29d
	.4byte	0x634
	.uleb128 0x18
	.4byte	0x2a5
	.byte	0xf
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.byte	0x4
	.ascii	"float\000"
	.uleb128 0x19
	.ascii	"TMR2\000"
	.byte	0x2
	.2byte	0x2226
	.4byte	0x64c
	.byte	0x1
	.byte	0x1
	.uleb128 0x1a
	.4byte	0xae
	.uleb128 0x1b
	.ascii	"LATEbits\000"
	.byte	0x2
	.2byte	0x310a
	.ascii	"LATE\000"
	.4byte	0x669
	.byte	0x1
	.byte	0x1
	.uleb128 0x1a
	.4byte	0x1be
	.uleb128 0xf
	.4byte	0x28b
	.4byte	0x67f
	.uleb128 0x1c
	.4byte	0x2a5
	.2byte	0x1ff
	.byte	0
	.uleb128 0x1d
	.ascii	"rgbOledBmp\000"
	.byte	0x4
	.byte	0x68
	.4byte	0x66e
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.4byte	rgbOledBmp
	.uleb128 0xf
	.4byte	0x1f4
	.4byte	0x6a9
	.uleb128 0x1c
	.4byte	0x2a5
	.2byte	0x3ff
	.byte	0
	.uleb128 0x1d
	.ascii	"dummy\000"
	.byte	0x1
	.byte	0x19
	.4byte	0x698
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.4byte	dummy
	.uleb128 0xf
	.4byte	0x1f4
	.4byte	0x6d3
	.uleb128 0x18
	.4byte	0x2a5
	.byte	0xf
	.uleb128 0x18
	.4byte	0x2a5
	.byte	0xf
	.byte	0
	.uleb128 0x1d
	.ascii	"aa\000"
	.byte	0x1
	.byte	0x1a
	.4byte	0x6bd
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.4byte	aa
	.uleb128 0x1e
	.byte	0x1
	.ascii	"InitApp\000"
	.byte	0x5
	.byte	0x30
	.byte	0x1
	.byte	0x1
	.uleb128 0x12
	.byte	0x1
	.4byte	.LASF0
	.byte	0x1
	.byte	0x5e
	.4byte	0x1f4
	.byte	0x1
	.4byte	0x705
	.uleb128 0x13
	.byte	0
	.uleb128 0x12
	.byte	0x1
	.4byte	.LASF1
	.byte	0x1
	.byte	0x5f
	.4byte	0x1f4
	.byte	0x1
	.4byte	0x718
	.uleb128 0x13
	.byte	0
	.uleb128 0x1f
	.byte	0x1
	.ascii	"DelayMs\000"
	.byte	0x5
	.byte	0x31
	.byte	0x1
	.byte	0x1
	.4byte	0x730
	.uleb128 0x20
	.4byte	0x1f4
	.byte	0
	.uleb128 0x21
	.byte	0x1
	.ascii	"sprintf\000"
	.byte	0x6
	.2byte	0x187
	.byte	0x1
	.4byte	0x1f4
	.byte	0x1
	.4byte	0x753
	.uleb128 0x20
	.4byte	0x297
	.uleb128 0x20
	.4byte	0x753
	.uleb128 0x13
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.4byte	0x759
	.uleb128 0x22
	.4byte	0x29d
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
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
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
	.uleb128 0xb
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
	.uleb128 0xc
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
	.uleb128 0xd
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
	.uleb128 0xe
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
	.uleb128 0xf
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xa
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
	.byte	0
	.byte	0
	.uleb128 0x12
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
	.uleb128 0x13
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
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
	.uleb128 0x16
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0xa
	.uleb128 0x2111
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
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
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0x1d
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
	.uleb128 0x1e
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
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0x1f
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
	.uleb128 0x20
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x22
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,info
.Ldebug_loc0:
.LLST0:
	.4byte	.LVL0-.Ltext0
	.4byte	.LVL9-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL9-.Ltext0
	.4byte	.LFE73-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST1:
	.4byte	.LVL0-.Ltext0
	.4byte	.LVL2-.Ltext0
	.2byte	0x1
	.byte	0x56
	.4byte	.LVL2-.Ltext0
	.4byte	.LFE73-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x56
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST2:
	.4byte	.LVL1-.Ltext0
	.4byte	.LVL2-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL2-.Ltext0
	.4byte	.LFE73-.Ltext0
	.2byte	0x1
	.byte	0x5a
	.4byte	0
	.4byte	0
.LLST3:
	.4byte	.LVL2-.Ltext0
	.4byte	.LVL3-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL3-.Ltext0
	.4byte	.LVL7-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	0
	.4byte	0
.LLST4:
	.4byte	.LVL0-.Ltext0
	.4byte	.LVL2-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL2-.Ltext0
	.4byte	.LFE73-.Ltext0
	.2byte	0x1
	.byte	0x58
	.4byte	0
	.4byte	0
.LLST5:
	.4byte	.LVL10-.Ltext0
	.4byte	.LVL19-.Ltext0
	.2byte	0x1
	.byte	0x54
	.4byte	.LVL19-.Ltext0
	.4byte	.LFE74-.Ltext0
	.2byte	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x54
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST6:
	.4byte	.LVL12-.Ltext0
	.4byte	.LVL13-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL13-.Ltext0
	.4byte	.LVL17-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	0
	.4byte	0
.LLST7:
	.4byte	.LVL11-.Ltext0
	.4byte	.LVL12-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL12-.Ltext0
	.4byte	.LFE74-.Ltext0
	.2byte	0x1
	.byte	0x5c
	.4byte	0
	.4byte	0
.LLST8:
	.4byte	.LVL10-.Ltext0
	.4byte	.LVL12-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL12-.Ltext0
	.4byte	.LFE74-.Ltext0
	.2byte	0x1
	.byte	0x58
	.4byte	0
	.4byte	0
.LLST9:
	.4byte	.LVL20-.Ltext0
	.4byte	.LVL21-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL21-.Ltext0
	.4byte	.LVL22-.Ltext0
	.2byte	0x7
	.byte	0xa
	.2byte	0x401
	.byte	0x72
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.4byte	.LVL22-.Ltext0
	.4byte	.LVL23-.Ltext0
	.2byte	0x7
	.byte	0xa
	.2byte	0x400
	.byte	0x72
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.4byte	0
	.4byte	0
.LLST10:
	.4byte	.LVL24-.Ltext0
	.4byte	.LVL29-.Ltext0
	.2byte	0x2
	.byte	0x30
	.byte	0x9f
	.4byte	.LVL34-.Ltext0
	.4byte	.LVL35-1-.Ltext0
	.2byte	0x1
	.byte	0x52
	.4byte	.LVL35-1-.Ltext0
	.4byte	.LFE76-.Ltext0
	.2byte	0x1
	.byte	0x62
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
.LASF0:
	.ascii	"OledSetCursor\000"
.LASF1:
	.ascii	"OledPutString\000"
	.ident	"GCC: (Microchip Technology) 4.8.3 MPLAB XC32 Compiler v1.44"
# Begin MCHP vector dispatch table
# End MCHP vector dispatch table
# Microchip Technology PIC32 MCU configuration words
