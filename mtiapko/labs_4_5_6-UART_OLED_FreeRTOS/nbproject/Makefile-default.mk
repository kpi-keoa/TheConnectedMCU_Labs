#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/Wolf3D.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/Wolf3D.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

ifdef SUB_IMAGE_ADDRESS

else
SUB_IMAGE_ADDRESS_COMMAND=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=src/common.c src/ConfigPerformance.c src/configuration_bits.c src/FreeRTOS/croutine.c src/FreeRTOS/event_groups.c src/FreeRTOS/list.c src/FreeRTOS/portable/port.c src/FreeRTOS/queue.c src/FreeRTOS/stream_buffer.c src/FreeRTOS/tasks.c src/FreeRTOS/timers.c src/input.c src/main.c src/memset_zero.c src/OLED/char_font.c src/OLED/fill_pattern.c src/OLED/OLED.c src/OLED/OLED_char.c src/OLED/OLED_graphic.c src/OLED/SPI.c src/pin.c src/print.c src/ray_cast.c src/UART.c src/window.c src/wolf3d.c asm/portable/port_asm.S src/mem_manager.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/src/common.o ${OBJECTDIR}/src/ConfigPerformance.o ${OBJECTDIR}/src/configuration_bits.o ${OBJECTDIR}/src/FreeRTOS/croutine.o ${OBJECTDIR}/src/FreeRTOS/event_groups.o ${OBJECTDIR}/src/FreeRTOS/list.o ${OBJECTDIR}/src/FreeRTOS/portable/port.o ${OBJECTDIR}/src/FreeRTOS/queue.o ${OBJECTDIR}/src/FreeRTOS/stream_buffer.o ${OBJECTDIR}/src/FreeRTOS/tasks.o ${OBJECTDIR}/src/FreeRTOS/timers.o ${OBJECTDIR}/src/input.o ${OBJECTDIR}/src/main.o ${OBJECTDIR}/src/memset_zero.o ${OBJECTDIR}/src/OLED/char_font.o ${OBJECTDIR}/src/OLED/fill_pattern.o ${OBJECTDIR}/src/OLED/OLED.o ${OBJECTDIR}/src/OLED/OLED_char.o ${OBJECTDIR}/src/OLED/OLED_graphic.o ${OBJECTDIR}/src/OLED/SPI.o ${OBJECTDIR}/src/pin.o ${OBJECTDIR}/src/print.o ${OBJECTDIR}/src/ray_cast.o ${OBJECTDIR}/src/UART.o ${OBJECTDIR}/src/window.o ${OBJECTDIR}/src/wolf3d.o ${OBJECTDIR}/asm/portable/port_asm.o ${OBJECTDIR}/src/mem_manager.o
POSSIBLE_DEPFILES=${OBJECTDIR}/src/common.o.d ${OBJECTDIR}/src/ConfigPerformance.o.d ${OBJECTDIR}/src/configuration_bits.o.d ${OBJECTDIR}/src/FreeRTOS/croutine.o.d ${OBJECTDIR}/src/FreeRTOS/event_groups.o.d ${OBJECTDIR}/src/FreeRTOS/list.o.d ${OBJECTDIR}/src/FreeRTOS/portable/port.o.d ${OBJECTDIR}/src/FreeRTOS/queue.o.d ${OBJECTDIR}/src/FreeRTOS/stream_buffer.o.d ${OBJECTDIR}/src/FreeRTOS/tasks.o.d ${OBJECTDIR}/src/FreeRTOS/timers.o.d ${OBJECTDIR}/src/input.o.d ${OBJECTDIR}/src/main.o.d ${OBJECTDIR}/src/memset_zero.o.d ${OBJECTDIR}/src/OLED/char_font.o.d ${OBJECTDIR}/src/OLED/fill_pattern.o.d ${OBJECTDIR}/src/OLED/OLED.o.d ${OBJECTDIR}/src/OLED/OLED_char.o.d ${OBJECTDIR}/src/OLED/OLED_graphic.o.d ${OBJECTDIR}/src/OLED/SPI.o.d ${OBJECTDIR}/src/pin.o.d ${OBJECTDIR}/src/print.o.d ${OBJECTDIR}/src/ray_cast.o.d ${OBJECTDIR}/src/UART.o.d ${OBJECTDIR}/src/window.o.d ${OBJECTDIR}/src/wolf3d.o.d ${OBJECTDIR}/asm/portable/port_asm.o.d ${OBJECTDIR}/src/mem_manager.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/src/common.o ${OBJECTDIR}/src/ConfigPerformance.o ${OBJECTDIR}/src/configuration_bits.o ${OBJECTDIR}/src/FreeRTOS/croutine.o ${OBJECTDIR}/src/FreeRTOS/event_groups.o ${OBJECTDIR}/src/FreeRTOS/list.o ${OBJECTDIR}/src/FreeRTOS/portable/port.o ${OBJECTDIR}/src/FreeRTOS/queue.o ${OBJECTDIR}/src/FreeRTOS/stream_buffer.o ${OBJECTDIR}/src/FreeRTOS/tasks.o ${OBJECTDIR}/src/FreeRTOS/timers.o ${OBJECTDIR}/src/input.o ${OBJECTDIR}/src/main.o ${OBJECTDIR}/src/memset_zero.o ${OBJECTDIR}/src/OLED/char_font.o ${OBJECTDIR}/src/OLED/fill_pattern.o ${OBJECTDIR}/src/OLED/OLED.o ${OBJECTDIR}/src/OLED/OLED_char.o ${OBJECTDIR}/src/OLED/OLED_graphic.o ${OBJECTDIR}/src/OLED/SPI.o ${OBJECTDIR}/src/pin.o ${OBJECTDIR}/src/print.o ${OBJECTDIR}/src/ray_cast.o ${OBJECTDIR}/src/UART.o ${OBJECTDIR}/src/window.o ${OBJECTDIR}/src/wolf3d.o ${OBJECTDIR}/asm/portable/port_asm.o ${OBJECTDIR}/src/mem_manager.o

