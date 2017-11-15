include nbproject/Makefile-variables.mk
include nbproject/Makefile-local-default.mk
include $(wildcard $(OBJ_DIR)/src/*.d)

ifeq ($(TYPE_IMAGE), DEBUG_RUN)
    BUILD_TYPE    := debug
    OUTPUT_SUFFIX := elf
else
    BUILD_TYPE    := production
    OUTPUT_SUFFIX := hex
endif

#  input
C_FILES := $(wildcard src/*.c)

#  output
OBJ_DIR := build/default/$(BUILD_TYPE)
OUT_DIR := dist/default/$(BUILD_TYPE)

OBJ_FILES      := $(addprefix $(OBJ_DIR)/, $(patsubst %.c, %.o, $(C_FILES)))
BASE_FILE_NAME := lab1-BasicIO.${BUILD_TYPE}
OUTPUT_FILE    := $(OUT_DIR)/$(BASE_FILE_NAME).${OUTPUT_SUFFIX}

#  command line
CMD_MKDIR := gnumkdir -p

#  compilation
CC    := $(MP_CC)
FLAGS := -I./include -g -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 \
	-fframe-base-loclist -x c -c -mprocessor=32MZ2048EFG100 \
	-DXPRJ_default=default -legacy-libc
ifneq ($(TYPE_IMAGE), DEBUG_RUN)
    LD_EMULATION_MODE :=
    LD_DEBUG_FLAGS    :=
else
    LD_EMULATION_MODE := -mdebugger
    LD_DEBUG_FLAGS    := -D__MPLAB_DEBUGGER_SIMULATOR=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D=__DEBUG_D,--defsym=__MPLAB_DEBUGGER_SIMULATOR=1
endif

all: $(OUTPUT_FILE)

$(OUTPUT_FILE): $(OBJ_DIR)/src $(OUT_DIR) $(OBJ_FILES)
	${CC} $(OBJ_FILES) -o $@ -mprocessor=32MZ2048EFG100 -legacy-libc $(LD_EMULATION_MODE) -Wl,--defsym=__MPLAB_BUILD=1,$(LD_DEBUG_FLAGS),--no-code-in-dinit,--no-dinit-in-serial-mem,-Map=$(OUT_DIR)/$(BASE_FILE_NAME).map,--memorysummary,$(OUT_DIR)/memoryfile.xml

$(OBJ_DIR)/src:
	$(CMD_MKDIR) $(OBJ_DIR)/src

$(OUT_DIR):
	$(CMD_MKDIR) $(OUT_DIR)

$(OBJ_DIR)/%.o: %.c
	$(CC) -c $(FLAGS) -MD -MF $@.d $< -o $@