# Source Files
SOURCEFILES=src/common.c src/ConfigPerformance.c src/configuration_bits.c src/FreeRTOS/croutine.c src/FreeRTOS/event_groups.c src/FreeRTOS/list.c src/FreeRTOS/portable/port.c src/FreeRTOS/queue.c src/FreeRTOS/stream_buffer.c src/FreeRTOS/tasks.c src/FreeRTOS/timers.c src/input.c src/main.c src/memset_zero.c src/OLED/char_font.c src/OLED/fill_pattern.c src/OLED/OLED.c src/OLED/OLED_char.c src/OLED/OLED_graphic.c src/OLED/SPI.c src/pin.c src/print.c src/ray_cast.c src/UART.c src/window.c src/wolf3d.c asm/portable/port_asm.S src/mem_manager.c


CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/Wolf3D.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=32MZ2048EFG100
MP_LINKER_FILE_OPTION=
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/asm/portable/port_asm.o: asm/portable/port_asm.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/asm/portable" 
	@${RM} ${OBJECTDIR}/asm/portable/port_asm.o.d 
	@${RM} ${OBJECTDIR}/asm/portable/port_asm.o 
	@${RM} ${OBJECTDIR}/asm/portable/port_asm.o.ok ${OBJECTDIR}/asm/portable/port_asm.o.err 
	@${FIXDEPS} "${OBJECTDIR}/asm/portable/port_asm.o.d" "${OBJECTDIR}/asm/portable/port_asm.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/asm/portable/port_asm.o.d"  -o ${OBJECTDIR}/asm/portable/port_asm.o asm/portable/port_asm.S  -DXPRJ_default=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/asm/portable/port_asm.o.asm.d",--defsym=__MPLAB_DEBUG=1,--gdwarf-2,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_SIMULATOR=1 -I./include -I./include/FreeRTOS -I./include/FreeRTOS/portable
	
else
${OBJECTDIR}/asm/portable/port_asm.o: asm/portable/port_asm.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/asm/portable" 
	@${RM} ${OBJECTDIR}/asm/portable/port_asm.o.d 
	@${RM} ${OBJECTDIR}/asm/portable/port_asm.o 
	@${RM} ${OBJECTDIR}/asm/portable/port_asm.o.ok ${OBJECTDIR}/asm/portable/port_asm.o.err 
	@${FIXDEPS} "${OBJECTDIR}/asm/portable/port_asm.o.d" "${OBJECTDIR}/asm/portable/port_asm.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/asm/portable/port_asm.o.d"  -o ${OBJECTDIR}/asm/portable/port_asm.o asm/portable/port_asm.S  -DXPRJ_default=$(CND_CONF)  -legacy-libc  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/asm/portable/port_asm.o.asm.d",--gdwarf-2 -I./include -I./include/FreeRTOS -I./include/FreeRTOS/portable
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/src/common.o: src/common.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/common.o.d 
	@${RM} ${OBJECTDIR}/src/common.o 
	@${FIXDEPS} "${OBJECTDIR}/src/common.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/src/common.o.d" -o ${OBJECTDIR}/src/common.o src/common.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=c99 -I./include -I./include/OLED -I./include/FreeRTOS -I./include/FreeRTOS/portable
	
${OBJECTDIR}/src/ConfigPerformance.o: src/ConfigPerformance.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/ConfigPerformance.o.d 
	@${RM} ${OBJECTDIR}/src/ConfigPerformance.o 
	@${FIXDEPS} "${OBJECTDIR}/src/ConfigPerformance.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/src/ConfigPerformance.o.d" -o ${OBJECTDIR}/src/ConfigPerformance.o src/ConfigPerformance.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=c99 -I./include -I./include/OLED -I./include/FreeRTOS -I./include/FreeRTOS/portable
	
${OBJECTDIR}/src/configuration_bits.o: src/configuration_bits.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/configuration_bits.o.d 
	@${RM} ${OBJECTDIR}/src/configuration_bits.o 
	@${FIXDEPS} "${OBJECTDIR}/src/configuration_bits.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/src/configuration_bits.o.d" -o ${OBJECTDIR}/src/configuration_bits.o src/configuration_bits.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=c99 -I./include -I./include/OLED -I./include/FreeRTOS -I./include/FreeRTOS/portable
	
${OBJECTDIR}/src/FreeRTOS/croutine.o: src/FreeRTOS/croutine.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src/FreeRTOS" 
	@${RM} ${OBJECTDIR}/src/FreeRTOS/croutine.o.d 
	@${RM} ${OBJECTDIR}/src/FreeRTOS/croutine.o 
	@${FIXDEPS} "${OBJECTDIR}/src/FreeRTOS/croutine.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/src/FreeRTOS/croutine.o.d" -o ${OBJECTDIR}/src/FreeRTOS/croutine.o src/FreeRTOS/croutine.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=c99 -I./include -I./include/OLED -I./include/FreeRTOS -I./include/FreeRTOS/portable
	
${OBJECTDIR}/src/FreeRTOS/event_groups.o: src/FreeRTOS/event_groups.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src/FreeRTOS" 
	@${RM} ${OBJECTDIR}/src/FreeRTOS/event_groups.o.d 
	@${RM} ${OBJECTDIR}/src/FreeRTOS/event_groups.o 
	@${FIXDEPS} "${OBJECTDIR}/src/FreeRTOS/event_groups.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/src/FreeRTOS/event_groups.o.d" -o ${OBJECTDIR}/src/FreeRTOS/event_groups.o src/FreeRTOS/event_groups.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=c99 -I./include -I./include/OLED -I./include/FreeRTOS -I./include/FreeRTOS/portable
	
${OBJECTDIR}/src/FreeRTOS/list.o: src/FreeRTOS/list.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src/FreeRTOS" 
	@${RM} ${OBJECTDIR}/src/FreeRTOS/list.o.d 
	@${RM} ${OBJECTDIR}/src/FreeRTOS/list.o 
	@${FIXDEPS} "${OBJECTDIR}/src/FreeRTOS/list.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/src/FreeRTOS/list.o.d" -o ${OBJECTDIR}/src/FreeRTOS/list.o src/FreeRTOS/list.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=c99 -I./include -I./include/OLED -I./include/FreeRTOS -I./include/FreeRTOS/portable
	
${OBJECTDIR}/src/FreeRTOS/portable/port.o: src/FreeRTOS/portable/port.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src/FreeRTOS/portable" 
	@${RM} ${OBJECTDIR}/src/FreeRTOS/portable/port.o.d 
	@${RM} ${OBJECTDIR}/src/FreeRTOS/portable/port.o 
	@${FIXDEPS} "${OBJECTDIR}/src/FreeRTOS/portable/port.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/src/FreeRTOS/portable/port.o.d" -o ${OBJECTDIR}/src/FreeRTOS/portable/port.o src/FreeRTOS/portable/port.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=c99 -I./include -I./include/OLED -I./include/FreeRTOS -I./include/FreeRTOS/portable
	
${OBJECTDIR}/src/FreeRTOS/queue.o: src/FreeRTOS/queue.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src/FreeRTOS" 
	@${RM} ${OBJECTDIR}/src/FreeRTOS/queue.o.d 
	@${RM} ${OBJECTDIR}/src/FreeRTOS/queue.o 
	@${FIXDEPS} "${OBJECTDIR}/src/FreeRTOS/queue.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/src/FreeRTOS/queue.o.d" -o ${OBJECTDIR}/src/FreeRTOS/queue.o src/FreeRTOS/queue.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=c99 -I./include -I./include/OLED -I./include/FreeRTOS -I./include/FreeRTOS/portable
	
${OBJECTDIR}/src/FreeRTOS/stream_buffer.o: src/FreeRTOS/stream_buffer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src/FreeRTOS" 
	@${RM} ${OBJECTDIR}/src/FreeRTOS/stream_buffer.o.d 
	@${RM} ${OBJECTDIR}/src/FreeRTOS/stream_buffer.o 
	@${FIXDEPS} "${OBJECTDIR}/src/FreeRTOS/stream_buffer.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/src/FreeRTOS/stream_buffer.o.d" -o ${OBJECTDIR}/src/FreeRTOS/stream_buffer.o src/FreeRTOS/stream_buffer.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=c99 -I./include -I./include/OLED -I./include/FreeRTOS -I./include/FreeRTOS/portable
	
${OBJECTDIR}/src/FreeRTOS/tasks.o: src/FreeRTOS/tasks.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src/FreeRTOS" 
	@${RM} ${OBJECTDIR}/src/FreeRTOS/tasks.o.d 
	@${RM} ${OBJECTDIR}/src/FreeRTOS/tasks.o 
	@${FIXDEPS} "${OBJECTDIR}/src/FreeRTOS/tasks.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/src/FreeRTOS/tasks.o.d" -o ${OBJECTDIR}/src/FreeRTOS/tasks.o src/FreeRTOS/tasks.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=c99 -I./include -I./include/OLED -I./include/FreeRTOS -I./include/FreeRTOS/portable
	
${OBJECTDIR}/src/FreeRTOS/timers.o: src/FreeRTOS/timers.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src/FreeRTOS" 
	@${RM} ${OBJECTDIR}/src/FreeRTOS/timers.o.d 
	@${RM} ${OBJECTDIR}/src/FreeRTOS/timers.o 
	@${FIXDEPS} "${OBJECTDIR}/src/FreeRTOS/timers.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/src/FreeRTOS/timers.o.d" -o ${OBJECTDIR}/src/FreeRTOS/timers.o src/FreeRTOS/timers.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=c99 -I./include -I./include/OLED -I./include/FreeRTOS -I./include/FreeRTOS/portable
	
${OBJECTDIR}/src/input.o: src/input.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/input.o.d 
	@${RM} ${OBJECTDIR}/src/input.o 
	@${FIXDEPS} "${OBJECTDIR}/src/input.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/src/input.o.d" -o ${OBJECTDIR}/src/input.o src/input.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=c99 -I./include -I./include/OLED -I./include/FreeRTOS -I./include/FreeRTOS/portable
	
${OBJECTDIR}/src/main.o: src/main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/main.o.d 
	@${RM} ${OBJECTDIR}/src/main.o 
	@${FIXDEPS} "${OBJECTDIR}/src/main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/src/main.o.d" -o ${OBJECTDIR}/src/main.o src/main.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=c99 -I./include -I./include/OLED -I./include/FreeRTOS -I./include/FreeRTOS/portable
	
${OBJECTDIR}/src/memset_zero.o: src/memset_zero.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/memset_zero.o.d 
	@${RM} ${OBJECTDIR}/src/memset_zero.o 
	@${FIXDEPS} "${OBJECTDIR}/src/memset_zero.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/src/memset_zero.o.d" -o ${OBJECTDIR}/src/memset_zero.o src/memset_zero.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=c99 -I./include -I./include/OLED -I./include/FreeRTOS -I./include/FreeRTOS/portable
	
${OBJECTDIR}/src/OLED/char_font.o: src/OLED/char_font.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src/OLED" 
	@${RM} ${OBJECTDIR}/src/OLED/char_font.o.d 
	@${RM} ${OBJECTDIR}/src/OLED/char_font.o 
	@${FIXDEPS} "${OBJECTDIR}/src/OLED/char_font.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/src/OLED/char_font.o.d" -o ${OBJECTDIR}/src/OLED/char_font.o src/OLED/char_font.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=c99 -I./include -I./include/OLED -I./include/FreeRTOS -I./include/FreeRTOS/portable
	
${OBJECTDIR}/src/OLED/fill_pattern.o: src/OLED/fill_pattern.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src/OLED" 
	@${RM} ${OBJECTDIR}/src/OLED/fill_pattern.o.d 
	@${RM} ${OBJECTDIR}/src/OLED/fill_pattern.o 
	@${FIXDEPS} "${OBJECTDIR}/src/OLED/fill_pattern.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/src/OLED/fill_pattern.o.d" -o ${OBJECTDIR}/src/OLED/fill_pattern.o src/OLED/fill_pattern.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=c99 -I./include -I./include/OLED -I./include/FreeRTOS -I./include/FreeRTOS/portable
	
${OBJECTDIR}/src/OLED/OLED.o: src/OLED/OLED.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src/OLED" 
	@${RM} ${OBJECTDIR}/src/OLED/OLED.o.d 
	@${RM} ${OBJECTDIR}/src/OLED/OLED.o 
	@${FIXDEPS} "${OBJECTDIR}/src/OLED/OLED.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/src/OLED/OLED.o.d" -o ${OBJECTDIR}/src/OLED/OLED.o src/OLED/OLED.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=c99 -I./include -I./include/OLED -I./include/FreeRTOS -I./include/FreeRTOS/portable
	
${OBJECTDIR}/src/OLED/OLED_char.o: src/OLED/OLED_char.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src/OLED" 
	@${RM} ${OBJECTDIR}/src/OLED/OLED_char.o.d 
	@${RM} ${OBJECTDIR}/src/OLED/OLED_char.o 
	@${FIXDEPS} "${OBJECTDIR}/src/OLED/OLED_char.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/src/OLED/OLED_char.o.d" -o ${OBJECTDIR}/src/OLED/OLED_char.o src/OLED/OLED_char.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=c99 -I./include -I./include/OLED -I./include/FreeRTOS -I./include/FreeRTOS/portable
	
${OBJECTDIR}/src/OLED/OLED_graphic.o: src/OLED/OLED_graphic.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src/OLED" 
	@${RM} ${OBJECTDIR}/src/OLED/OLED_graphic.o.d 
	@${RM} ${OBJECTDIR}/src/OLED/OLED_graphic.o 
	@${FIXDEPS} "${OBJECTDIR}/src/OLED/OLED_graphic.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/src/OLED/OLED_graphic.o.d" -o ${OBJECTDIR}/src/OLED/OLED_graphic.o src/OLED/OLED_graphic.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=c99 -I./include -I./include/OLED -I./include/FreeRTOS -I./include/FreeRTOS/portable
	
${OBJECTDIR}/src/OLED/SPI.o: src/OLED/SPI.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src/OLED" 
	@${RM} ${OBJECTDIR}/src/OLED/SPI.o.d 
	@${RM} ${OBJECTDIR}/src/OLED/SPI.o 
	@${FIXDEPS} "${OBJECTDIR}/src/OLED/SPI.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/src/OLED/SPI.o.d" -o ${OBJECTDIR}/src/OLED/SPI.o src/OLED/SPI.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=c99 -I./include -I./include/OLED -I./include/FreeRTOS -I./include/FreeRTOS/portable
	
${OBJECTDIR}/src/pin.o: src/pin.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/pin.o.d 
	@${RM} ${OBJECTDIR}/src/pin.o 
	@${FIXDEPS} "${OBJECTDIR}/src/pin.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/src/pin.o.d" -o ${OBJECTDIR}/src/pin.o src/pin.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=c99 -I./include -I./include/OLED -I./include/FreeRTOS -I./include/FreeRTOS/portable
	
${OBJECTDIR}/src/print.o: src/print.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/print.o.d 
	@${RM} ${OBJECTDIR}/src/print.o 
	@${FIXDEPS} "${OBJECTDIR}/src/print.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/src/print.o.d" -o ${OBJECTDIR}/src/print.o src/print.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=c99 -I./include -I./include/OLED -I./include/FreeRTOS -I./include/FreeRTOS/portable
	
${OBJECTDIR}/src/ray_cast.o: src/ray_cast.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/ray_cast.o.d 
	@${RM} ${OBJECTDIR}/src/ray_cast.o 
	@${FIXDEPS} "${OBJECTDIR}/src/ray_cast.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/src/ray_cast.o.d" -o ${OBJECTDIR}/src/ray_cast.o src/ray_cast.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=c99 -I./include -I./include/OLED -I./include/FreeRTOS -I./include/FreeRTOS/portable
	
${OBJECTDIR}/src/UART.o: src/UART.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/UART.o.d 
	@${RM} ${OBJECTDIR}/src/UART.o 
	@${FIXDEPS} "${OBJECTDIR}/src/UART.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/src/UART.o.d" -o ${OBJECTDIR}/src/UART.o src/UART.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=c99 -I./include -I./include/OLED -I./include/FreeRTOS -I./include/FreeRTOS/portable
	
${OBJECTDIR}/src/window.o: src/window.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/window.o.d 
	@${RM} ${OBJECTDIR}/src/window.o 
	@${FIXDEPS} "${OBJECTDIR}/src/window.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/src/window.o.d" -o ${OBJECTDIR}/src/window.o src/window.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=c99 -I./include -I./include/OLED -I./include/FreeRTOS -I./include/FreeRTOS/portable
	
${OBJECTDIR}/src/wolf3d.o: src/wolf3d.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/wolf3d.o.d 
	@${RM} ${OBJECTDIR}/src/wolf3d.o 
	@${FIXDEPS} "${OBJECTDIR}/src/wolf3d.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/src/wolf3d.o.d" -o ${OBJECTDIR}/src/wolf3d.o src/wolf3d.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=c99 -I./include -I./include/OLED -I./include/FreeRTOS -I./include/FreeRTOS/portable
	
${OBJECTDIR}/src/mem_manager.o: src/mem_manager.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/mem_manager.o.d 
	@${RM} ${OBJECTDIR}/src/mem_manager.o 
	@${FIXDEPS} "${OBJECTDIR}/src/mem_manager.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1  -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/src/mem_manager.o.d" -o ${OBJECTDIR}/src/mem_manager.o src/mem_manager.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=c99 -I./include -I./include/OLED -I./include/FreeRTOS -I./include/FreeRTOS/portable
	
else
${OBJECTDIR}/src/common.o: src/common.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/common.o.d 
	@${RM} ${OBJECTDIR}/src/common.o 
	@${FIXDEPS} "${OBJECTDIR}/src/common.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/src/common.o.d" -o ${OBJECTDIR}/src/common.o src/common.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=c99 -I./include -I./include/OLED -I./include/FreeRTOS -I./include/FreeRTOS/portable
	
${OBJECTDIR}/src/ConfigPerformance.o: src/ConfigPerformance.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/ConfigPerformance.o.d 
	@${RM} ${OBJECTDIR}/src/ConfigPerformance.o 
	@${FIXDEPS} "${OBJECTDIR}/src/ConfigPerformance.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/src/ConfigPerformance.o.d" -o ${OBJECTDIR}/src/ConfigPerformance.o src/ConfigPerformance.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=c99 -I./include -I./include/OLED -I./include/FreeRTOS -I./include/FreeRTOS/portable
	
${OBJECTDIR}/src/configuration_bits.o: src/configuration_bits.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/configuration_bits.o.d 
	@${RM} ${OBJECTDIR}/src/configuration_bits.o 
	@${FIXDEPS} "${OBJECTDIR}/src/configuration_bits.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/src/configuration_bits.o.d" -o ${OBJECTDIR}/src/configuration_bits.o src/configuration_bits.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=c99 -I./include -I./include/OLED -I./include/FreeRTOS -I./include/FreeRTOS/portable
	
${OBJECTDIR}/src/FreeRTOS/croutine.o: src/FreeRTOS/croutine.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src/FreeRTOS" 
	@${RM} ${OBJECTDIR}/src/FreeRTOS/croutine.o.d 
	@${RM} ${OBJECTDIR}/src/FreeRTOS/croutine.o 
	@${FIXDEPS} "${OBJECTDIR}/src/FreeRTOS/croutine.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/src/FreeRTOS/croutine.o.d" -o ${OBJECTDIR}/src/FreeRTOS/croutine.o src/FreeRTOS/croutine.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=c99 -I./include -I./include/OLED -I./include/FreeRTOS -I./include/FreeRTOS/portable
	
${OBJECTDIR}/src/FreeRTOS/event_groups.o: src/FreeRTOS/event_groups.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src/FreeRTOS" 
	@${RM} ${OBJECTDIR}/src/FreeRTOS/event_groups.o.d 
	@${RM} ${OBJECTDIR}/src/FreeRTOS/event_groups.o 
	@${FIXDEPS} "${OBJECTDIR}/src/FreeRTOS/event_groups.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/src/FreeRTOS/event_groups.o.d" -o ${OBJECTDIR}/src/FreeRTOS/event_groups.o src/FreeRTOS/event_groups.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=c99 -I./include -I./include/OLED -I./include/FreeRTOS -I./include/FreeRTOS/portable
	
${OBJECTDIR}/src/FreeRTOS/list.o: src/FreeRTOS/list.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src/FreeRTOS" 
	@${RM} ${OBJECTDIR}/src/FreeRTOS/list.o.d 
	@${RM} ${OBJECTDIR}/src/FreeRTOS/list.o 
	@${FIXDEPS} "${OBJECTDIR}/src/FreeRTOS/list.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/src/FreeRTOS/list.o.d" -o ${OBJECTDIR}/src/FreeRTOS/list.o src/FreeRTOS/list.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=c99 -I./include -I./include/OLED -I./include/FreeRTOS -I./include/FreeRTOS/portable
	
${OBJECTDIR}/src/FreeRTOS/portable/port.o: src/FreeRTOS/portable/port.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src/FreeRTOS/portable" 
	@${RM} ${OBJECTDIR}/src/FreeRTOS/portable/port.o.d 
	@${RM} ${OBJECTDIR}/src/FreeRTOS/portable/port.o 
	@${FIXDEPS} "${OBJECTDIR}/src/FreeRTOS/portable/port.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/src/FreeRTOS/portable/port.o.d" -o ${OBJECTDIR}/src/FreeRTOS/portable/port.o src/FreeRTOS/portable/port.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=c99 -I./include -I./include/OLED -I./include/FreeRTOS -I./include/FreeRTOS/portable
	
${OBJECTDIR}/src/FreeRTOS/queue.o: src/FreeRTOS/queue.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src/FreeRTOS" 
	@${RM} ${OBJECTDIR}/src/FreeRTOS/queue.o.d 
	@${RM} ${OBJECTDIR}/src/FreeRTOS/queue.o 
	@${FIXDEPS} "${OBJECTDIR}/src/FreeRTOS/queue.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/src/FreeRTOS/queue.o.d" -o ${OBJECTDIR}/src/FreeRTOS/queue.o src/FreeRTOS/queue.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=c99 -I./include -I./include/OLED -I./include/FreeRTOS -I./include/FreeRTOS/portable
	
${OBJECTDIR}/src/FreeRTOS/stream_buffer.o: src/FreeRTOS/stream_buffer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src/FreeRTOS" 
	@${RM} ${OBJECTDIR}/src/FreeRTOS/stream_buffer.o.d 
	@${RM} ${OBJECTDIR}/src/FreeRTOS/stream_buffer.o 
	@${FIXDEPS} "${OBJECTDIR}/src/FreeRTOS/stream_buffer.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/src/FreeRTOS/stream_buffer.o.d" -o ${OBJECTDIR}/src/FreeRTOS/stream_buffer.o src/FreeRTOS/stream_buffer.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=c99 -I./include -I./include/OLED -I./include/FreeRTOS -I./include/FreeRTOS/portable
	
${OBJECTDIR}/src/FreeRTOS/tasks.o: src/FreeRTOS/tasks.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src/FreeRTOS" 
	@${RM} ${OBJECTDIR}/src/FreeRTOS/tasks.o.d 
	@${RM} ${OBJECTDIR}/src/FreeRTOS/tasks.o 
	@${FIXDEPS} "${OBJECTDIR}/src/FreeRTOS/tasks.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/src/FreeRTOS/tasks.o.d" -o ${OBJECTDIR}/src/FreeRTOS/tasks.o src/FreeRTOS/tasks.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=c99 -I./include -I./include/OLED -I./include/FreeRTOS -I./include/FreeRTOS/portable
	
${OBJECTDIR}/src/FreeRTOS/timers.o: src/FreeRTOS/timers.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src/FreeRTOS" 
	@${RM} ${OBJECTDIR}/src/FreeRTOS/timers.o.d 
	@${RM} ${OBJECTDIR}/src/FreeRTOS/timers.o 
	@${FIXDEPS} "${OBJECTDIR}/src/FreeRTOS/timers.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/src/FreeRTOS/timers.o.d" -o ${OBJECTDIR}/src/FreeRTOS/timers.o src/FreeRTOS/timers.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=c99 -I./include -I./include/OLED -I./include/FreeRTOS -I./include/FreeRTOS/portable
	
${OBJECTDIR}/src/input.o: src/input.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/input.o.d 
	@${RM} ${OBJECTDIR}/src/input.o 
	@${FIXDEPS} "${OBJECTDIR}/src/input.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/src/input.o.d" -o ${OBJECTDIR}/src/input.o src/input.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=c99 -I./include -I./include/OLED -I./include/FreeRTOS -I./include/FreeRTOS/portable
	
${OBJECTDIR}/src/main.o: src/main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/main.o.d 
	@${RM} ${OBJECTDIR}/src/main.o 
	@${FIXDEPS} "${OBJECTDIR}/src/main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/src/main.o.d" -o ${OBJECTDIR}/src/main.o src/main.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=c99 -I./include -I./include/OLED -I./include/FreeRTOS -I./include/FreeRTOS/portable
	
${OBJECTDIR}/src/memset_zero.o: src/memset_zero.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/memset_zero.o.d 
	@${RM} ${OBJECTDIR}/src/memset_zero.o 
	@${FIXDEPS} "${OBJECTDIR}/src/memset_zero.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/src/memset_zero.o.d" -o ${OBJECTDIR}/src/memset_zero.o src/memset_zero.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=c99 -I./include -I./include/OLED -I./include/FreeRTOS -I./include/FreeRTOS/portable
	
${OBJECTDIR}/src/OLED/char_font.o: src/OLED/char_font.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src/OLED" 
	@${RM} ${OBJECTDIR}/src/OLED/char_font.o.d 
	@${RM} ${OBJECTDIR}/src/OLED/char_font.o 
	@${FIXDEPS} "${OBJECTDIR}/src/OLED/char_font.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/src/OLED/char_font.o.d" -o ${OBJECTDIR}/src/OLED/char_font.o src/OLED/char_font.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=c99 -I./include -I./include/OLED -I./include/FreeRTOS -I./include/FreeRTOS/portable
	
${OBJECTDIR}/src/OLED/fill_pattern.o: src/OLED/fill_pattern.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src/OLED" 
	@${RM} ${OBJECTDIR}/src/OLED/fill_pattern.o.d 
	@${RM} ${OBJECTDIR}/src/OLED/fill_pattern.o 
	@${FIXDEPS} "${OBJECTDIR}/src/OLED/fill_pattern.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/src/OLED/fill_pattern.o.d" -o ${OBJECTDIR}/src/OLED/fill_pattern.o src/OLED/fill_pattern.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=c99 -I./include -I./include/OLED -I./include/FreeRTOS -I./include/FreeRTOS/portable
	
${OBJECTDIR}/src/OLED/OLED.o: src/OLED/OLED.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src/OLED" 
	@${RM} ${OBJECTDIR}/src/OLED/OLED.o.d 
	@${RM} ${OBJECTDIR}/src/OLED/OLED.o 
	@${FIXDEPS} "${OBJECTDIR}/src/OLED/OLED.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/src/OLED/OLED.o.d" -o ${OBJECTDIR}/src/OLED/OLED.o src/OLED/OLED.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=c99 -I./include -I./include/OLED -I./include/FreeRTOS -I./include/FreeRTOS/portable
	
${OBJECTDIR}/src/OLED/OLED_char.o: src/OLED/OLED_char.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src/OLED" 
	@${RM} ${OBJECTDIR}/src/OLED/OLED_char.o.d 
	@${RM} ${OBJECTDIR}/src/OLED/OLED_char.o 
	@${FIXDEPS} "${OBJECTDIR}/src/OLED/OLED_char.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/src/OLED/OLED_char.o.d" -o ${OBJECTDIR}/src/OLED/OLED_char.o src/OLED/OLED_char.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=c99 -I./include -I./include/OLED -I./include/FreeRTOS -I./include/FreeRTOS/portable
	
${OBJECTDIR}/src/OLED/OLED_graphic.o: src/OLED/OLED_graphic.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src/OLED" 
	@${RM} ${OBJECTDIR}/src/OLED/OLED_graphic.o.d 
	@${RM} ${OBJECTDIR}/src/OLED/OLED_graphic.o 
	@${FIXDEPS} "${OBJECTDIR}/src/OLED/OLED_graphic.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/src/OLED/OLED_graphic.o.d" -o ${OBJECTDIR}/src/OLED/OLED_graphic.o src/OLED/OLED_graphic.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=c99 -I./include -I./include/OLED -I./include/FreeRTOS -I./include/FreeRTOS/portable
	
${OBJECTDIR}/src/OLED/SPI.o: src/OLED/SPI.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src/OLED" 
	@${RM} ${OBJECTDIR}/src/OLED/SPI.o.d 
	@${RM} ${OBJECTDIR}/src/OLED/SPI.o 
	@${FIXDEPS} "${OBJECTDIR}/src/OLED/SPI.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/src/OLED/SPI.o.d" -o ${OBJECTDIR}/src/OLED/SPI.o src/OLED/SPI.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=c99 -I./include -I./include/OLED -I./include/FreeRTOS -I./include/FreeRTOS/portable
	
${OBJECTDIR}/src/pin.o: src/pin.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/pin.o.d 
	@${RM} ${OBJECTDIR}/src/pin.o 
	@${FIXDEPS} "${OBJECTDIR}/src/pin.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/src/pin.o.d" -o ${OBJECTDIR}/src/pin.o src/pin.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=c99 -I./include -I./include/OLED -I./include/FreeRTOS -I./include/FreeRTOS/portable
	
${OBJECTDIR}/src/print.o: src/print.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/print.o.d 
	@${RM} ${OBJECTDIR}/src/print.o 
	@${FIXDEPS} "${OBJECTDIR}/src/print.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/src/print.o.d" -o ${OBJECTDIR}/src/print.o src/print.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=c99 -I./include -I./include/OLED -I./include/FreeRTOS -I./include/FreeRTOS/portable
	
${OBJECTDIR}/src/ray_cast.o: src/ray_cast.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/ray_cast.o.d 
	@${RM} ${OBJECTDIR}/src/ray_cast.o 
	@${FIXDEPS} "${OBJECTDIR}/src/ray_cast.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/src/ray_cast.o.d" -o ${OBJECTDIR}/src/ray_cast.o src/ray_cast.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=c99 -I./include -I./include/OLED -I./include/FreeRTOS -I./include/FreeRTOS/portable
	
${OBJECTDIR}/src/UART.o: src/UART.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/UART.o.d 
	@${RM} ${OBJECTDIR}/src/UART.o 
	@${FIXDEPS} "${OBJECTDIR}/src/UART.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/src/UART.o.d" -o ${OBJECTDIR}/src/UART.o src/UART.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=c99 -I./include -I./include/OLED -I./include/FreeRTOS -I./include/FreeRTOS/portable
	
${OBJECTDIR}/src/window.o: src/window.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/window.o.d 
	@${RM} ${OBJECTDIR}/src/window.o 
	@${FIXDEPS} "${OBJECTDIR}/src/window.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/src/window.o.d" -o ${OBJECTDIR}/src/window.o src/window.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=c99 -I./include -I./include/OLED -I./include/FreeRTOS -I./include/FreeRTOS/portable
	
${OBJECTDIR}/src/wolf3d.o: src/wolf3d.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/wolf3d.o.d 
	@${RM} ${OBJECTDIR}/src/wolf3d.o 
	@${FIXDEPS} "${OBJECTDIR}/src/wolf3d.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/src/wolf3d.o.d" -o ${OBJECTDIR}/src/wolf3d.o src/wolf3d.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=c99 -I./include -I./include/OLED -I./include/FreeRTOS -I./include/FreeRTOS/portable
	
${OBJECTDIR}/src/mem_manager.o: src/mem_manager.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/src" 
	@${RM} ${OBJECTDIR}/src/mem_manager.o.d 
	@${RM} ${OBJECTDIR}/src/mem_manager.o 
	@${FIXDEPS} "${OBJECTDIR}/src/mem_manager.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/src/mem_manager.o.d" -o ${OBJECTDIR}/src/mem_manager.o src/mem_manager.c    -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -std=c99 -I./include -I./include/OLED -I./include/FreeRTOS -I./include/FreeRTOS/portable
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/Wolf3D.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mdebugger -D__MPLAB_DEBUGGER_SIMULATOR=1 -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/Wolf3D.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)      -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--defsym=__MPLAB_DEBUGGER_SIMULATOR=1,--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/Wolf3D.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/Wolf3D.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--no-code-in-dinit,--no-dinit-in-serial-mem,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml
	${MP_CC_DIR}\\xc32-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/Wolf3D.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/default
	${RM} -r dist/default

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
